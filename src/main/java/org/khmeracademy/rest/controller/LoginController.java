package org.khmeracademy.rest.controller;

import javax.servlet.http.HttpServletRequest;


import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

  
  @RequestMapping(value="/admin", method = RequestMethod.GET)
  public String printUser(ModelMap model) {
	 
	  //User user = (User)authentication.getPrincipal();
	 
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      String name = auth.getName(); //get logged in username

      model.addAttribute("username", name);
      model.addAttribute("page", "index.jsp");
 
      return "admin/admin";

  }
  @RequestMapping(value="/admin/**", method = RequestMethod.GET)
  public String showUser(ModelMap model) {

     /*Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      User user = (User) auth.getPrincipal();
      System.out.println(user.getId());*/
     

//      model.addAttribute("username", name);
      model.addAttribute("page", "index.jsp");
 
      return "";

  }
  

	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String loginPage(HttpServletRequest request){
		
		System.out.println("REFERER==>"+ request.getHeader("referer"));
		
		//TODO: TO GET THE REFERER AND PUT IT IN THE SESSIOn
		request.getSession().setAttribute("REDIRECT_URL", request.getHeader("referer"));
		return "/login";
	}
  
}