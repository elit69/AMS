package com.ams.app.pagecontroller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ams.app.services.ArticleService;
import com.ams.app.services.UserService;

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

}
