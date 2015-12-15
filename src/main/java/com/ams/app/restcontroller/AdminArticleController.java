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
import com.ams.app.entities.Article;
import com.ams.app.services.ArticleService;

@RestController
@RequestMapping(value = "/api/admin/article")
public class AdminArticleController {

	@Autowired
	private ArticleService artservice;

	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listArticle(
			@RequestParam(value = "limit", required = false) Integer limit,
			@RequestParam(value = "page", required = false) Integer page) {

		System.out.println("list article");
		ArrayList<Article> list = artservice.list(limit, page);
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = null;
		
		if (list.isEmpty()) {
			status = HttpStatus.NOT_FOUND;
			map.put("MESSAGE", "LIST EMPTY");
			map.put("STATUS", status);			
		} else {
			status = HttpStatus.OK;
			map.put("MESSAGE", "SUCCESS");
			map.put("STATUS", status);
			map.put("COUNT", list.size());
			map.put("RESPONSE_DATA", list);
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
		Article art = artservice.show(id);
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
			
			//deleting old file
			File oldFile = new File(path + File.separator + art.getImage());
			if(oldFile.exists() && !art.getImage().equals("default.jpg")) oldFile.delete();
			
			//update to database
			System.out.println(newFile.getAbsolutePath());				
			art.setImage(newFileName);
			artservice.update(art);
			
			//return json
			status = HttpStatus.CREATED;
			map.put("MESSAGE", "IMAGE HAS BEEN UPLOADED.");
			map.put("STATUS", status);				
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("You are failed to upload  => " + e.getMessage());
			status = HttpStatus.NOT_FOUND;
			map.put("MESSAGE", "IMAGE HAS NOT BEEN UPLOADED.");
			map.put("STATUS", status);
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addArticle(@RequestBody Article art) {
		Map<String, Object> map = new HashMap<String, Object>();
		art.setImage("default.jpg");
		if (artservice.add(art)) {
			map.put("MESSAGE", "ARTICLE HAS BEEN INSERTED.");
			map.put("STATUS", HttpStatus.CREATED.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.CREATED);
		} else {
			map.put("MESSAGE", "ARTICLE HAS NOT BEEN INSERTED.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Map<String, Object>> deleteArticle(@PathVariable("id") int id) {
		System.out.println("delete article");
		Map<String, Object> map = new HashMap<String, Object>();
		if (artservice.delete(id)) {
			map.put("MESSAGE", "ARTICLE HAS BEEN DELETED.");
			map.put("STATUS", HttpStatus.OK.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "ARTICLE HAS NOT BEEN DELETED.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<Map<String, Object>> updateArticle(@RequestBody Article art) {
		System.out.println("update article");
		Map<String, Object> map = new HashMap<String, Object>();
		if (artservice.update(art)) {
			map.put("MESSAGE", "ARTICLE HAS BEEN UPDATED.");
			map.put("STATUS", HttpStatus.OK.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "ARTICLE HAS NOT BEEN UPDATED.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getArticle(@PathVariable("id") int id) {
		System.out.println("get article");
		Article art = artservice.show(id);
		Map<String, Object> map = new HashMap<String, Object>();
		if (art != null) {
			map.put("MESSAGE", "SUCCESS");
			map.put("STATUS", HttpStatus.OK.value());
			map.put("RESPONSE_DATA", art);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "RECORD NOT FOUND");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = { "/search/{type}" }, method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> search(
			@PathVariable("type") String type,
			@RequestParam(value = "keyword", required = true) String keyword,
			@RequestParam(value = "limit", required = false) Integer limit,
			@RequestParam(value = "page", required = false) Integer page) {

		List<Article> list = artservice.search(type, keyword, limit, page);
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = null;
		
		if (list.isEmpty()) {
			status = HttpStatus.NOT_FOUND;
			map.put("MESSAGE", "RECORD NOT FOUND.");
			map.put("STATUS", status);			
		} else {
			status = HttpStatus.OK;
			map.put("MESSAGE", "SUCCESS");
			map.put("STATUS", status);
			map.put("COUNT", list.size());
			map.put("RESPONSE_DATA", list);			
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}

	@RequestMapping(value = "/{id}/toggle", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> toggle(@PathVariable("id") int id) {
		System.out.println("toggle " + id);
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = null;
		if (artservice.toggle(id)) {
			map.put("MESSAGE", "TOGGLE SUCCESSFULLY");
			map.put("STATUS", HttpStatus.OK.value());
			map.put("RESPONSE_DATA", artservice.show(id));
			status = HttpStatus.OK;
		} else {
			map.put("MESSAGE", "RECORD NOT FOUND.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			status = HttpStatus.NOT_FOUND;
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}

}
