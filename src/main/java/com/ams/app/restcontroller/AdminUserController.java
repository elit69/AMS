package com.ams.app.restcontroller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ams.app.entities.User;
import com.ams.app.services.UserRoleService;
import com.ams.app.services.UserService;

@RestController
@RequestMapping(value = "/api/admin/user")
public class AdminUserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private UserRoleService userRoleService;

	@RequestMapping(value = { "/list/{limit}/{page}", "/list/{limit}" }, method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listUser(@PathVariable Map<String, String> pathVariables) {
		System.out.println("list user controller.");
		ArrayList<User> users = null;
		Map<String, Object> map = new HashMap<String, Object>();
		if (pathVariables.containsKey("limit") && pathVariables.containsKey("page")) {
			users = userService.list(Integer.parseInt(pathVariables.get("limit")),
					Integer.parseInt(pathVariables.get("page")));
		} else if (pathVariables.containsKey("limit")) {
			users = userService.list(Integer.parseInt(pathVariables.get("limit")), 0);
		}
		if (users.isEmpty()) {
			map.put("MESSAGE", "USERS ARE NOT FOUND.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
		map.put("MESSAGE", "USERS HAVE BEEN FOUND.");
		map.put("STATUS", HttpStatus.OK.value());
		map.put("RESPONSE_DATA", users);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addUser(@RequestBody User user) {
		System.out.println("add controller.");		
		Map<String, Object> map = new HashMap<String, Object>();				
		if(userService.insert(user)) {				
			if(userRoleService.insert(user.getId(), user.getRoles())){
				System.out.println("success insert to user role.");
			}
			map.put("MESSAGE", "USER HAS BEEN CREATED.");
			map.put("STATUS", HttpStatus.CREATED.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.CREATED);
		} else {
			map.put("MESSAGE", "USER HAS NOT BEEN CREATED.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Map<String, Object>> deleteUser(@PathVariable("id") int id) {
		System.out.println("delete controller.");
		Map<String, Object> map = new HashMap<String, Object>();
		if (userService.toggle(id)) {
			map.put("MESSAGE", "USER HAS BEEN DELETED.");
			map.put("STATUS", HttpStatus.OK.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "USER HAS NOT BEEN DELETED.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}

/*	@RequestMapping(value = "/", method = RequestMethod.PUT)
	public ResponseEntity<Map<String, Object>> updateUser(@RequestBody User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (userService.updateUser(user)) {
			UserRole ur=new UserRole();
			ur.setId(user.getRole_id());
			ur.setUser_id(user.getId());
			if(userRoleService.updateUserRole(ur)){
				System.out.println("success update user role");
			}
			map.put("MESSAGE", "USER HAS BEEN UPDATED.");
			map.put("STATUS", HttpStatus.FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "USER HAS NOT BEEN UPDATED.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}*/
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getUser(@PathVariable("id") int id) {
		System.out.println("detail controller");
		Map<String, Object> map = new HashMap<String, Object>();
		User user = userService.show(id);
		if (user != null) {
			map.put("MESSAGE", "USER HAS BEEN FOUND.");
			map.put("STATUS", HttpStatus.FOUND.value());
			map.put("RESPONSE_DATA", user);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "USER NOT FOUND...");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = { "/search/{type}/{keyword}/{limit}/{page}",
							"/search/{type}/{keyword}/{limit}" }, 
					method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> search(@PathVariable Map<String, String> pathVariables) {
		List<User> listUser = null;
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = null;
		if (pathVariables.containsKey("type") && pathVariables.containsKey("keyword")
				&& pathVariables.containsKey("limit") && pathVariables.containsKey("page")) {
			listUser = userService.search(pathVariables.get("type").toString(), pathVariables.get("keyword").toString(),
					Integer.parseInt(pathVariables.get("limit")), Integer.parseInt(pathVariables.get("page")));
		} else if (pathVariables.containsKey("type") && pathVariables.containsKey("keyword")
				&& pathVariables.containsKey("limit")) {
			listUser = userService.search(pathVariables.get("type").toString(), pathVariables.get("keyword").toString(),
					Integer.parseInt(pathVariables.get("limit")), 0);
		}
		if (listUser.isEmpty()) {
			map.put("MESSAGE", "RECORD NOT FOUND.");
			map.put("STATUS", HttpStatus.FOUND.value());
			status = HttpStatus.NOT_FOUND;
		} else {
			map.put("RESPONSE_DATA", listUser);
			map.put("STATUS", HttpStatus.FOUND.value());
			status = HttpStatus.OK;
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}

	@RequestMapping(value = "{id}/img", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> uploadImage(
			@PathVariable(value="id") int id,
			@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = null;
		User usr = userService.show(id);
		try {	
			//make dir and naming file
			String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
			String newFileName = UUID.randomUUID().toString() + "." + extension;				
			File path = new File(request.getSession().getServletContext().getRealPath("/resources/upload/profile/"));
			if (!path.exists())		path.mkdir();
			File newFile = new File(path + File.separator + newFileName);
			
			//check if duplicate name with other file
			while(newFile.exists()){
				newFileName = UUID.randomUUID().toString() + "." + extension;
				newFile = new File(path + File.separator + newFileName);
			}
			
			//uploading image
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(newFile));
			byte[] bytes = file.getBytes();
			stream.write(bytes);
			stream.close();
			
			System.out.println(usr.getImage());
			//deleting old file
			File oldFile = new File(path + File.separator + usr.getImage());
			if(oldFile.exists() && !usr.getImage().equals("default.jpg")) oldFile.delete();
			
			//update to database
			System.out.println(newFile.getAbsolutePath());				
			usr.setImage(newFileName);
			//userService.update(usr);
			
			//return json
			status = HttpStatus.CREATED;
			map.put("MESSAGE", "IMAGE HAS BEEN UPLOADED.");
			map.put("STATUS", status);				
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("You are failed to upload  => " + e.toString());			
			status = HttpStatus.NOT_FOUND;
			map.put("MESSAGE", "IMAGE HAS NOT BEEN UPLOADED.");
			map.put("STATUS", status);
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
}
