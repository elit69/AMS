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

import com.ams.app.entities.ArticleDto;
import com.ams.app.serviceimplement.ClientDao;

@RestController
public class ClientController {
	@Autowired
	private ClientDao dao;
    
	@RequestMapping(value="/getarticlelist")
	public ResponseEntity<Map<String,Object>> getArticleList(@RequestParam("page") int page,@RequestParam("numrow") int rownumber){
		  Map<String,Object> map=new HashMap<String,Object>();
		  ArrayList<ArticleDto> list=dao.getArticleList(page,rownumber);
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
   public ResponseEntity<Map<String,Object>> getArticleSearchList(@RequestParam("rwoname") String rowname,@RequestParam("search") String search,
		                                                          @RequestParam("page") int page,@RequestParam("numberow") int numberrow) {
	   Map<String,Object> map=new HashMap<String,Object>();
		  ArrayList<ArticleDto> list=dao.searchArticle(rowname, search, page, numberrow);
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
   
   @RequestMapping(value="/getnumberrow")
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
   
}
