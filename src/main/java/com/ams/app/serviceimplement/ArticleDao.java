package com.ams.app.serviceimplement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ams.app.entities.ArticleDto;
import com.ams.app.services.ArticleService;

@Service
public class ArticleDao implements ArticleService {
	
	@Autowired
	private DataSource dataSource;
	
	
	public ArrayList<ArticleDto> list() {
		String sql = "select * from v_list_all_article";
		try (Connection cnn = dataSource.getConnection();
				PreparedStatement ps = cnn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
		)
		{
			ArrayList<ArticleDto> a = new ArrayList<ArticleDto>();
			ArticleDto art=null;
			while (rs.next()) {
				art = new ArticleDto();
				art.setId(rs.getInt("id"));
				art.setTitle(rs.getString("title"));
				art.setContent(rs.getString("content"));
				art.setImage(rs.getString("image"));
				
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				Date publishedDate = format.parse(rs.getString("publish_date"));
				art.setPubdate(format.format(publishedDate));
				art.setEnable(rs.getBoolean("enable"));
				a.add(art);
			}
			return a;
		} catch (SQLException e) {
			System.out.println(e);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean add(ArticleDto art) {
		String sql = "INSERT INTO tblarticle(title,userid,content,publish_date,enable,image) VALUES(?,?,?,NOW(),?,?)";
		try (
				Connection cnn = dataSource.getConnection();
				PreparedStatement ps = cnn.prepareStatement(sql);
			) 
		{
			ps.setString(1, art.getTitle());
			ps.setInt(2, art.getUserid());
			ps.setString(3, art.getContent());
			ps.setBoolean(4, art.getEnable());
			ps.setString(5, art.getImage());
			if(ps.executeUpdate()>0) return true;

		} catch (SQLException e) {
			System.out.println(e);
		} 
		return false;
	}

	public boolean update(ArticleDto art) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean delete(int artId) {
		String sql = "DELETE FROM tbarticle WHERE id =?";
		try (
				Connection cnn = dataSource.getConnection();
				PreparedStatement ps = cnn.prepareStatement(sql);
			) 
		{
			ps.setInt(1, art.getTitle());
			if(ps.executeUpdate()>0) return true;

		} catch (SQLException e) {
			System.out.println(e);
		} 
		return false;
		return false;
	}

	public ArticleDto show(int artId) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<ArticleDto> search(String keyword, String type) {
		// TODO Auto-generated method stub
		return null;
	}

}
