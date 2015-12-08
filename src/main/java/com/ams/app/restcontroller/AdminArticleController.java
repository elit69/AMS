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
		ArrayList<Article> list = new ArrayList<Article>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (page == null && limit == null) list = artservice.list(0, 0);
		else{
			if (page == null)	list = artservice.list(limit, 0);		
			else if (limit == null)  list = artservice.list(0, page);
		}
		
		//else list = artservice.list(limit, page);
		
		if (list.isEmpty()) {
			map.put("MESSAGE", "LIST EMPTY");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		} else {
			map.put("MESSAGE", "SUCCESS");
			map.put("STATUS", HttpStatus.OK.value());
			map.put("RESPONSE_DATA", list);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		}
	}
	
	@RequestMapping(value = "{id}/img", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> uploadImage(
			@PathVariable(value="id") int id,
			@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		Article art = artservice.show(id);
			try {
				String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
				String randomUUIDFileName = UUID.randomUUID().toString() + "." + extension;				
				File path = new File(request.getSession().getServletContext().getRealPath("/resources/upload/profile/"));
				if (!path.exists())		path.mkdir();
				File serverFile = new File(path + File.separator + randomUUIDFileName);								
				while(serverFile.exists()){
					randomUUIDFileName = UUID.randomUUID().toString() + "." + extension;
					serverFile = new File(path + File.separator + randomUUIDFileName);
					System.out.println("hrersdf");
				}
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				byte[] bytes = file.getBytes();
				stream.write(bytes);
				stream.close();
				
				System.out.println(serverFile.getAbsolutePath());				
				art.setImage(randomUUIDFileName);
				artservice.update(art);
				map.put("MESSAGE", "ARTICLE HAS BEEN INSERTED.");
				map.put("STATUS", HttpStatus.CREATED.value());
				return new ResponseEntity<Map<String, Object>>(map, HttpStatus.CREATED);
			} catch (Exception e) {
				art.setImage("default.jpg");
				System.out.println("You are failed to upload  => " + e.getMessage());
				map.put("MESSAGE", "ARTICLE HAS NOT BEEN INSERTED.");
				map.put("STATUS", HttpStatus.NOT_FOUND.value());
				return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
			}
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addArticle(@RequestBody Article art) {
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(art.getContent());
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

	@RequestMapping(value = { "/search/{type}/{keyword}/{limit}/{page}", "/search/{type}/{keyword}/{limit}" }, method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> search(@PathVariable Map<String, String> pathVariables) {
		List<Article> listUser = null;
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = null;
		if (pathVariables.containsKey("type") && pathVariables.containsKey("keyword")
				&& pathVariables.containsKey("limit") && pathVariables.containsKey("page")) {
			listUser = artservice.search(pathVariables.get("type").toString(), pathVariables.get("keyword").toString(),
					Integer.parseInt(pathVariables.get("limit")), Integer.parseInt(pathVariables.get("page")));
		} else if (pathVariables.containsKey("type") && pathVariables.containsKey("keyword")
				&& pathVariables.containsKey("limit")) {
			listUser = artservice.search(pathVariables.get("type").toString(), pathVariables.get("keyword").toString(),
					Integer.parseInt(pathVariables.get("limit")), 0);
		}
		if (listUser.isEmpty()) {
			map.put("MESSAGE", "RECORD NOT FOUND.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			status = HttpStatus.NOT_FOUND;
		} else {
			map.put("MESSAGE", "SUCCESS");
			map.put("STATUS", HttpStatus.OK.value());
			map.put("RESPONSE_DATA", listUser);
			status = HttpStatus.OK;
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
