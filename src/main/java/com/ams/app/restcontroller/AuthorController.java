package com.ams.app.restcontroller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
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

import com.ams.app.entities.ArticleDto;
import com.ams.app.serviceimplement.AuthorArticleDao;

@RestController
@RequestMapping(value = "/api/author/")
public class AuthorController {
	@Autowired
	private AuthorArticleDao dao;

	private static final Logger logger = LoggerFactory
			.getLogger(AuthorController.class);

	@RequestMapping(value = "authorworkarticle", method = RequestMethod.POST)
	public Object authorArticleFuntion(ArticleDto art) {
		Map<String, Object> map = new HashMap<String, Object>();
		ResponseEntity<Map<String, Object>> resentity = null;
		switch (art.getKey()) {
		case "C":
			if (dao.add(art)) {
				map.put("MESSAGE", "ARTICLE HAS BEEN SAVED");
				map.put("STATUS", HttpStatus.ACCEPTED.value());
				resentity = new ResponseEntity<Map<String, Object>>(map,
						HttpStatus.OK);
			} else {
				map.put("MESSAGE", "ARTICLE HAS BEEN SAVE FAILED");
				map.put("STATUS", HttpStatus.NOT_ACCEPTABLE.value());
				resentity = new ResponseEntity<Map<String, Object>>(map,
						HttpStatus.NOT_FOUND);
			}
			break;

		case "GR":
			int nr = dao.getRowNumber(art);
			if (nr != 0) {
				map.put("MESSAGE", "ARTICLE WAS FOUND: " + nr);
				map.put("STATUS", HttpStatus.FOUND.value());
				map.put("RESPONE_DATA", nr);
				resentity = new ResponseEntity<Map<String, Object>>(map,
						HttpStatus.OK);
			} else {
				map.put("MESSAGE", "ARTICLE NOT FOUND");
				map.put("STATUS", HttpStatus.NOT_FOUND.value());
				resentity = new ResponseEntity<Map<String, Object>>(map,
						HttpStatus.NOT_FOUND);
			}
			break;
		case "R":
			List<ArticleDto> list = dao.search(art);
			if (list.isEmpty()) {
				map.put("MESSAGE", "ARTICLE NOT FOUND");
				map.put("STATUS", HttpStatus.NOT_FOUND.value());
				resentity = new ResponseEntity<Map<String, Object>>(map,
						HttpStatus.NOT_FOUND);
			} else {
				map.put("MESSAGE", "ARTICLE WAS FOUND");
				map.put("STATUS", HttpStatus.FOUND.value());
				map.put("RESPONE_DATA", list);
				resentity = new ResponseEntity<Map<String, Object>>(map,
						HttpStatus.OK);
			}
			break;
		case "D":
			if (dao.delete(art)) {
				map.put("MESSAGE", "ARTICLE HAS BEEN DELETED");
				map.put("STATUS", HttpStatus.ACCEPTED.value());
				resentity = new ResponseEntity<Map<String, Object>>(map,
						HttpStatus.OK);
			} else {
				map.put("MESSAGE", "ARTICLE HAS BEEN DELETE FAILED");
				map.put("STATUS", HttpStatus.NOT_FOUND.value());
				resentity = new ResponseEntity<Map<String, Object>>(map,
						HttpStatus.NOT_FOUND);
			}
			break;
		case "TC":
			ArticleDto article = dao.show(art);
			if (article != null) {
				map.put("MESSAGE", "ARTICLE HAS BEEN FOUND");
				map.put("STATUS", HttpStatus.FOUND.value());
				map.put("RESPONE_DATA", article);
				resentity = new ResponseEntity<Map<String, Object>>(map,
						HttpStatus.OK);
			} else {
				map.put("MESSAGE", "ARTICLE NOT FOUND");
				map.put("STATUS", HttpStatus.NOT_FOUND.value());
				resentity = new ResponseEntity<Map<String, Object>>(map,
						HttpStatus.NOT_FOUND);
			}
			break;
		case "U":
			if (dao.update(art)) {
				map.put("MESSAGE", "ARTICLE HAS BEEN UPDATED");
				map.put("STATUS", HttpStatus.ACCEPTED.value());
				resentity = new ResponseEntity<Map<String, Object>>(map,
						HttpStatus.OK);
			} else {
				map.put("MESSAGE", "ARTICLE HAS BEEN UPDATE FAILED");
				map.put("STATUS", HttpStatus.NOT_ACCEPTABLE.value());
				resentity = new ResponseEntity<Map<String, Object>>(map,
						HttpStatus.NOT_FOUND);
			}
			break;
		case "CS":
			if (dao.toggle(art)) {
				map.put("MESSAGE", "ARTICLE STATUS HAS BEEN CHANDED");
				map.put("STATUS", HttpStatus.ACCEPTED.value());
				resentity = new ResponseEntity<Map<String, Object>>(map,
						HttpStatus.OK);
			} else {
				map.put("MESSAGE", "ARTICLE HAS BEEN SAVE FAILED");
				map.put("STATUS", HttpStatus.NOT_MODIFIED.value());
				resentity = new ResponseEntity<Map<String, Object>>(map,
						HttpStatus.NOT_FOUND);
			}

		}
		return resentity;
	}

	@RequestMapping(method = RequestMethod.POST, value = "uploadfile")
	public ResponseEntity<Map<String, Object>> uploadFile(
			@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String filename = file.getOriginalFilename();
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				// creating the directory to store file
				String savePath = request.getSession().getServletContext()
						.getRealPath("resources/upload/images");
				File path = new File(savePath);
				if (!path.exists()) {
					path.mkdir();
				}
				// creating the file on server
				File serverFile = new File(savePath + File.separator + filename);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				logger.info("Server File Location="
						+ serverFile.getAbsolutePath());
				map.put("MESSAGE", "UPLOAD IMAGE SUCCESSFUL");
				map.put("STATUS", HttpStatus.CREATED.value());
				map.put("RESPONE_DATA", savePath);
				return new ResponseEntity<Map<String, Object>>(map,
						HttpStatus.OK);
			} catch (Exception e) {
				System.out.println("You are failed to upload " + filename
						+ " => " + e.getMessage());
			}
		} else {
			System.out.println("You are failed to upload " + filename
					+ " because the file was empty!");
		}
		map.put("MESSAGE", "FILE CAN'T UPLOAD");
		map.put("STATUS", HttpStatus.NOT_ACCEPTABLE.value());
		return new ResponseEntity<Map<String, Object>>(map,
				HttpStatus.NOT_ACCEPTABLE);
	}

	/*
	  @RequestMapping(value = "/addarticle", method = RequestMethod.POST)
	  public ResponseEntity<Map<String, Object>> addArticle(ArticleDto art,
	  
	  @RequestParam("file") MultipartFile file, HttpServletRequest request) {
	  String filename = file.getOriginalFilename(); if (!file.isEmpty()) { try
	  { byte[] bytes = file.getBytes(); // creating the directory to store file
	  String savePath = request.getSession().getServletContext()
	  .getRealPath("/resources/upload/images"); File path = new File(savePath);
	  if (!path.exists()) { path.mkdir(); } // creating the file on server File
	  serverFile = new File(savePath + File.separator + filename);
	  BufferedOutputStream stream = new BufferedOutputStream( new
	  FileOutputStream(serverFile)); stream.write(bytes); stream.close();
	  
	  logger.info("Server File Location=" + serverFile.getAbsolutePath());
	  System.out.println(serverFile.getAbsolutePath());
	  System.out.println("You are successfully uploaded file " + filename); }
	  catch (Exception e) { System.out.println("You are failed to upload " +
	  filename + " => " + e.getMessage()); } }
	  
	  Map<String, Object> map = new HashMap<String, Object>();
	  art.setImage(filename); if (dao.add(art)) { map.put("MESSAGE",
	  "ARTICLE HAS BEEN SAVED"); map.put("STATUS",
	  HttpStatus.ACCEPTED.value()); return new ResponseEntity<Map<String,
	  Object>>(map, HttpStatus.OK); } else { map.put("MESSAGE",
	  "ARTICLE HAS BEEN SAVE FAILED"); map.put("STATUS",
	  HttpStatus.NOT_ACCEPTABLE.value()); return new ResponseEntity<Map<String,
	  Object>>(map, HttpStatus.NOT_FOUND); } }
	  
	  @RequestMapping(value = "/updatearticle", method = RequestMethod.PUT)
	  public ResponseEntity<Map<String, Object>> updateArticle(ArticleDto art)
	  { Map<String, Object> map = new HashMap<String, Object>(); if
	  (dao.update(art)) { map.put("MESSAGE", "ARTICLE HAS BEEN UPDATED");
	  map.put("STATUS", HttpStatus.ACCEPTED.value()); return new
	  ResponseEntity<Map<String, Object>>(map, HttpStatus.OK); } else {
	  map.put("MESSAGE", "ARTICLE HAS BEEN UPDATE FAILED"); map.put("STATUS",
	  HttpStatus.NOT_ACCEPTABLE.value()); return new ResponseEntity<Map<String,
	  Object>>(map, HttpStatus.NOT_FOUND); } }
	  
	  @RequestMapping(value = "/deletearticle", method = RequestMethod.DELETE)
	  public ResponseEntity<Map<String, Object>> deleteArticle(
	  
	  @RequestParam("id") int id) { Map<String, Object> map = new
	  HashMap<String, Object>(); if (dao.delete(id)) { map.put("MESSAGE",
	  "ARTICLE HAS BEEN DELETED"); map.put("STATUS",
	  HttpStatus.ACCEPTED.value()); return new ResponseEntity<Map<String,
	  Object>>(map, HttpStatus.OK); } else { map.put("MESSAGE",
	  "ARTICLE HAS BEEN DELETE FAILED"); map.put("STATUS",
	  HttpStatus.NOT_FOUND.value()); return new ResponseEntity<Map<String,
	  Object>>(map, HttpStatus.NOT_FOUND); } }
	  
	  @RequestMapping(value = "/changearticlestatus", method =
	  RequestMethod.POST) public ResponseEntity<Map<String, Object>>
	  changeArticleStatus(
	  
	  @RequestParam("id") int artId) { Map<String, Object> map = new
	  HashMap<String, Object>(); if (dao.toggle(artId)) { map.put("MESSAGE",
	  "ARTICLE STATUS HAS BEEN CHANDED"); map.put("STATUS",
	  HttpStatus.ACCEPTED.value()); return new ResponseEntity<Map<String,
	  Object>>(map, HttpStatus.OK); } else { map.put("MESSAGE",
	  "ARTICLE HAS BEEN SAVE FAILED"); map.put("STATUS",
	  HttpStatus.NOT_MODIFIED.value()); return new ResponseEntity<Map<String,
	  Object>>(map, HttpStatus.NOT_FOUND); } }
	  
	  @RequestMapping(value = "/showarticle", method = RequestMethod.POST)
	  public ResponseEntity<Map<String, Object>> showArticle(
	  
	  @RequestParam("id") int artId) { Map<String, Object> map = new
	  HashMap<String, Object>(); ArticleDto article = dao.show(artId); if
	  (article != null) { map.put("MESSAGE", "ARTICLE HAS BEEN FOUND");
	  map.put("STATUS", HttpStatus.FOUND.value()); map.put("RESPONE_DATA",
	  article); return new ResponseEntity<Map<String, Object>>(map,
	  HttpStatus.OK); } else { map.put("MESSAGE", "ARTICLE NOT FOUND");
	  map.put("STATUS", HttpStatus.NOT_FOUND.value()); return new
	  ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND); } }
	  
	  @RequestMapping(value = "/displayarticle", method = RequestMethod.POST)
	  public ResponseEntity<Map<String, Object>> displayArticle(
	  
	  @RequestParam("userid") int userid,
	  
	  @RequestParam("colname") String columnName,
	  
	  @RequestParam("key") String key,
	  
	  @RequestParam("limit") int limitrow, @RequestParam("page") int page) {
	  Map<String, Object> map = new HashMap<String, Object>(); List<ArticleDto>
	  articles = dao.search(userid, columnName, key, limitrow, page); if
	  (!(articles.isEmpty())) { map.put("MESSAE", "ARTICLES HAS BEEN FOUND");
	  map.put("STATUS", HttpStatus.FOUND.value()); map.put("RESPONE_DATA",
	  articles); return new ResponseEntity<Map<String, Object>>(map,
	  HttpStatus.OK); } else { map.put("MESSAGE", "ARTICLES NOT FOUND");
	  map.put("STATUS", HttpStatus.NOT_FOUND.value()); return new
	  ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND); } }
	  
	  @RequestMapping(value = "/getnumberrow", method = RequestMethod.POST)
	  public ResponseEntity<Map<String, Object>> getNumberRow(
	  
	  @RequestParam("userid") int userid,
	  
	  @RequestParam("colname") String columnName,
	  
	  @RequestParam("key") String key) { Map<String, Object> map = new
	  HashMap<String, Object>();
	  
	  int rows = dao.getRowNumber(userid, columnName, key); if (rows != 0) {
	  map.put("MESSAGE", "HAS NUMBER OF ROW"); map.put("STATUS",
	  HttpStatus.FOUND.value()); map.put("RESPONE_DATA", rows); return new
	  ResponseEntity<Map<String, Object>>(map, HttpStatus.OK); } else {
	  map.put("MESSAGE", "NO DATA IN TABLE"); map.put("STATUS",
	  HttpStatus.NOT_FOUND); return new ResponseEntity<Map<String,
	  Object>>(map, HttpStatus.NOT_FOUND); } }
	 
*/
}
