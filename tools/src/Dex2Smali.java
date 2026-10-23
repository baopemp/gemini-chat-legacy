import java.io.File;
import org.jf.baksmali.Baksmali;
import org.jf.baksmali.BaksmaliOptions;
import java.nio.file.Files;
import org.jf.dexlib2.Opcodes;
import org.jf.dexlib2.dexbacked.DexBackedDexFile;

/** dex -> smali with the baksmali bundled in apktool.jar, so the output matches apktool's assembler. */
public class Dex2Smali {
    public static void main(String[] a) throws Exception {
        DexBackedDexFile dex = new DexBackedDexFile(Opcodes.forApi(15), Files.readAllBytes(new File(a[0]).toPath()));
        BaksmaliOptions o = new BaksmaliOptions();
        o.apiLevel = 15;
        o.localsDirective = true;
        o.sequentialLabels = true;
        o.debugInfo = true;
        if (!Baksmali.disassembleDexFile(dex, new File(a[1]), 1, o)) System.exit(1);
    }
}
