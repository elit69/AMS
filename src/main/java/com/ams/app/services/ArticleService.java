package com.ams.app.services;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.ams.app.entities.Article;

@Service
public interface ArticleService {

	public ArrayList<Article> list(int limitrow, int page);
	
	public ArrayList<Article> listByUser(int userid, int limitrow, int page);

	public boolean add(Article art);

	public boolean update(Article art);

	public boolean delete(int artId);

	public boolean toggle(int artId);
	
	public Article show(int artId);

	public ArrayList<Article> search(String columnName, String keyword, int limitrow, int page);
	
}
