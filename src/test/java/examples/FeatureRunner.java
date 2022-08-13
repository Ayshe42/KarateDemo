
package examples;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;


public class FeatureRunner {

    @Karate.Test
    Karate metaWeatherTest(){
        return new Karate().tags("@PostDemo").relativeTo(getClass());
    }
    
    // this will run all *.feature files that exist in sub-directories
    // see https://github.com/intuit/karate#naming-conventions
    @Test
    void testParallel() {
        Results results = Runner.path("classpath:karateTest").tags("@Demo").parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
