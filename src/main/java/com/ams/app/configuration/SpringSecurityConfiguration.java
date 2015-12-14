package com.ams.app.configuration;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import com.google.gson.Gson;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private DataSource dataSource;
	
	//@Autowired private AuthenticationSuccessHandler successHandler;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {		
		auth.jdbcAuthentication()
			.dataSource(dataSource)
			.usersByUsernameQuery("SELECT username,password,enable FROM tbuser WHERE username=?")
			.authoritiesByUsernameQuery("SELECT username,role FROM v_login_user_role WHERE username = ?");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			//.httpBasic()
		//.and()
			//.formLogin()
                  //.loginPage("/api/user/denied")
               	  //.successHandler(successHandler)
				  //.usernameParameter("username")
				  //.passwordParameter("password")
        //.and()
			//.logout().logoutUrl("/api/user/logout")
		//.and()
			.authorizeRequests()
				//.antMatchers("/").permitAll()
				.antMatchers("/api/user/**").permitAll()
				.antMatchers("/resources/**").permitAll()				
				.antMatchers("/admin/**").hasRole("ADMIN")
				.antMatchers("/api/admin/**").hasRole("ADMIN")
				.antMatchers("/author/**").hasRole("AUTHOR")
				.antMatchers("/api/author/**").hasRole("AUTHOR")				
				//.antMatchers("/login").permitAll()
		.and().csrf().disable();						
		http.exceptionHandling().authenticationEntryPoint(new AuthenticationEntryPoint() {
			@Override
			public void commence(
				HttpServletRequest request,	HttpServletResponse response, 
				AuthenticationException authException)	throws IOException, ServletException {	
				
				response.setContentType("application/json");
				response.setStatus(HttpServletResponse.SC_FORBIDDEN);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("MESSAGE", authException.getMessage());
				map.put("STATUS", "403");
				response.getWriter().print(new Gson().toJson(map));
			}
		})
			.accessDeniedPage("/api/user/denied");
		//http.httpBasic();
		//http.sessionManagement()
		//	.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
		//	.maximumSessions(1);
		
	}

}