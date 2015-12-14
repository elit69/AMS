package com.ams.app.configuration;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import com.mangofactory.swagger.configuration.SpringSwaggerConfig;
import com.mangofactory.swagger.models.dto.builder.ApiInfoBuilder;
import com.mangofactory.swagger.plugin.EnableSwagger;
import com.mangofactory.swagger.plugin.SwaggerSpringMvcPlugin;

@Configuration
@EnableSwagger
public class SwaggerConfig {
	
	private SpringSwaggerConfig springSwaggerConfig;
	
	@Autowired 
	public void setSpringSwaggerConfig(SpringSwaggerConfig springSwaggerConfig){
		this.springSwaggerConfig = springSwaggerConfig;
	}
	
	@Bean
	public SwaggerSpringMvcPlugin configureSwagger() {		 
		return new SwaggerSpringMvcPlugin(this.springSwaggerConfig)
				.apiInfo(new ApiInfoBuilder()
							.title("Article Management REST API")
							.description("Article User Management")
							.termsOfServiceUrl("http://example.com/terms-of-service")
							.contact("info@example.com")
							.license("MIT License")
							.licenseUrl("http://opensource.org/licenses/MIT")
							.build())
				.apiVersion("1.0")
				.includePatterns(".*api.*");
	}
}