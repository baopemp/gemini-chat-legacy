import java.util.jar.*; import java.util.*;
public class VerifyAll { public static void main(String[] a) throws Exception {
  int ok=0, bad=0; JarFile j=new JarFile(a[0]);
  for (Enumeration<JarEntry> e=j.entries(); e.hasMoreElements();) { String n=e.nextElement().getName();
    if(!n.endsWith(".class")) continue; String c=n.replace('/','.').replace(".class","");
    try { Class<?> k=Class.forName(c,false,VerifyAll.class.getClassLoader());
          java.lang.invoke.MethodHandles.lookup().ensureInitialized(k); ok++; }
    catch (VerifyError v) { bad++; System.out.println("VERIFY FAIL "+c+": "+v.getMessage()); }
    catch (Throwable t) { Throwable r=t; while(r.getCause()!=null) r=r.getCause();
      if (r instanceof VerifyError) { bad++; System.out.println("VERIFY FAIL "+c+": "+r.getMessage()); } else ok++; } }
  System.out.println("classes linked: "+ok+", verify failures: "+bad); } }
