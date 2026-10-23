package com.gemini.chat;

import java.io.BufferedInputStream;
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

/* loaded from: classes.dex */
public final class LiveSocket {
    private static final String GUID = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11";
    private static final int MAX_MESSAGE = 16777216;
    public static HostnameVerifier hostnameVerifier;
    private volatile boolean closed;
    private InputStream in;
    private OutputStream out;
    private Socket socket;
    private final Random random = new Random();
    public volatile int closeCode = 0;
    public volatile String closeReason = "";

    public void connect(String str, String[] strArr, int i) throws IOException {
        int i2;
        String str2;
        try {
            URI uri = new URI(str);
            boolean equals = "wss".equals(uri.getScheme());
            String host = uri.getHost();
            if (uri.getPort() > 0) {
                i2 = uri.getPort();
            } else {
                i2 = equals ? 443 : 80;
            }
            String str3 = ((uri.getRawPath() == null || uri.getRawPath().length() == 0) ? "/" : uri.getRawPath()) + (uri.getRawQuery() != null ? "?" + uri.getRawQuery() : "");
            Socket socket = new Socket();
            InetSocketAddress proxyFor = proxyFor(equals, host, i2);
            if (proxyFor != null) {
                socket.connect(proxyFor, i);
                socket.setSoTimeout(i);
                OutputStream outputStream = socket.getOutputStream();
                outputStream.write(("CONNECT " + host + ":" + i2 + " HTTP/1.1\r\nHost: " + host + ":" + i2 + "\r\n\r\n").getBytes("ISO-8859-1"));
                outputStream.flush();
                InputStream inputStream = socket.getInputStream();
                String readLine = readLine(inputStream);
                while (readLine(inputStream).length() > 0) {
                }
                if (readLine.indexOf(" 200") < 0) {
                    socket.close();
                    throw new IOException("Proxy refused CONNECT: " + readLine);
                }
            } else {
                socket.connect(new InetSocketAddress(host, i2), i);
            }
            socket.setSoTimeout(i);
            socket.setTcpNoDelay(true);
            Socket socket2 = socket;
            if (equals) {
                SSLSocket sSLSocket = (SSLSocket) HttpsURLConnection.getDefaultSSLSocketFactory().createSocket(socket, host, i2, true);
                enableSni(sSLSocket, host);
                sSLSocket.startHandshake();
                boolean verify = (hostnameVerifier != null ? hostnameVerifier : HttpsURLConnection.getDefaultHostnameVerifier()).verify(host, sSLSocket.getSession());
                socket2 = sSLSocket;
                if (!verify) {
                    sSLSocket.close();
                    throw new IOException("TLS certificate does not match " + host);
                }
            }
            this.socket = socket2;
            this.in = new BufferedInputStream(socket2.getInputStream(), 16384);
            this.out = socket2.getOutputStream();
            byte[] bArr = new byte[16];
            this.random.nextBytes(bArr);
            String encode = B64.encode(bArr);
            StringBuffer stringBuffer = new StringBuffer();
            stringBuffer.append("GET ").append(str3).append(" HTTP/1.1\r\n").append("Host: ").append(host).append(i2 != (equals ? 443 : 80) ? ":" + i2 : "").append("\r\n").append("Upgrade: websocket\r\nConnection: Upgrade\r\n").append("Sec-WebSocket-Key: ").append(encode).append("\r\n").append("Sec-WebSocket-Version: 13\r\n");
            if (strArr != null) {
                for (int i3 = 0; i3 + 1 < strArr.length; i3 += 2) {
                    stringBuffer.append(strArr[i3]).append(": ").append(strArr[i3 + 1]).append("\r\n");
                }
            }
            stringBuffer.append("\r\n");
            this.out.write(stringBuffer.toString().getBytes("UTF-8"));
            this.out.flush();
            String readLine2 = readLine(this.in);
            String str4 = null;
            int i4 = -1;
            while (true) {
                String readLine3 = readLine(this.in);
                if (readLine3.length() <= 0) {
                    break;
                }
                int indexOf = readLine3.indexOf(58);
                if (indexOf > 0) {
                    String lowerCase = readLine3.substring(0, indexOf).trim().toLowerCase();
                    String trim = readLine3.substring(indexOf + 1).trim();
                    if (!"sec-websocket-accept".equals(lowerCase)) {
                        if ("content-length".equals(lowerCase)) {
                            try {
                                i4 = Integer.parseInt(trim);
                                trim = str4;
                            } catch (NumberFormatException e) {
                                trim = str4;
                            }
                        } else {
                            trim = str4;
                        }
                    }
                    str4 = trim;
                }
            }
            if (readLine2.indexOf(" 101") < 0) {
                if (i4 <= 0 || i4 >= 65536) {
                    str2 = "";
                } else {
                    byte[] bArr2 = new byte[i4];
                    readFully(this.in, bArr2, 0, i4);
                    str2 = new String(bArr2, "UTF-8");
                }
                close();
                throw new IOException("WebSocket handshake failed: " + readLine2 + (str2.length() > 0 ? "\n" + str2 : ""));
            }
            if (str4 == null || !str4.equals(acceptFor(encode))) {
                close();
                throw new IOException("WebSocket handshake failed: bad Sec-WebSocket-Accept");
            }
            this.socket.setSoTimeout(0);
        } catch (Exception e2) {
            throw new IOException("Bad URL: " + str);
        }
    }

    private static void enableSni(SSLSocket sSLSocket, String str) {
        try {
            sSLSocket.getClass().getMethod("setHostname", String.class).invoke(sSLSocket, str);
        } catch (Throwable th) {
        }
    }

    static String acceptFor(String str) {
        try {
            return B64.encode(MessageDigest.getInstance("SHA-1").digest((str + GUID).getBytes("ISO-8859-1")));
        } catch (Exception e) {
            return "";
        }
    }

    private static InetSocketAddress proxyFor(boolean z, String str, int i) {
        try {
            List<Proxy> select = ProxySelector.getDefault().select(new URI((z ? "https" : "http") + "://" + str + ":" + i + "/"));
            for (int i2 = 0; select != null && i2 < select.size(); i2++) {
                Proxy proxy = select.get(i2);
                SocketAddress address = proxy.address();
                if (proxy.type() == Proxy.Type.HTTP && (address instanceof InetSocketAddress)) {
                    InetSocketAddress inetSocketAddress = (InetSocketAddress) address;
                    return inetSocketAddress.isUnresolved() ? new InetSocketAddress(inetSocketAddress.getHostName(), inetSocketAddress.getPort()) : inetSocketAddress;
                }
            }
        } catch (Exception e) {
        }
        return null;
    }

    private static String readLine(InputStream inputStream) throws IOException {
        StringBuffer stringBuffer = new StringBuffer();
        do {
            int read = inputStream.read();
            if (read != -1 && read != 10) {
                if (read != 13) {
                    stringBuffer.append((char) read);
                }
            } else {
                if (read == -1 && stringBuffer.length() == 0) {
                    throw new IOException("Connection closed during handshake");
                }
                return stringBuffer.toString();
            }
        } while (stringBuffer.length() <= 16384);
        throw new IOException("Header line too long");
    }

    private static void readFully(InputStream inputStream, byte[] bArr, int i, int i2) throws IOException {
        while (i2 > 0) {
            int read = inputStream.read(bArr, i, i2);
            if (read < 0) {
                throw new IOException("Connection closed");
            }
            i += read;
            i2 -= read;
        }
    }

    public void send(String str) throws IOException {
        sendFrame(1, str.getBytes("UTF-8"));
    }

    private void sendFrame(int i, byte[] bArr) throws IOException {
        int i2;
        int length = bArr.length;
        if (length < 126) {
            i2 = 2;
        } else {
            i2 = length < 65536 ? 4 : 10;
        }
        byte[] bArr2 = new byte[i2 + 4 + length];
        bArr2[0] = (byte) (i | 128);
        if (length < 126) {
            bArr2[1] = (byte) (length | 128);
        } else if (length < 65536) {
            bArr2[1] = -2;
            bArr2[2] = (byte) (length >>> 8);
            bArr2[3] = (byte) length;
        } else {
            bArr2[1] = -1;
            int i3 = 0;
            while (i3 < 8) {
                bArr2[i3 + 2] = (byte) (i3 < 4 ? 0 : length >>> ((7 - i3) * 8));
                i3++;
            }
        }
        int nextInt = this.random.nextInt();
        byte[] bArr3 = {(byte) (nextInt >>> 24), (byte) (nextInt >>> 16), (byte) (nextInt >>> 8), (byte) nextInt};
        System.arraycopy(bArr3, 0, bArr2, i2, 4);
        for (int i4 = 0; i4 < length; i4++) {
            bArr2[i2 + 4 + i4] = (byte) (bArr[i4] ^ bArr3[i4 & 3]);
        }
        OutputStream outputStream = this.out;
        if (outputStream == null || this.closed) {
            throw new IOException("WebSocket closed");
        }
        synchronized (this) {
            outputStream.write(bArr2);
            outputStream.flush();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:42:0x0131, code lost:
    
        r0 = new java.io.ByteArrayOutputStream(r4.length);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.String receive() throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 353
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.gemini.chat.LiveSocket.receive():java.lang.String");
    }

    public boolean isClosed() {
        return this.closed;
    }

    public void close() {
        if (!this.closed && this.out != null) {
            try {
                sendFrame(8, new byte[]{3, -24});
            } catch (Exception e) {
            }
        }
        this.closed = true;
        closeSocket();
    }

    private void closeSocket() {
        Socket socket = this.socket;
        if (socket != null) {
            try {
                socket.close();
            } catch (Exception e) {
            }
        }
    }
}
