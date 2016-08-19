package org.khmeracademy.rest.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebMvcConfiguration extends WebMvcConfigurerAdapter{

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
	
		registry.addViewController("/login").setViewName("login");
		registry.addViewController("/access-denied").setViewName("/errors/access-denied");
		registry.addViewController("/home").setViewName("home");
		registry.addViewController("/user").setViewName("home");
		//registry.addViewController("/admin").setViewName("admin/admin");
		//registry.addViewController("/admin/").setViewName("admin/admin");
		registry.addViewController("/detail_menu").setViewName("detail_menu");
		registry.addViewController("/restaurant/{id}").setViewName("restlists");
		registry.addViewController("/detail_rest/{id}").setViewName("detail_rest");
		registry.addViewController("/upload").setViewName("upload");
		registry.addViewController("/profile").setViewName("user/profile");
		registry.addViewController("/register").setViewName("register");
		
		
	}
	
	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**")
				.allowedMethods("GET","POST","DELETE","PUT","OPTIONS","PATCH")
				.allowedOrigins("*");
	}
	
	
}
