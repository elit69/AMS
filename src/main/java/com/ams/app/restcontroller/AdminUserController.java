package com.ams.app.restcontroller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.ams.app.entities.UserDto;
import com.ams.app.services.UserService;

@RestController

@RequestMapping(value="/api/admin/user")

public class AdminUserController {
	private static final Logger logger = LoggerFactory.getLogger(AdminArticleController.class);

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/edituser", method = RequestMethod.POST)
	public String editUser(UserDto user, ModelMap model) {
		model.addAttribute("user", user);
		return "/admin/user/useredit";
	}

	@RequestMapping(value = {"/list" }, method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listUser() {
		System.out.println("list user controller.");
		ArrayList<UserDto> users = userService.getAllUser();
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

	@RequestMapping(value ="/add", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addUser(@RequestBody UserDto user) {
		
		System.out.println(user.getEmail());
		Map<String, Object> map = new HashMap<String, Object>();
		if (userService.insertUser(user)) {
			map.put("STATUS", HttpStatus.CREATED.value());
			map.put("MESSAGE", "USER HAS BEEN CREATED.");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.CREATED);
		} else {
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			map.put("MESSAGE", "USER HAS NOT BEEN CREATED.");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
		
		//return new ResponseEntity<Map<String, Object>>(map, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Map<String, Object>> deleteUser(@PathVariable("id") int id) {
		System.out.println("delete controller.");
		Map<String, Object> map = new HashMap<String, Object>();
		if (userService.deleteUser(id)) {
			map.put("STATUS", HttpStatus.GONE.value());
			map.put("MESSAGE", "USER HAS BEEN DELETED.");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			map.put("MESSAGE", "USER HAS NOT BEEN DELETED.");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/update/{id}", method = RequestMethod.PUT)
	public ResponseEntity<Map<String, Object>> updateUser(@RequestBody UserDto user, @PathVariable("id") int id) {
		user.setId(id);
		Map<String, Object> map = new HashMap<String, Object>();
		if (userService.updateUser(user)) {
			map.put("STATUS", HttpStatus.FOUND.value());
			map.put("MESSAGE", "USER HAS BEEN UPDATED.");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			map.put("MESSAGE", "USER HAS NOT BEEN UPDATED.");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/get_user/{id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getUser(@PathVariable("id") int id) {
		System.out.println("detail controller");
		Map<String, Object> map = new HashMap<String, Object>();
		UserDto student = userService.getUser(id);
		if (student != null) {
			map.put("STATUS", HttpStatus.FOUND.value());
			map.put("MESSAGE", "USER HAS BEEN FOUND.");
			map.put("RESPONSE_DATA", student);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			map.put("MESSAGE", "USER NOT FOUND...");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/uploadimage", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> uploadImage(@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {

		String filename = file.getOriginalFilename();
		System.out.println(file);
		Map<String, Object> map = new HashMap<String, Object>();
		if (!file.isEmpty()) {
			try {

				byte[] bytes = file.getBytes();

				// creating the directory to store file
				String savePath = request.getSession().getServletContext().getRealPath("resources/upload/profile");
				File path = new File(savePath);
				if (!path.exists()) {
					path.mkdir();
				}

				// creating the file on server
				File serverFile = new File(savePath + File.separator + filename);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				logger.info("Server File Location=" + serverFile.getAbsolutePath());
				System.out.println(serverFile.getAbsolutePath());
				System.out.println("You are successfully uploaded file " + filename);

				map.put("MESSAGE", "UPLAOD SUCCESSED.");
				map.put("STATUS", HttpStatus.CREATED.value());
				return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

			} catch (Exception e) {
				System.out.println("You are failed to upload " + filename + " => " + e.getMessage());
			}
		} else {
			System.out.println("You are failed to upload " + filename + " because the file was empty!");
			map.put("MESSAGE", "UPLAOD FAIL.");
			map.put("STATUS", HttpStatus.FORBIDDEN.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_ACCEPTABLE);
		}
		return null;
	}
}
