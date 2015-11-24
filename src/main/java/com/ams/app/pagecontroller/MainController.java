package com.ams.app.pagecontroller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ams.app.entities.UserDto;
import com.ams.app.serviceimplement.AuthorArticleDao;

@Controller
public class MainController {
	
	@Autowired
	private AuthorArticleDao dao;
	
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
	public String homePage1(ModelMap m) {
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
	
	/////////////////////////////////////////////////////////author page
	@RequestMapping(value="/author/add")
	public String authorArticleLoggin(HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.setAttribute("user",dao.checkUser(getUsername()));
		return "author/authorarticle";
	}
	@RequestMapping(value="/author")
	public String authorListArticle(HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.setAttribute("user",dao.checkUser(getUsername()));
		return "author/authorlistarticle";
	}
	
	///////////////////////////////////////////////////////////security action	
	@RequestMapping(value = "/403")
	public String accessDenied(ModelMap m) {
		System.out.println(getUsername());
		System.out.println(getRole());
		System.out.println(isAuthenticated());
		m.addAttribute("name", getUsername());
		m.addAttribute("role", getRole());
		m.addAttribute("login", isAuthenticated());
		return "403";
	}
	
	@RequestMapping(value = "/successlogin")
	public String successlogin(ModelMap m) {
		System.out.println(isAuthenticated());
		System.out.println(getRole());
		System.out.println(getUsername());
		System.out.println("successlogin");
		if (getRole().equals("ROLE_ADMIN"))		return "redirect:/admin/user";
		if (getRole().equals("ROLE_AUTHOR"))	return "redirect:/author";
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login")
	public String loginPage(HttpServletRequest request) {
		String referrer = request.getHeader("Referer");
		request.getSession().setAttribute("url_prior_login", referrer);
		if(isAuthenticated()) return "redirect:/"; else return "login";
	}
	
	@RequestMapping(value = "/logout")
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null)	new SecurityContextLogoutHandler().logout(request, response, auth);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/api/status", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Map<String, Object>> status(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = HttpStatus.OK;
		System.out.println(isAuthenticated());
		System.out.println(getRole());
		System.out.println(getUsername());
		map.put("MESSAGE", "CURRENT USER STATUS");
		map.put("isAuthenticated", isAuthenticated());
		map.put("Role", getRole());
		map.put("Username", getUsername());
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	
	@RequestMapping(value = "/api/autologin/admin", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Map<String, Object>> autologin(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = null;
		try {
			request.login("admin", "1");
			map.put("MESSAGE", "AUTO LOG IN SUCCESS WITH DEFAULT ADMIN ACCOUNT 'admin'");
			map.put("isAuthenticated", isAuthenticated());
			map.put("Role", getRole());
			map.put("Username", getUsername());
			status = HttpStatus.OK;
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			map.put("MESSAGE", e.getMessage());
			status = HttpStatus.NOT_FOUND;
			e.printStackTrace();
		}
		System.out.println(isAuthenticated());
		System.out.println(getRole());
		System.out.println(getUsername());
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	
	@RequestMapping(value = "/api/autologin/author", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Map<String, Object>> autologin1(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = null;
		try {
			request.login("author", "1");
			map.put("MESSAGE", "AUTO LOG IN SUCCESS WITH DEFAULT AUTHOR ACCOUNT 'author'");
			map.put("isAuthenticated", isAuthenticated());
			map.put("Role", getRole());
			map.put("Username", getUsername());
			status = HttpStatus.OK;
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			map.put("MESSAGE", e.getMessage());
			status = HttpStatus.NOT_FOUND;
			e.printStackTrace();
		}
		System.out.println(isAuthenticated());
		System.out.println(getRole());
		System.out.println(getUsername());
		return new ResponseEntity<Map<String, Object>>(map, status);
	}

	@RequestMapping(value = "/api/login", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Map<String, Object>> login(@RequestBody UserDto usr, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = null;
		try {
			request.login(usr.getUsername(), usr.getPassword());
			map.put("MESSAGE", "LOG IN SUCCESS");
			map.put("isAuthenticated", isAuthenticated());
			map.put("Role", getRole());
			map.put("Username", getUsername());
			status = HttpStatus.OK;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			map.put("MESSAGE", e.getMessage());
			status = HttpStatus.NOT_FOUND;
			e.printStackTrace();
		}
		System.out.println(isAuthenticated());
		System.out.println(getRole());
		System.out.println(getUsername());
		return new ResponseEntity<Map<String, Object>>(map, status);
	}

	@RequestMapping(value = "/api/logout", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Map<String, Object>> logout(HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = null;
		try {
			if(isAuthenticated()){
				request.logout();
				map.put("MESSAGE", "LOG OUT SUCCESS");
				status = HttpStatus.OK;
			}else{
				map.put("MESSAGE", "YOU DID NOT LOG IN. CANNOT LOG OUT.");
				status = HttpStatus.NOT_FOUND;
			}
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			map.put("MESSAGE", e.getMessage());
			status = HttpStatus.NOT_FOUND;
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
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
