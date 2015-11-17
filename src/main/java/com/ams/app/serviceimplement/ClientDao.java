package com.ams.app.serviceimplement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import com.ams.app.entities.ArticleDto;
import com.ams.app.services.ClientService;

public class ClientDao implements ClientService{
  
	private DataSource datasource;
	
	public ClientDao(DataSource datasource){
		this.datasource=datasource;
	}

	@Override
	public ArrayList<ArticleDto> getArticleList(int page, int numberrow) {
		String sql="SELECT id,title,name,publish_date"
				 + " FROM v_article LIMIT ? OFFSET ?";
		int begin=numberrow*page-numberrow;
		ArrayList<ArticleDto> list=new ArrayList<ArticleDto>();
		ArticleDto article=null;
		try(
				Connection con=datasource.getConnection();
				PreparedStatement ps=con.prepareStatement(sql);
		){
			ps.setInt(1,numberrow);
			ps.setInt(2,begin);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				article=new ArticleDto();
				article.setId(rs.getInt(1));
				article.setTitle(rs.getString(2));
				article.setUername(rs.getString(3));
				article.setPubdate(rs.getString(4));
				list.add(article);
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return list;
	}
	
	@Override
	public ArrayList<ArticleDto> searchArticle(String rowname, String search,
			int page, int numberrow) {
		int begin=numberrow*page-numberrow;
		ArrayList<ArticleDto> list=new ArrayList<>();
		ArticleDto article=null;
		
		String sql="SELECT id,title,name,publish_date"
				   + " FROM v_article WHERE Lower("+rowname+") LIKE ? LIMIT ? OFFSET ?";
		
		try(
				Connection conn=datasource.getConnection();
				PreparedStatement ps=conn.prepareStatement(sql);
		){
			ps.setString(1, search.toLowerCase()+"%");
			ps.setInt(2,numberrow);
			ps.setInt(3, begin);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				article=new ArticleDto();
				article.setId(rs.getInt(1));
				article.setTitle(rs.getString(2));
				article.setUername(rs.getString(3));
				article.setPubdate(rs.getString(4));
				list.add(article);
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return list;
	}

	@Override
	public int getNumberRow(String rowname,String search) {
		String sql="Select Count(*) From v_article Where Lower("+rowname+") Like ?";
		int rownumber=0;
		try(
				Connection conn=datasource.getConnection();
				PreparedStatement ps=conn.prepareStatement(sql);
		){
			ps.setString(1,search.toLowerCase()+"%");
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				rownumber=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return rownumber;
	}
}
