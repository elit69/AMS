package com.ams.app.pagecontroller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ams.app.services.ArticleService;

@Controller
public class MainController {
	
	@Autowired
	private ArticleService artservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		
		System.out.println("olo");
		model.addAttribute("message", "hello world");
		model.addAttribute("list",artservice.list());
		System.out.println("home page");
		return "home1";
	}
	
	@RequestMapping(value = "/formuseradd", method = RequestMethod.GET)
	public String formAddUser(ModelMap model,@RequestParam("edit") boolean edit) {
		System.out.println("show form user add controller");
		return "/admin/user/useradd";
	}
	
	@RequestMapping(value = "/formlistuser", method = RequestMethod.GET)
	public String formListUsers(ModelMap model) {
		System.out.println("show form list users controller");
		return "/admin/user/viewuser";
	}

}
