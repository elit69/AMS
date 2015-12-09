package com.ams.app.pagecontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.ams.app.services.AuthorArticleService;

@Controller
public class MainController {
	
	@Autowired
	private AuthorArticleService dao;
	
	@RequestMapping(value = "/")
	public String homePage(ModelMap m) {
		System.out.println("home page");
		System.out.println(getUsername());
		System.out.println(getRole());
		System.out.println(isAuthenticated());
		m.addAttribute("message", "home page");
		m.addAttribute("name", getUsername());
		m.addAttribute("role", getRole());
		m.addAttribute("login", isAuthenticated());
		return "home";
	}
	
	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public String helpSwagger(ModelMap m) {
		System.out.println(getUsername());
		System.out.println(getRole());
		System.out.println(isAuthenticated());
		m.addAttribute("name", getUsername());
		m.addAttribute("role", getRole());
		m.addAttribute("login", isAuthenticated());
		return "swagger";
	}
	
	@RequestMapping(value = "/help1", method = RequestMethod.GET)
	public String help(ModelMap m) {
		System.out.println(getUsername());
		System.out.println(getRole());
		System.out.println(isAuthenticated());
		m.addAttribute("name", getUsername());
		m.addAttribute("role", getRole());
		m.addAttribute("login", isAuthenticated());
		return "help";
	}
	
	/////////////////////////////////////////////////////////admin page
	@RequestMapping(value = "/admin/user", method = RequestMethod.GET)
	public String formListUsers(ModelMap m) {
		System.out.println("show form list users controller");
		System.out.println(getUsername());
		System.out.println(getRole());
		System.out.println(isAuthenticated());
		m.addAttribute("name", getUsername());
		m.addAttribute("role", getRole());
		m.addAttribute("login", isAuthenticated());
		return "admin/user/viewuser";
	}
	
	@RequestMapping(value = "/admin/user/add", method = RequestMethod.GET)
	public String formAddUser(ModelMap m) {
		System.out.println("show form user add controller");
		System.out.println(getUsername());
		System.out.println(getRole());
		System.out.println(isAuthenticated());
		m.addAttribute("name", getUsername());
		m.addAttribute("role", getRole());
		m.addAttribute("login", isAuthenticated());
		return "admin/user/useradd";
	}
	
	@RequestMapping(value = "/admin/user/edit/{id}", method = RequestMethod.GET)
	public String formEditUser(ModelMap m) {
		System.out.println("show form user edit controller");
		System.out.println(getUsername());
		System.out.println(getRole());
		System.out.println(isAuthenticated());
		m.addAttribute("name", getUsername());
		m.addAttribute("role", getRole());
		m.addAttribute("login", isAuthenticated());
		return "admin/user/useredit";
	}
	
	/////////////////////////////////////////////////////admin mange article
	@RequestMapping(value = {"/admin/","/admin/article"}, method = RequestMethod.GET)
	public String listArticle(ModelMap m) {
		System.out.println("show form list articles controller");
		System.out.println(getUsername());
		System.out.println(getRole());
		System.out.println(isAuthenticated());
		m.addAttribute("name", getUsername());
		m.addAttribute("role", getRole());
		m.addAttribute("login", isAuthenticated());
		return "admin/article/listarticle";
	}
	
	
	/////////////////////////////////////////////////////////author page
	@RequestMapping(value="/author/add")
	public String authorArticleLoggin(ModelMap m, HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.setAttribute("user",dao.checkUser(getUsername()));
		m.addAttribute("name", getUsername());
		m.addAttribute("login", isAuthenticated());
		return "author/authorarticle";
	}
	@RequestMapping(value="/author")
	public String authorListArticle(ModelMap m, HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.setAttribute("user",dao.checkUser(getUsername()));
		m.addAttribute("name", getUsername());
		m.addAttribute("login", isAuthenticated());
		return "author/authorlistarticle";
	}
	
	public boolean isAuthenticated() {
		return !(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken);
	}

	private String getRole() {
		return SecurityContextHolder.getContext().getAuthentication().getAuthorities().iterator().next().toString();
	}

	private String getUsername() {
		return SecurityContextHolder.getContext().getAuthentication().getName();
	}

}
