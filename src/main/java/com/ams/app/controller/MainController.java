package com.ams.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		System.out.println("olo");
		model.addAttribute("message", "hello world");
		System.out.println("home page");
		return "home1";
	}

}
