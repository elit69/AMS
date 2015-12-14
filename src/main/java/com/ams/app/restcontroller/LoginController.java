package com.ams.app.restcontroller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.ams.app.entities.User;
import com.ams.app.serviceimplement.AuthorArticleImpl;

@RestController
@RequestMapping(value = "/api/user")
public class LoginController {
	
	@Autowired
	private AuthorArticleImpl dao;
	
	@RequestMapping(value = "/denied", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Map<String, Object>> accessDenied() {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = HttpStatus.FORBIDDEN;
		map.put("MESSAGE", "Access Denied. Please Log in.");
		map.put("STATUS", "403");
		return  new ResponseEntity<Map<String, Object>>(map, status);
	}

	@RequestMapping(value = "/autologin/admin", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Map<String, Object>> autologin(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = null;
		try {
			request.login("admin", "1");
			map.put("MESSAGE", "AUTO LOG IN SUCCESS WITH DEFAULT ADMIN ACCOUNT 'admin'");
			map.put("STATUS", "200");
			map.put("IS_LOGIN", isAuthenticated());
			map.put("ROLE", getRole());
			map.put("USERNAME", getUsername());
			status = HttpStatus.OK;
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			map.put("MESSAGE", e.getMessage());
			map.put("IS_LOGIN", isAuthenticated());
			map.put("ROLE", getRole());
			map.put("USERNAME", getUsername());
			status = HttpStatus.BAD_REQUEST;
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>(map, status);
		}
		System.out.println(isAuthenticated());
		System.out.println(getRole());
		System.out.println(getUsername());
		return new ResponseEntity<Map<String, Object>>(map, status);
	}

	@RequestMapping(value = "/autologin/user", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Map<String, Object>> autologin1(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = null;
		try {
			request.login("author", "1");
			map.put("MESSAGE", "AUTO LOG IN SUCCESS WITH DEFAULT AUTHOR ACCOUNT 'author'");
			map.put("STATUS", "200");
			map.put("IS_LOGIN", isAuthenticated());
			map.put("ROLE", getRole());
			map.put("USERNAME", getUsername());
			status = HttpStatus.OK;
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			map.put("MESSAGE", e.getMessage());
			map.put("IS_LOGIN", isAuthenticated());
			map.put("ROLE", getRole());
			map.put("USERNAME", getUsername());
			status = HttpStatus.BAD_REQUEST;
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>(map, status);
		}
		System.out.println(isAuthenticated());
		System.out.println(getRole());
		System.out.println(getUsername());
		return new ResponseEntity<Map<String, Object>>(map, status);
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Map<String, Object>> login(@RequestBody User usr,
			HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = null;
		try {
			request.login(usr.getUsername(), usr.getPassword());
			status = HttpStatus.OK;
			map.put("MESSAGE", "LOG IN SUCCESS");
			map.put("STATUS", status);	
			map.put("IS_LOGIN", isAuthenticated());
			map.put("ROLE", getRole());
			map.put("USERNAME", getUsername());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			status = HttpStatus.BAD_REQUEST;
			map.put("MESSAGE", e.getMessage());
			map.put("STATUS", status);			
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>(map, status);
		}
		System.out.println(isAuthenticated());
		System.out.println(getRole());
		System.out.println(getUsername());
		return new ResponseEntity<Map<String, Object>>(map, status);
	}

	@RequestMapping(value = "/login/status", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Map<String, Object>> status(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = HttpStatus.OK;
		System.out.println(isAuthenticated());
		System.out.println(getRole());
		System.out.println(getUsername());
		map.put("MESSAGE", "CURRENT USER STATUS");
		map.put("STATUS", "200");
		map.put("IS_LOGIN", isAuthenticated());
		map.put("ROLE", getRole());
		map.put("DETAIL", dao.checkUser(getUsername()));
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Map<String, Object>> logout(HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = null;
		try {
			if (isAuthenticated()) {
				request.logout();
				map.put("MESSAGE", "LOG OUT SUCCESS");
				map.put("STATUS", "200");
				status = HttpStatus.OK;
			} else {
				map.put("MESSAGE", "YOU DID NOT LOG IN. CANNOT LOG OUT.");
				status = HttpStatus.FORBIDDEN;
			}
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			map.put("MESSAGE", e.getMessage());
			status = HttpStatus.INTERNAL_SERVER_ERROR;
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>(map, status);
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
