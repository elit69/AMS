package com.ams.app.services;

import java.util.ArrayList;

import com.ams.app.entities.ArticleDto;

public interface ClientService {
	   
	public ArrayList<ArticleDto> getArticleList(int page,int numberrow);
	public ArrayList<ArticleDto> searchArticle(String rowname,String search,int page,int numberrow);
	public int getNumberRow(String rowname,String search);
	public ArticleDto getArticle(int id);
}
