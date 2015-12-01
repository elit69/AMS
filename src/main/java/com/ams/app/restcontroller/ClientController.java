package com.ams.app.restcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ams.app.entities.Article;
import com.ams.app.services.ClientService;

@RestController
public class ClientController {
	@Autowired
	private ClientService dao;
    
	@RequestMapping(value="/getarticlelist")
	public ResponseEntity<Map<String,Object>> getArticleList(@RequestParam("page") int page,@RequestParam("numrow") int rownumber){
		  Map<String,Object> map=new HashMap<String,Object>();
		  ArrayList<Article> list=dao.getArticleList(page,rownumber);
		  if(list.isEmpty()){
			  map.put("MESSAGE","ARTICLE NOT FOUND");
			  map.put("STATUS",HttpStatus.NOT_FOUND.value());
			  return new ResponseEntity<Map<String,Object>>(map,HttpStatus.NOT_FOUND);
		  }else{
			  map.put("MESSAGE","ARTICLE HAS BEEN FOUND");
			  map.put("STATUS",HttpStatus.FOUND.value());
			  map.put("RESPONE_DATA",list);
			  return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		  }
	}
   @RequestMapping(value="/getarticlesearch",method=RequestMethod.POST)	
   public ResponseEntity<Map<String,Object>> getArticleSearchList(@RequestParam("rowname") String rowname,@RequestParam("search") String search,
		                                                          @RequestParam("page") int page,@RequestParam("numberrow") int numberrow) {
	   Map<String,Object> map=new HashMap<String,Object>();
		  ArrayList<Article> list=dao.searchArticle(rowname, search, page, numberrow);
		  if(list.isEmpty()){
			  map.put("MESSAGE","ARTICLE NOT FOUND");
			  map.put("STATUS",HttpStatus.NOT_FOUND.value());
			  return new ResponseEntity<Map<String,Object>>(map,HttpStatus.NOT_FOUND);
		  }else{
			  map.put("MESSAGE","ARTICLE HAS BEEN FOUND");
			  map.put("STATUS",HttpStatus.FOUND.value());
			  map.put("RESPONE_DATA",list);
			  return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		  }
   }
   
   @RequestMapping(value="/getnumberrow",method=RequestMethod.POST)
   public ResponseEntity<Map<String,Object>> getNumberRow(@RequestParam("rowname") String rowname,@RequestParam("search") String search){
	   Map<String,Object> map=new HashMap<String,Object>();
		  int numberrow=dao.getNumberRow(rowname, search); 
		  if(numberrow==0){
			  map.put("MESSAGE","ARTICLE NOT FOUND");
			  map.put("STATUS",HttpStatus.NOT_FOUND.value());
			  return new ResponseEntity<Map<String,Object>>(map,HttpStatus.NOT_FOUND);
		  }else{
			  map.put("MESSAGE","ARTICLE HAS BEEN FOUND");
			  map.put("STATUS",HttpStatus.FOUND.value());
			  map.put("RESPONE_DATA",numberrow);
			  return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		  }
   }
   @RequestMapping(value="/articleviewdetial",method=RequestMethod.POST)
   public ResponseEntity<Map<String,Object>> getArticle(@RequestParam("id") int id){
	   Map<String,Object> map=new HashMap<String,Object>();
	   Article article=dao.getArticle(id);
	  map.put("MESSAGE","ARTICLE DETAIL");
	  map.put("STATUS",HttpStatus.FOUND.value());
	  map.put("RESPONE_DATA",article);
	  return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
	   
   }
   
}
