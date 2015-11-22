package com.ams.app.restcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ams.app.entities.ArticleDto;
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
	
	/////////////////////////////////////////////////////////////list article of current author 
	@RequestMapping(value = { "/list/{limit}/{page}", "/list/{limit}" }, method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listUser(@PathVariable Map<String, String> pathVariables) {
		System.out.println("list author article.");
		int currentUserId = userService.showUser(getUsername()).getId();
		ArrayList<ArticleDto> list = null;
		Map<String, Object> map = new HashMap<String, Object>();
		if (pathVariables.containsKey("limit") && pathVariables.containsKey("page")) {
			list = artservice.listByUser(currentUserId, Integer.parseInt(pathVariables.get("limit")),
					Integer.parseInt(pathVariables.get("page")));
		} else if (pathVariables.containsKey("limit")) {
			list = artservice.listByUser(currentUserId, Integer.parseInt(pathVariables.get("limit")), 0);
		}
		if (list.isEmpty()) {
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			map.put("MESSAGE", "YOUR ARTICLE ARE NOT FOUND.");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
		map.put("STATUS", HttpStatus.OK.value());
		map.put("MESSAGE", "YOUR ARTICLE HAVE BEEN FOUND.");
		map.put("RESPONSE_DATA", list);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	/////////////////////////////////////////////////////////////current author profile
	@RequestMapping(value = {"/profile" },method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listCurrentUser() {
		System.out.println("detail controller");
		Map<String, Object> map = new HashMap<String, Object>();
		UserDto user = userService.getUser(userService.showUser(getUsername()).getId());
		if (user != null) {
			map.put("MESSAGE", "CURRENT USER HAS BEEN FOUND.");
			map.put("STATUS", HttpStatus.FOUND.value());
			map.put("RESPONSE_DATA", user);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "USER NOT FOUND...");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
	
	/////////////////////////////////////////////////////////////get current Username	
	private String getUsername() {
		return SecurityContextHolder.getContext().getAuthentication().getName();
	}
}
