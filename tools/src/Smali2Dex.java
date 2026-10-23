import java.io.File;
import brut.androlib.src.SmaliBuilder;
import brut.directory.ExtFile;

/** smali dir -> classes.dex with the assembler bundled in apktool.jar (used to give javac a classpath of the hand-written smali). */
public class Smali2Dex {
    public static void main(String[] a) throws Exception {
        SmaliBuilder.build(new ExtFile(new File(a[0])), new File(a[1]), 15);
    }
}
