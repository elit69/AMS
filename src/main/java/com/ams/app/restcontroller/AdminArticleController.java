package com.ams.app.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
<<<<<<< HEAD

=======
>>>>>>> origin/master
import com.ams.app.entities.ArticleDto;
import com.ams.app.services.ArticleService;

@RestController
@RequestMapping(value = "/api/admin/article")
public class AdminArticleController {

	@Autowired
	private ArticleService artservice;

/*	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView viewListArticle(ModelAndView mav) {
		mav.setViewName("/admin/article");
		return mav;
	}*/

	@RequestMapping(value = {"/{limit}/{offset}","/list/{limit}/{offset}"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listArticle() {
		System.out.println("list article");
		String list = artservice.list(10,10);
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
	
	@RequestMapping(value="/add", method= RequestMethod.POST )
	public ResponseEntity<Map<String, Object>> addArticle(@RequestBody ArticleDto art){
		Map<String, Object> map  = new HashMap<String, Object>();
		if(artservice.add(art)){
			map.put("MESSAGE","ARTICLE HAS BEEN INSERTED.");
			map.put("STATUS", HttpStatus.CREATED.value());
			return new ResponseEntity<Map<String,Object>>
								(map, HttpStatus.CREATED);
		}else{
			map.put("MESSAGE","ARTICLE HAS NOT BEEN INSERTED.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String,Object>>
								(map, HttpStatus.NOT_FOUND);
		}
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.DELETE)
	public ResponseEntity<Map<String, Object>> deleteArticle(@PathVariable("id") int id){
		System.out.println("delete article");
		Map<String, Object> map = new HashMap<String, Object>();
		if(artservice.delete(id)){
			map.put("MESSAGE","ARTICLE HAS BEEN DELETED.");
			map.put("STATUS", HttpStatus.OK.value());
			return new ResponseEntity<Map<String,Object>>
								(map, HttpStatus.OK);
		}else{
			map.put("MESSAGE","ARTICLE HAS NOT BEEN DELETED.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String,Object>>
								(map, HttpStatus.NOT_FOUND);
		}
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.PUT)
	public ResponseEntity<Map<String, Object>> updateArticle(@RequestBody ArticleDto art , @PathVariable("id") int id){
		System.out.println("update article");
		art.setId(id);
		Map<String, Object> map = new HashMap<String, Object>();
		if(artservice.update(art)){
			map.put("MESSAGE","ARTICLE HAS BEEN UPDATED.");
			map.put("STATUS", HttpStatus.OK.value());
			return new ResponseEntity<Map<String,Object>>
								(map, HttpStatus.OK);
		}else{
			map.put("MESSAGE","ARTICLE HAS NOT BEEN UPDATED.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String,Object>>
								(map, HttpStatus.NOT_FOUND);
		}
	}
	
	@RequestMapping(value = "/get_article/{id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getArticle(@PathVariable("id") int id) {
		System.out.println("list article");
		String art = artservice.show(id);
		Map<String, Object> map = new HashMap<String, Object>();
		if (art.equals("")) {
			map.put("MESSAGE", "LIST EMPTY");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("STATUS", HttpStatus.OK);
			map.put("MESSAGE", "SUCCESS");
			map.put("RESPONSE_DATA", art);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		}
	}
	

}
