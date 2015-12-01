package com.ams.app.services;

import java.util.List;

import com.ams.app.entities.Article;
import com.ams.app.entities.User;

public interface AuthorArticleService {
	
	public boolean add(Article art);
	public boolean update(Article art);
	public boolean delete(Article art);
	//toggle between enable/disable an article
	public boolean toggle(Article art);
	public Article show(Article art);
	public List<Article> search(Article art);
	public int getRowNumber(Article art);
	public User checkUser(String username);
}
