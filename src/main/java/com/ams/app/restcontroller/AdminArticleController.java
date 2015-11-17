package com.ams.app.restcontroller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ams.app.entities.ArticleDto;
import com.ams.app.entities.UserDto;
import com.ams.app.services.ArticleService;
import com.ams.app.services.UserService;

@RestController
@RequestMapping(value = "/admin/api/article")
public class AdminArticleController {

	@Autowired
	private ArticleService artservice;

	@Autowired
	private UserService userservice;
	// SOPHEAK
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView viewListArticle(ModelAndView mav) {
		mav.setViewName("/admin/article");
		return mav;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listArticle() {
		System.out.println("list article");
		List<ArticleDto> list = artservice.list();
		Map<String, Object> map = new HashMap<String, Object>();
		if (list.isEmpty()) {
			map.put("MESSAGE", "LIST EMPTY");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("STATUS", HttpStatus.OK);
			map.put("MESSAGE", "SUCCESS");
			map.put("RESPONSE_DATA", list);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		}
	}


}
