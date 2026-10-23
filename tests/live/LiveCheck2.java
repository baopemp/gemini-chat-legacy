import com.gemini.chat.LiveSession;
import com.gemini.chat.LiveSocket;
import java.io.*;
import java.util.*;
import javax.net.ssl.*;

/** Real-API checks for 0.8.7: session resumption (main model) and the live transcriber (interim text while speaking).
 *  GEMINI_KEY=... java LiveCheck2 resume | transcribe file.pcm16k [ptt|free] */
public class LiveCheck2 {
    static final long T0 = System.currentTimeMillis();
    static String t() { return String.format("%6d ms ", System.currentTimeMillis() - T0); }

    static class L implements LiveSession.Listener {
        final StringBuilder out = new StringBuilder();
        volatile boolean ready, turn, closed;
        public void onReady() { ready = true; System.out.println(t() + "READY"); }
        public void onAudio(byte[] pcm) { }
        public void onInputText(String d) { System.out.println(t() + "FINAL   " + d); }
        public void onInterimInput(String d) { System.out.println(t() + "INTERIM " + d); }
        public void onOutputText(String d) { out.append(d); }
        public void onTurnComplete() { turn = true; System.out.println(t() + "TURN: " + out); }
        public void onInterrupted() { }
        public void onClosed(String e) { closed = true; System.out.println(t() + "CLOSED " + e); }
    }

    static void await(java.util.concurrent.Callable<Boolean> c, long ms) throws Exception {
        long end = System.currentTimeMillis() + ms;
        while (!c.call() && System.currentTimeMillis() < end) Thread.sleep(50);
    }

    public static void main(String[] a) throws Exception {
        LiveSocket.hostnameVerifier = new HostnameVerifier() { public boolean verify(String h, SSLSession s) { return h.endsWith("googleapis.com"); } };
        String key = System.getenv("GEMINI_KEY");
        if (a[0].equals("resume")) {
            final L l1 = new L();
            LiveSession s1 = new LiveSession(key, "gemini-3.8-live", "Kore", "Be brief.", false, l1);
            s1.start();
            await(() -> l1.ready, 15000);
            s1.sendText("Remember this secret number: 4721. Reply only with OK.");
            await(() -> l1.turn, 30000);
            Thread.sleep(500);
            String h = s1.lastHandle;
            System.out.println(t() + "handle: " + (h == null ? null : h.substring(0, Math.min(24, h.length())) + "..."));
            s1.stop();
            final L l2 = new L();
            LiveSession s2 = new LiveSession(key, "gemini-3.8-live", "Kore", "Be brief.", false, l2);
            s2.resumeHandle = h;
            s2.start();
            await(() -> l2.ready || l2.closed, 15000);
            s2.sendText("What was the secret number?");
            await(() -> l2.turn || l2.closed, 30000);
            s2.stop();
            System.out.println("RESUMED ANSWER: " + l2.out);
        } else {
            boolean ptt = a.length < 3 || a[2].equals("ptt");
            final L l = new L();
            final LiveSession s = LiveSession.transcriber(key, !ptt, l);
            s.start();
            await(() -> l.ready, 15000);
            byte[] pcm = new byte[(int) new File(a[1]).length()];
            DataInputStream d = new DataInputStream(new FileInputStream(a[1])); d.readFully(pcm); d.close();
            if (ptt) s.activityStart();
            for (int i = 0; i < pcm.length; i += 3200) { s.sendAudio(pcm, i, Math.min(3200, pcm.length - i), 16000); Thread.sleep(100); }
            System.out.println(t() + "audio done");
            if (ptt) s.activityEnd(); else s.audioStreamEnd();
            Thread.sleep(3000);
            s.stop();
        }
    }
}
