package com.ams.app.services;

import java.util.List;

import com.ams.app.entities.ArticleDto;
import com.ams.app.entities.UserDto;

public interface AuthorArticleService {
	
	public boolean add(ArticleDto art);
	public boolean update(ArticleDto art);
	public boolean delete(ArticleDto art);
	//toggle between enable/disable an article
	public boolean toggle(ArticleDto art);
	public ArticleDto show(ArticleDto art);
	public List<ArticleDto> search(ArticleDto art);
	public int getRowNumber(ArticleDto art);
	public UserDto checkUser(String username);
}
