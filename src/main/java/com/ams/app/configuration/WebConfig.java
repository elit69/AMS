package com.ams.app.configuration;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.ams.app.serviceimplement.ArticleDao;
import com.ams.app.serviceimplement.ClientDao;
import com.ams.app.serviceimplement.UserDao;
import com.ams.app.services.ArticleService;
import com.ams.app.services.UserService;


@Configuration
@ComponentScan(basePackages="com.ams.app")
@EnableWebMvc
public class WebConfig extends WebMvcConfigurerAdapter {
	
	@Bean
	public ViewResolver getViewResolver(){
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/pages/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry){
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Bean
    public DataSource getDataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.postgresql.Driver");
        dataSource.setUrl("jdbc:postgresql://ec2-54-83-53-120.compute-1.amazonaws.com:5432/d8r4472vood4lt?ssl=true&sslfactory=org.postgresql.ssl.NonValidatingFactory");
        dataSource.setUsername("ltosfmzpggnzhu");
        dataSource.setPassword("pi4F41BGzBM6k7Vr2mo4zlhGlx");
        return dataSource;
    }
	
	@Bean
	public ClientDao getClientDao(){
		return new ClientDao(this.getDataSource());
	}
	
	@Bean
	public UserService getUserDao(){
		return new UserDao(this.getDataSource());
	}
	
	@Bean
	public ArticleService getArticleDao(){
		return new ArticleDao(this.getDataSource());
	}
		
	@Bean
	public AuthenticationSuccessHandler successHandler() {
	    return new LoginSuccessHandler("/successlogin");
	}
	
	// Upload File 
		@Bean
		public MultipartResolver multipartResolver() {
		       org.springframework.web.multipart.commons.CommonsMultipartResolver multipartResolver = new org.springframework.web.multipart.commons.CommonsMultipartResolver();
		       multipartResolver.setMaxUploadSize(2097152);
		       return multipartResolver;
		}
}
