package android.os;
public class Environment {
    public static java.io.File getExternalStorageDirectory() { return new java.io.File(System.getProperty("java.io.tmpdir")); }
    public static String getExternalStorageState() { return "mounted"; }
}
