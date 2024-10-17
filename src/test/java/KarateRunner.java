import com.intuit.karate.junit5.Karate;

public class KarateRunner {
    @Karate.Test
    Karate runTest() {
//        String filePath = System.getProperty("karate.test");
//        if (filePath == null || filePath.isEmpty()) {
//            throw new IllegalArgumentException("Error");
//        }
//        String fileName = filePath.replace('\\', '/');
//        return Karate.run(fileName).relativeTo(KarateRunner.class);
        return Karate.run("classpath:testcases/tademostoreweb/TC_Web_001_VerifyPuchasingByGuest.feature").relativeTo(KarateRunner.class);
//        return Karate.run("classpath:testcases/tademostoreweb/TC_Web_002_VerifyClearingShoppingCart.feature").relativeTo(KarateRunner.class);
    }
}