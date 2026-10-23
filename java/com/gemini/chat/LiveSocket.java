package com.gemini.chat;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.ProxySelector;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.URI;
import java.security.MessageDigest;
import java.util.List;
import java.util.Random;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;

/**
 * Minimal RFC 6455 WebSocket client (Android 2.1 has none). wss:// or ws://, client frames masked, text messages out,
 * text or binary messages in (returned as UTF-8 strings: the Live API sends JSON). Uses the system HTTPS socket factory
 * (so TLSSocketFactory's TLS 1.2 on API 16-19 applies), the default hostname verifier, and an HTTP proxy (CONNECT)
 * if the system ProxySelector returns one. Not thread-safe for reading; send() may be called from any thread.
 */
public final class LiveSocket {
    private static final String GUID = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11";
    private static final int MAX_MESSAGE = 16 * 1024 * 1024;

    /** Overridable for JVM tests (Java SE's default verifier rejects everything). */
    public static HostnameVerifier hostnameVerifier;

    private Socket socket;
    private InputStream in;
    private OutputStream out;
    private final Random random = new Random();
    private volatile boolean closed;
    public volatile int closeCode = 0;
    public volatile String closeReason = "";

    /** Opens the connection and completes the handshake. extraHeaders: alternating name, value. */
    public void connect(String url, String[] extraHeaders, int timeoutMs) throws IOException {
        URI u;
        try {
            u = new URI(url);
        } catch (Exception e) {
            throw new IOException("Bad URL: " + url);
        }
        boolean tls = "wss".equals(u.getScheme());
        String host = u.getHost();
        int port = u.getPort() > 0 ? u.getPort() : (tls ? 443 : 80);
        String path = (u.getRawPath() == null || u.getRawPath().length() == 0 ? "/" : u.getRawPath())
                + (u.getRawQuery() != null ? "?" + u.getRawQuery() : "");

        Socket raw = new Socket();
        InetSocketAddress proxy = proxyFor(tls, host, port);
        if (proxy != null) {
            raw.connect(proxy, timeoutMs);
            raw.setSoTimeout(timeoutMs);
            OutputStream po = raw.getOutputStream();
            po.write(("CONNECT " + host + ":" + port + " HTTP/1.1\r\nHost: " + host + ":" + port + "\r\n\r\n").getBytes("ISO-8859-1"));
            po.flush();
            InputStream pi = raw.getInputStream();
            String status = readLine(pi);
            while (readLine(pi).length() > 0) {
                // skip proxy response headers
            }
            if (status.indexOf(" 200") < 0) {
                raw.close();
                throw new IOException("Proxy refused CONNECT: " + status);
            }
        } else {
            raw.connect(new InetSocketAddress(host, port), timeoutMs);
        }
        raw.setSoTimeout(timeoutMs);
        raw.setTcpNoDelay(true);

        Socket s = raw;
        if (tls) {
            SSLSocketFactory f = HttpsURLConnection.getDefaultSSLSocketFactory();
            SSLSocket ssl = (SSLSocket) f.createSocket(raw, host, port, true);
            enableSni(ssl, host);
            ssl.startHandshake();
            HostnameVerifier hv = hostnameVerifier != null ? hostnameVerifier : HttpsURLConnection.getDefaultHostnameVerifier();
            if (!hv.verify(host, ssl.getSession())) {
                ssl.close();
                throw new IOException("TLS certificate does not match " + host);
            }
            s = ssl;
        }
        socket = s;
        in = new BufferedInputStream(s.getInputStream(), 16384);
        out = s.getOutputStream();

        byte[] nonce = new byte[16];
        random.nextBytes(nonce);
        String key = B64.encode(nonce);
        StringBuffer req = new StringBuffer();
        req.append("GET ").append(path).append(" HTTP/1.1\r\n")
                .append("Host: ").append(host).append(port != (tls ? 443 : 80) ? ":" + port : "").append("\r\n")
                .append("Upgrade: websocket\r\nConnection: Upgrade\r\n")
                .append("Sec-WebSocket-Key: ").append(key).append("\r\n")
                .append("Sec-WebSocket-Version: 13\r\n");
        if (extraHeaders != null) {
            for (int i = 0; i + 1 < extraHeaders.length; i += 2) {
                req.append(extraHeaders[i]).append(": ").append(extraHeaders[i + 1]).append("\r\n");
            }
        }
        req.append("\r\n");
        out.write(req.toString().getBytes("UTF-8"));
        out.flush();

        String status = readLine(in);
        String accept = null;
        int contentLength = -1;
        String line;
        while ((line = readLine(in)).length() > 0) {
            int c = line.indexOf(':');
            if (c <= 0) continue;
            String name = line.substring(0, c).trim().toLowerCase();
            String value = line.substring(c + 1).trim();
            if ("sec-websocket-accept".equals(name)) accept = value;
            else if ("content-length".equals(name)) {
                try {
                    contentLength = Integer.parseInt(value);
                } catch (NumberFormatException ignored) {
                }
            }
        }
        if (status.indexOf(" 101") < 0) {
            String body = "";
            if (contentLength > 0 && contentLength < 65536) {
                byte[] b = new byte[contentLength];
                readFully(in, b, 0, contentLength);
                body = new String(b, "UTF-8");
            }
            close();
            throw new IOException("WebSocket handshake failed: " + status + (body.length() > 0 ? "\n" + body : ""));
        }
        if (accept == null || !accept.equals(acceptFor(key))) {
            close();
            throw new IOException("WebSocket handshake failed: bad Sec-WebSocket-Accept");
        }
        socket.setSoTimeout(0); // reads block until data or close
    }

    /**
     * Android's layered SSLSocket only sends SNI when asked (HttpsURLConnection does this internally). Google answers
     * without SNI too, but TLS proxies/middleboxes may not. setHostname exists on Android's OpenSSL sockets; the JVM
     * sends SNI by itself, so a missing method is ignored.
     */
    private static void enableSni(SSLSocket s, String host) {
        try {
            s.getClass().getMethod("setHostname", new Class[]{String.class}).invoke(s, new Object[]{host});
        } catch (Throwable ignored) {
        }
    }

    static String acceptFor(String key) {
        try {
            MessageDigest sha1 = MessageDigest.getInstance("SHA-1");
            return B64.encode(sha1.digest((key + GUID).getBytes("ISO-8859-1")));
        } catch (Exception e) {
            return "";
        }
    }

    private static InetSocketAddress proxyFor(boolean tls, String host, int port) {
        try {
            List<Proxy> l = ProxySelector.getDefault().select(new URI((tls ? "https" : "http") + "://" + host + ":" + port + "/"));
            for (int i = 0; l != null && i < l.size(); i++) {
                Proxy p = l.get(i);
                SocketAddress a = p.address();
                if (p.type() == Proxy.Type.HTTP && a instanceof InetSocketAddress) {
                    InetSocketAddress ia = (InetSocketAddress) a;
                    // unresolved address (system property proxy): resolve now
                    return ia.isUnresolved() ? new InetSocketAddress(ia.getHostName(), ia.getPort()) : ia;
                }
            }
        } catch (Exception ignored) {
        }
        return null;
    }

    private static String readLine(InputStream in) throws IOException {
        StringBuffer sb = new StringBuffer();
        int c;
        while ((c = in.read()) != -1) {
            if (c == '\n') break;
            if (c != '\r') sb.append((char) c);
            if (sb.length() > 16384) throw new IOException("Header line too long");
        }
        if (c == -1 && sb.length() == 0) throw new IOException("Connection closed during handshake");
        return sb.toString();
    }

    private static void readFully(InputStream in, byte[] b, int off, int len) throws IOException {
        while (len > 0) {
            int n = in.read(b, off, len);
            if (n < 0) throw new IOException("Connection closed");
            off += n;
            len -= n;
        }
    }

    // ---- sending ------------------------------------------------------------------------------

    public void send(String text) throws IOException {
        sendFrame(0x1, text.getBytes("UTF-8"));
    }

    private void sendFrame(int opcode, byte[] payload) throws IOException {
        int len = payload.length;
        int hl = len < 126 ? 2 : len < 65536 ? 4 : 10;
        byte[] f = new byte[hl + 4 + len];
        f[0] = (byte) (0x80 | opcode);
        if (len < 126) {
            f[1] = (byte) (0x80 | len);
        } else if (len < 65536) {
            f[1] = (byte) (0x80 | 126);
            f[2] = (byte) (len >>> 8);
            f[3] = (byte) len;
        } else {
            f[1] = (byte) (0x80 | 127);
            for (int i = 0; i < 8; i++) f[2 + i] = (byte) (i < 4 ? 0 : len >>> (8 * (7 - i)));
        }
        int mask = random.nextInt();
        byte[] m = {(byte) (mask >>> 24), (byte) (mask >>> 16), (byte) (mask >>> 8), (byte) mask};
        System.arraycopy(m, 0, f, hl, 4);
        for (int i = 0; i < len; i++) f[hl + 4 + i] = (byte) (payload[i] ^ m[i & 3]);
        OutputStream o = out;
        if (o == null || closed) throw new IOException("WebSocket closed");
        synchronized (this) {
            o.write(f);
            o.flush();
        }
    }

    // ---- receiving ----------------------------------------------------------------------------

    /** Next text/binary message as a UTF-8 string, or null once the connection is closed (see closeCode/closeReason). */
    public String receive() throws IOException {
        ByteArrayOutputStream msg = null;
        byte[] hdr = new byte[8];
        while (true) {
            int b0 = in.read();
            if (b0 < 0) {
                closed = true;
                return null;
            }
            readFully(in, hdr, 0, 1);
            boolean fin = (b0 & 0x80) != 0;
            int op = b0 & 0x0F;
            boolean masked = (hdr[0] & 0x80) != 0;
            long len = hdr[0] & 0x7F;
            if (len == 126) {
                readFully(in, hdr, 0, 2);
                len = ((hdr[0] & 0xFF) << 8) | (hdr[1] & 0xFF);
            } else if (len == 127) {
                readFully(in, hdr, 0, 8);
                len = 0;
                for (int i = 0; i < 8; i++) len = (len << 8) | (hdr[i] & 0xFF);
            }
            if (len < 0 || len > MAX_MESSAGE) throw new IOException("WebSocket frame too large: " + len);
            byte[] mk = null;
            if (masked) {
                mk = new byte[4];
                readFully(in, mk, 0, 4);
            }
            byte[] p = new byte[(int) len];
            readFully(in, p, 0, p.length);
            if (mk != null) for (int i = 0; i < p.length; i++) p[i] ^= mk[i & 3];

            if (op == 0x8) { // close
                closeCode = p.length >= 2 ? ((p[0] & 0xFF) << 8) | (p[1] & 0xFF) : 1005;
                closeReason = p.length > 2 ? new String(p, 2, p.length - 2, "UTF-8") : "";
                try {
                    if (!closed) sendFrame(0x8, p.length >= 2 ? new byte[]{p[0], p[1]} : new byte[0]);
                } catch (IOException ignored) {
                }
                closed = true;
                closeSocket();
                return null;
            } else if (op == 0x9) { // ping
                try {
                    sendFrame(0xA, p);
                } catch (IOException ignored) {
                }
            } else if (op == 0xA) {
                // pong: ignore
            } else if (op == 0x1 || op == 0x2 || op == 0x0) {
                if (msg == null) msg = new ByteArrayOutputStream(p.length);
                msg.write(p, 0, p.length);
                if (msg.size() > MAX_MESSAGE) throw new IOException("WebSocket message too large");
                if (fin) return new String(msg.toByteArray(), "UTF-8");
            }
        }
    }

    public boolean isClosed() {
        return closed;
    }

    /** Sends a normal close (1000) and closes the socket. Safe to call more than once, from any thread. */
    public void close() {
        if (!closed && out != null) {
            try {
                sendFrame(0x8, new byte[]{0x03, (byte) 0xE8});
            } catch (Exception ignored) {
            }
        }
        closed = true;
        closeSocket();
    }

    private void closeSocket() {
        Socket s = socket;
        if (s != null) {
            try {
                s.close();
            } catch (Exception ignored) {
            }
        }
    }
}
