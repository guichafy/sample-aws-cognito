package guichafy.sampleprojectconfig;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Map;
import java.util.function.Function;

@Configuration
public class HandlersConfig {

    @Value("${USER_POOL_WEB_CLIENT_ID:undefined}")
    private String webClientId;
    
    @Value("${USER_POOL_ID:undefined}")
    private String userPoolId;

    private final String region = "sa-east-1";

    @Bean
    public Function<String, Map<String,String>> getConfig() {
        return value -> Map.of("webClientId", webClientId,
                               "userPoolId", userPoolId,
                                "region", region);
    }

}
