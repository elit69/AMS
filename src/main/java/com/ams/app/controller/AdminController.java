package com.ams.app.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
@RequestMapping(value = "/admin/api")
public class AdminController {
	
		@Autowired
		private ArticleService artservice;
		
		// User Service
		@Autowired
		UserService userService;
		
		@RequestMapping(value="/home", method=RequestMethod.GET)
		public ResponseEntity<Map<String,Object>> getAllUsers(){
			ArrayList<UserDto> users = userService.getAllUser();
			Map<String, Object> map = new HashMap<String,Object>();
			if(users.isEmpty()){
				map.put("STATUS", HttpStatus.NOT_FOUND.value());
				map.put("MESSAGE", "USERS ARE NOT FOUND.");
				return new ResponseEntity<Map<String,Object>> (map,HttpStatus.NOT_FOUND);
			}
			map.put("STATUS", HttpStatus.OK.value());
			map.put("MESSAGE", "USERS HAVE BEEN FOUND.");
			map.put("RESPONSE_DATA",users);
			return new ResponseEntity<Map<String,Object>> (map,HttpStatus.OK);	
		}
		
		@RequestMapping(value="/adduser",method=RequestMethod.POST)
		public ResponseEntity<Map<String,Object>> insertUser(UserDto user){
			Map<String,Object> map=new HashMap<String,Object>();
			if(userService.insertUser(user)){
				map.put("STATUS", HttpStatus.CREATED.value());
				map.put("MESSAGE", "USER HAS BEEN CREATED.");
				return new ResponseEntity<Map<String,Object>> (map,HttpStatus.CREATED);
			}
			else{
				map.put("STATUS", HttpStatus.NOT_FOUND.value());
				map.put("MESSAGE", "USER HAS NOT BEEN CREATED.");
				return new ResponseEntity<Map<String,Object>> (map,HttpStatus.NOT_FOUND);
			}
		}
		private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
		@RequestMapping(value="/uploadimage",method=RequestMethod.POST)
		public ResponseEntity<Map<String,Object>> uploadImage(@RequestParam("file") MultipartFile file ,
														HttpServletRequest request){
			
			String filename = file.getOriginalFilename();
			System.out.println(file);
			Map<String,Object> map=new HashMap<String,Object>();
			if(!file.isEmpty()){
				try{
					
					byte[] bytes = file.getBytes();

					// creating the directory to store file
					String savePath = request.getSession().getServletContext().getRealPath("resources/upload/profile");
					File path = new File(savePath);
					if(!path.exists()){
						path.mkdir();
					}
				
					// creating the file on server
					File serverFile = new File(savePath + File.separator + filename );
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();
			
					logger.info("Server File Location=" + serverFile.getAbsolutePath());
					System.out.println(serverFile.getAbsolutePath());
					System.out.println("You are successfully uploaded file " + filename);
									
					map.put("MESSAGE", "UPLAOD SUCCESSED.");
					map.put("STATUS", HttpStatus.CREATED.value());
					return new ResponseEntity<Map<String,Object>> (map,HttpStatus.OK);
					
				}catch(Exception e){
					System.out.println("You are failed to upload "+ filename + " => " + e.getMessage());
				}
			}else{
				System.out.println("You are failed to upload "+ filename + " because the file was empty!");
				map.put("MESSAGE", "UPLAOD FAIL.");
				map.put("STATUS", HttpStatus.FORBIDDEN.value());
				return new ResponseEntity<Map<String,Object>> (map,HttpStatus.NOT_ACCEPTABLE);
			}
			return null;
		}
		
		@RequestMapping(value="/updateuser",method=RequestMethod.POST)
		public ResponseEntity<Map<String,Object>> updateUser(UserDto user){
			Map<String,Object> map=new HashMap<String,Object>();
			if(userService.updateUser(user)){
				map.put("STATUS", HttpStatus.FOUND.value());
				map.put("MESSAGE", "USER HAS BEEN UPDATED.");
				return new ResponseEntity<Map<String,Object>> (map,HttpStatus.OK);
			}
			else{
				map.put("STATUS", HttpStatus.NOT_FOUND.value());
				map.put("MESSAGE", "USER HAS NOT BEEN UPDATED.");
				return new ResponseEntity<Map<String,Object>> (map,HttpStatus.NOT_FOUND);
			}
		}
		
		@RequestMapping(value="/deleteuser",method=RequestMethod.POST)
		public ResponseEntity<Map<String,Object>> deleteUser(@RequestParam("id") int id){
			Map<String,Object> map=new HashMap<String,Object>();
			if(userService.deleteUser(id)){
				map.put("STATUS", HttpStatus.GONE.value());
				map.put("MESSAGE", "USER HAS BEEN DELETED.");
				return new ResponseEntity<Map<String,Object>> (map,HttpStatus.OK);
			}
			else{
				map.put("STATUS", HttpStatus.NOT_FOUND.value());
				map.put("MESSAGE", "USER HAS NOT BEEN DELETED.");
				return new ResponseEntity<Map<String,Object>> (map,HttpStatus.NOT_FOUND);
			}
		}
		
		@RequestMapping(value="/detailuser",method=RequestMethod.POST)
		public ResponseEntity<Map<String,Object>> detailUser(@RequestParam("id") int id){
			Map<String,Object> map=new HashMap<String,Object>();
			UserDto student=userService.getUser(id);
			if(student!=null){
				map.put("STATUS", HttpStatus.FOUND.value());
				map.put("MESSAGE", "USER HAS BEEN FOUND.");
				map.put("RESPONSE_DATA", student);
				return new ResponseEntity<Map<String,Object>> (map,HttpStatus.OK);
			}
			else{
				map.put("STATUS", HttpStatus.NOT_FOUND.value());
				map.put("MESSAGE", "USER NOT FOUND...");
				return new ResponseEntity<Map<String,Object>> (map,HttpStatus.NOT_FOUND);
			}
		}
		
	@RequestMapping(value="/",method=RequestMethod.GET)
	public ModelAndView viewListArticle(ModelAndView mav){
		mav.setViewName("article");
		return mav;
	}
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listArticle(){
		System.out.println("list article");
		List<ArticleDto> list = artservice.list();
		Map<String, Object> map = new HashMap<String,Object>();
		if(list.isEmpty()){
			map.put("MESSAGE", "LIST EMPTY");
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}else{
			map.put("STATUS", HttpStatus.OK);
			map.put("MESSAGE", "SUCCESS");
			map.put("RESPONSE_DATA", list);
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}
	}

	
}
