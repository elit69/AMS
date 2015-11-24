package com.ams.app.services;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.ams.app.entities.ArticleDto;

@Service
public interface ArticleService {

	public ArrayList<ArticleDto> list(int limitrow, int page);
	
	public ArrayList<ArticleDto> listByUser(int userid, int limitrow, int page);

	public boolean add(ArticleDto art);

	public boolean update(ArticleDto art);

	public boolean delete(int artId);

	public boolean toggle(int artId);
	
	public ArticleDto show(int artId);

	public ArrayList<ArticleDto> search(String columnName, String keyword, int limitrow, int page);
	
}
