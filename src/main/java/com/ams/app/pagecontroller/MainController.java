package com.ams.app.pagecontroller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {
	

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String homePage1(ModelMap model) {
//		model.addAttribute("message", "hello world");
		System.out.println("home page");
		return "home1";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(ModelMap model) {
//		model.addAttribute("message", "hello world");
		System.out.println("home page");
		return "home";
	}
	
	@RequestMapping(value = "/formuseradd", method = RequestMethod.GET)
	public String formAddUser(ModelMap model) {
		System.out.println("show form user add controller");
		return "/admin/user/useradd";
	}
	
	@RequestMapping(value = "/formlistuser", method = RequestMethod.GET)
	public String formListUsers(ModelMap model) {
		System.out.println("show form list users controller");
		return "/admin/user/viewuser";
	}

}
