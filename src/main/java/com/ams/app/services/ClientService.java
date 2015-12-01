package com.ams.app.services;

import java.util.ArrayList;

import com.ams.app.entities.Article;

public interface ClientService {
	   
	public ArrayList<Article> getArticleList(int page,int numberrow);
	public ArrayList<Article> searchArticle(String rowname,String search,int page,int numberrow);
	public int getNumberRow(String rowname,String search);
	public Article getArticle(int id);
}
