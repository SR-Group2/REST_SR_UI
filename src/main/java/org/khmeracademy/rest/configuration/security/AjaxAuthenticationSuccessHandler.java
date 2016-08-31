package org.khmeracademy.rest.configuration.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component("ajaxAuthenticationSuccessHandler")
public class AjaxAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
			
			response.getWriter().print(determineTargetUrl(auth,request));
	        response.getWriter().flush();
	        
	}
	
	
	private String determineTargetUrl(Authentication authentication,  HttpServletRequest request) {

		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

		List<String> roles = new ArrayList<String>();

		for (GrantedAuthority authority : authorities) {
			System.out.println(authority.getAuthority());
			roles.add(authority.getAuthority());
			System.out.println("Extract Role: " + authority.getAuthority());
		}
		
		//=============== catch current url ================
		String redirectURL = (String)request.getSession().getAttribute("REDIRECT_URL");
		request.getSession().setAttribute("REDIRECT_URL", null);
		
		
		if(roles.contains("ROLE_ADMIN")) {
			return "/admin";
		}else if(roles.contains("ROLE_OWNER")){
			return "owner";
		}else if(roles.contains("ROLE_STANDARD_USER")){
			return "user";
		}else{
			return "/accessDenied";
		}

	}
	
	/*// Get API User from HttpSession
	private APIUser getAPIUser(){
		Authentication authentication =  SecurityContextHolder.getContext().getAuthentication();
		APIUser user = (APIUser) authentication.getPrincipal();
		return user;
	}*/

}
