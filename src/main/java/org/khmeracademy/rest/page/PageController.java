package org.khmeracademy.rest.page;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/admin")
public class PageController {
	

	@RequestMapping(value="/user", method = RequestMethod.GET)
	public String userPage(ModelMap map){
		map.addAttribute("page", "user.jsp");
		return "admin/admin";
	}
	
	@RequestMapping(value="/adduser", method = RequestMethod.GET)
	public String adduserPage(ModelMap map){
		map.addAttribute("page", "frmadduser.jsp");
		return "admin/admin";
	}
	
	@RequestMapping(value="/category", method = RequestMethod.GET)
	public String categoryPage(ModelMap map){
		map.addAttribute("page", "category.jsp");
		return "admin/admin";
	}
	@RequestMapping(value="/restaurant", method = RequestMethod.GET)
	public String restaurntPage(ModelMap map){
		map.addAttribute("page", "restaurant.jsp");
		return "admin/admin";
	}
	@RequestMapping(value="/brand", method = RequestMethod.GET)
	public String brandPage(ModelMap map){
		map.addAttribute("page", "brand.jsp");
		return "admin/admin";
	}
}
