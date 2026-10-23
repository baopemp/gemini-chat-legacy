import com.gemini.chat.LiveSession;
import com.gemini.chat.LiveSocket;
import java.io.*;
import java.security.cert.X509Certificate;
import java.util.*;
import javax.net.ssl.*;

/**
 * Drives the app's LiveSession against the real Live API from a desktop JVM (no device needed).
 *   GEMINI_KEY=... java LiveCheck <model> <voice> <ptt|free> (text "..." | audio file.pcm16k) [out.pcm] [history]
 * Prints every event; writes the model's 24 kHz PCM to out.pcm.
 */
public class LiveCheck {
    public static void main(String[] a) throws Exception {
        // Java SE's default HostnameVerifier rejects everything; check the certificate's DNS names instead.
        LiveSocket.hostnameVerifier = new HostnameVerifier() {
            public boolean verify(String host, SSLSession s) {
                try {
                    X509Certificate c = (X509Certificate) s.getPeerCertificates()[0];
                    for (List<?> san : c.getSubjectAlternativeNames()) {
                        String n = String.valueOf(san.get(1));
                        if (n.equals(host) || (n.startsWith("*.") && host.endsWith(n.substring(1)) && host.indexOf('.') == host.length() - n.length() + 1)) return true;
                    }
                } catch (Exception e) { }
                return false;
            }
        };
        final String model = a[0], voice = a[1], mode = a[2], kind = a[3], arg = a[4];
        final String outFile = a.length > 5 ? a[5] : null;
        final ByteArrayOutputStream audio = new ByteArrayOutputStream();
        final long t0 = System.currentTimeMillis();
        final Object done = new Object();
        final boolean[] finished = {false};
        final StringBuilder in = new StringBuilder(), out = new StringBuilder();
        final LiveSession[] ref = new LiveSession[1];
        LiveSession.Listener l = new LiveSession.Listener() {
            int chunks;
            public void onReady() {
                System.out.println(t(t0) + " READY");
                new Thread() { public void run() {
                    try {
                        if (kind.equals("text")) { ref[0].sendText(arg); return; }
                        byte[] pcm = readAll(new File(arg));
                        if (mode.equals("ptt")) ref[0].activityStart();
                        for (int i = 0; i < pcm.length; i += 3200) {  // 100 ms chunks at 16 kHz, real time
                            ref[0].sendAudio(pcm, i, Math.min(3200, pcm.length - i), 16000);
                            Thread.sleep(100);
                        }
                        if (mode.equals("ptt")) ref[0].activityEnd();
                        else { byte[] sil = new byte[3200]; for (int i = 0; i < 15; i++) { ref[0].sendAudio(sil, 0, 3200, 16000); Thread.sleep(100); } }
                    } catch (Exception e) { e.printStackTrace(); }
                }}.start();
            }
            public void onAudio(byte[] pcm) { if (chunks++ == 0) System.out.println(t(t0) + " first audio chunk " + pcm.length + " B"); audio.write(pcm, 0, pcm.length); }
            public void onInputText(String d) { in.append(d); System.out.println(t(t0) + " IN  +" + q(d)); }
            public void onInterimInput(String d) { System.out.println(t(t0) + " INTERIM " + q(d)); }
            public void onOutputText(String d) { out.append(d); System.out.println(t(t0) + " OUT +" + q(d)); }
            public void onTurnComplete() {
                System.out.println(t(t0) + " TURN COMPLETE: audio " + audio.size() + " B = " + (audio.size() / 48) + " ms");
                synchronized (done) { finished[0] = true; done.notifyAll(); }
            }
            public void onInterrupted() { System.out.println(t(t0) + " INTERRUPTED"); }
            public void onClosed(String err) {
                System.out.println(t(t0) + " CLOSED " + (err == null ? "(normal)" : err));
                synchronized (done) { finished[0] = true; done.notifyAll(); }
            }
        };
        LiveSession s = new LiveSession(System.getenv("GEMINI_KEY"), model, voice,
                "Be brief. Answer in one short sentence.\n\nCurrent date and time: test run", mode.equals("free"), l);
        if (a.length > 6) s.history = new String[][]{{"user", "My cat is called Mochi."}, {"model", "Nice, Mochi is a cute name."}};
        if (LiveSession.needsThinkingLevel(model)) s.thinkingLevel = System.getProperty("thinking", "low");
        ref[0] = s;
        s.start();
        synchronized (done) { long end = System.currentTimeMillis() + 60000; while (!finished[0] && System.currentTimeMillis() < end) done.wait(1000); }
        s.stop();
        Thread.sleep(300);
        System.out.println("INPUT  TRANSCRIPT: " + q(in.toString()));
        System.out.println("OUTPUT TRANSCRIPT: " + q(out.toString()));
        if (outFile != null) { FileOutputStream f = new FileOutputStream(outFile); f.write(audio.toByteArray()); f.close(); }
    }
    static String t(long t0) { return String.format("%6d ms", System.currentTimeMillis() - t0); }
    static String q(String s) { return "\"" + s.replace("\n", "\\n") + "\""; }
    static byte[] readAll(File f) throws IOException { byte[] b = new byte[(int) f.length()]; DataInputStream d = new DataInputStream(new FileInputStream(f)); d.readFully(b); d.close(); return b; }
}
