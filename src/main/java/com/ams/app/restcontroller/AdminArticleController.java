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
import org.springframework.web.servlet.ModelAndView;

import com.ams.app.entities.ArticleDto;
import com.ams.app.services.ArticleService;

@RestController
@RequestMapping(value = "/api/admin/article")
public class AdminArticleController {

	@Autowired
	private ArticleService artservice;

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public ModelAndView viewListArticle(ModelAndView mav) {
		mav.setViewName("/admin/article/test_upload");
		//mav.setViewName("/admin/article/test_list_article");
		return mav;
	}
	@RequestMapping(value = { "/list/{limit}/{page}", "/list/{limit}" }, method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listArticle(@PathVariable Map<String, String> pathVariables) {
		System.out.println("list article");
		ArrayList<ArticleDto> list = null;
		if (pathVariables.containsKey("limit") && pathVariables.containsKey("page")) {
			list = artservice.list(Integer.parseInt(pathVariables.get("limit")),
					Integer.parseInt(pathVariables.get("page")));
		} else if (pathVariables.containsKey("limit")) {
			list = artservice.list(Integer.parseInt(pathVariables.get("limit")), 0);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			list.equals(null);
			map.put("MESSAGE", "SUCCESS");
			map.put("STATUS", HttpStatus.OK.value());			
			map.put("RESPONSE_DATA", list);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("MESSAGE", "LIST EMPTY");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());			
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addArticle(ArticleDto art, @RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		// file upload
		if (!file.isEmpty()) {
			try {

				UUID uuid = UUID.randomUUID();
				String originalFilename = file.getOriginalFilename();
				String extension = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
				String randomUUIDFileName = uuid.toString();

				String filename = randomUUIDFileName + "." + extension;

				art.setImage(filename);

				byte[] bytes = file.getBytes();

				// creating the directory to store file
				String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/profile/");
				System.out.println(savePath);
				File path = new File(savePath);
				if (!path.exists()) {
					path.mkdir();
				}

				// creating the file on server
				File serverFile = new File(savePath + File.separator + filename);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				System.out.println(serverFile.getAbsolutePath());
				System.out.println("You are successfully uploaded file " + filename);
			} catch (Exception e) {
				System.out.println("You are failed to upload  => " + e.getMessage());
			}
		} else {
			art.setImage("abc.jpg");
			System.out.println("The file was empty!");
		}

		// end file upload

		Map<String, Object> map = new HashMap<String, Object>();
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

	@RequestMapping(value = "/", method = RequestMethod.PUT)
	public ResponseEntity<Map<String, Object>> updateArticle(@RequestBody ArticleDto art) {
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
		ArticleDto art = artservice.show(id);
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
		List<ArticleDto> listUser = null;
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

	@RequestMapping(value = "/toggle/{id}", method = RequestMethod.GET)
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
