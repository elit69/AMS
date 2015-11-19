package com.ams.app.restcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ams.app.entities.UserDto;
import com.ams.app.services.ArticleService;
import com.ams.app.services.UserService;


@RestController
@RequestMapping(value="/api/author/")
public class AuthorController {
	@Autowired
	private ArticleService artservice;
	@Autowired
	private UserService userService;
	
	/////////////////////////////////////////////////////////////list author article
	@RequestMapping(value = {"/list" },method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listUser() {
		System.out.println("list author article.");
		ArrayList<UserDto> users = userService.list(2,3);
		Map<String, Object> map = new HashMap<String, Object>();
		if (users.isEmpty()) {
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			map.put("MESSAGE", "USERS ARE NOT FOUND.");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
		map.put("STATUS", HttpStatus.OK.value());
		map.put("MESSAGE", "USERS HAVE BEEN FOUND.");
		map.put("RESPONSE_DATA", users);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	/////////////////////////////////////////////////////////////current user profile
/*	@RequestMapping(value = {"/profile" },method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listCurrentUser() {
		System.out.println("list author article.");
		Map<String, Object> map = new HashMap<String, Object>();
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}*/
	
	/////////////////////////////////////////////////////////////add article
	
	
}
