package com.ams.app.services;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.ams.app.entities.Article;

@Service
public interface ArticleService {

	public ArrayList<Article> list(int limit, int page);
	
	public ArrayList<Article> listByUser(int userid, int limit, int page);

	public boolean add(Article art);

	public boolean update(Article art);

	public boolean delete(int artId);

	public boolean toggle(int artId);
	
	public Article show(int artId);

	public ArrayList<Article> search(String type, String keyword, int limit, int page);
	
}
