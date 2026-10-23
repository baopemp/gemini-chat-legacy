import java.io.*;
import java.net.*;
import java.security.MessageDigest;
import java.util.Base64;

/** Loopback WebSocket server exercising LiveSocket: handshake, ping, fragmented text, 64-bit length, masked echo, close code. */
public class WsLoopback {
    public static boolean run() throws Exception {
        final ServerSocket ss = new ServerSocket(0, 1, InetAddress.getByName("127.0.0.1"));
        final String[] serverErr = {null};
        final String[] got = new String[1];
        Thread t = new Thread() { public void run() {
            try (Socket c = ss.accept()) {
                InputStream in = c.getInputStream(); OutputStream out = c.getOutputStream();
                String key = null, line; BufferedReader r = new BufferedReader(new InputStreamReader(in, "ISO-8859-1"));
                boolean hasApiKey = false;
                while ((line = r.readLine()) != null && line.length() > 0) {
                    if (line.toLowerCase().startsWith("sec-websocket-key:")) key = line.substring(18).trim();
                    if (line.equals("x-goog-api-key: K")) hasApiKey = true;
                }
                if (!hasApiKey) serverErr[0] = "no api key header";
                String acc = Base64.getEncoder().encodeToString(MessageDigest.getInstance("SHA-1").digest((key + "258EAFA5-E914-47DA-95CA-C5AB0DC85B11").getBytes("ISO-8859-1")));
                out.write(("HTTP/1.1 101 Switching Protocols\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Accept: " + acc + "\r\n\r\n").getBytes("ISO-8859-1"));
                out.write(new byte[]{(byte) 0x89, 2, 'h', 'i'});                 // ping
                out.write(new byte[]{0x01, 3, 'H', 'e', 'l'});                   // text, not final
                out.write(new byte[]{(byte) 0x80, 2, 'l', 'o'});                 // continuation, final
                byte[] big = new byte[70000]; for (int i = 0; i < big.length; i++) big[i] = (byte) ('a' + i % 26);
                ByteArrayOutputStream f = new ByteArrayOutputStream(); f.write(0x82); f.write(127);
                for (int i = 7; i >= 0; i--) f.write((int) ((long) big.length >>> (8 * i)) & 0xFF); f.write(big); out.write(f.toByteArray());
                out.flush();
                // read pong (masked) and then the client's masked text frame
                DataInputStream d = new DataInputStream(in);
                for (int k = 0; k < 2; k++) {
                    int b0 = d.read(), b1 = d.read(); int len = b1 & 0x7F;
                    if (len == 126) len = d.readUnsignedShort();
                    if ((b1 & 0x80) == 0) serverErr[0] = "client frame not masked";
                    byte[] mk = new byte[4]; d.readFully(mk); byte[] p = new byte[len]; d.readFully(p);
                    for (int i = 0; i < len; i++) p[i] ^= mk[i & 3];
                    if ((b0 & 0x0F) == 0xA && !new String(p).equals("hi")) serverErr[0] = "bad pong";
                    if ((b0 & 0x0F) == 0x1) got[0] = new String(p, "UTF-8");
                }
                byte[] reason = "API key not valid".getBytes("UTF-8");
                ByteArrayOutputStream cl = new ByteArrayOutputStream(); cl.write(0x88); cl.write(2 + reason.length); cl.write(0x03); cl.write(0xF0); cl.write(reason);
                out.write(cl.toByteArray()); out.flush();
                Thread.sleep(200);
            } catch (Exception e) { serverErr[0] = e.toString(); }
        }};
        t.start();
        com.gemini.chat.LiveSocket ws = new com.gemini.chat.LiveSocket();
        ws.connect("ws://127.0.0.1:" + ss.getLocalPort() + "/ws/path?x=1", new String[]{"x-goog-api-key", "K"}, 5000);
        String m1 = ws.receive(), m2 = ws.receive();
        String payload = "{\"text\":\"Xin chào " + "x".repeat(300) + "\"}";
        ws.send(payload);
        String m3 = ws.receive();
        t.join(5000); ss.close();
        boolean ok = "Hello".equals(m1) && m2 != null && m2.length() == 70000 && m2.startsWith("abcdefghijklmnopqrstuvwxyzab")
                && m3 == null && ws.closeCode == 1008 && "API key not valid".equals(ws.closeReason)
                && payload.equals(got[0]) && serverErr[0] == null;
        if (!ok) System.out.println("  ws: m1=" + m1 + " m2len=" + (m2 == null ? -1 : m2.length()) + " m3=" + m3 + " code=" + ws.closeCode + " reason=" + ws.closeReason + " echo=" + (payload.equals(got[0])) + " err=" + serverErr[0]);
        return ok;
    }
}
