package com.ams.app.serviceimplement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import com.ams.app.entities.Article;
import com.ams.app.services.ArticleService;


public class ArticleImpl implements ArticleService {


	private DataSource dataSource;

	public ArticleImpl(DataSource dataSource2) {
		this.dataSource = dataSource2;
	}

	public ArrayList<Article> list(int limit, int page) {		
		if(page < 1) page = 1;
		if(limit < 1) limit = 15;
		if(limit > 100) limit = 100;
		System.out.println(limit);
		int offset = limit * page - limit;		
		String sql = "SELECT tbarticle. ID, tbarticle.title, tbarticle.publish_date, tbarticle. ENABLE, tbarticle.image, tbarticle. CONTENT, tbarticle.userid, tbuser. NAME "
				+ "FROM ( tbarticle JOIN tbuser ON ((tbarticle.userid = tbuser. ID))) "
				+ "ORDER BY tbarticle. ID "
				+ "LIMIT ? OFFSET ?";
		try (Connection cnn = dataSource.getConnection();
				PreparedStatement ps = cnn.prepareStatement(sql);		
		)
		{
			ps.setInt(1, limit);
			ps.setInt(2, offset);
			ResultSet rs = ps.executeQuery();
			System.out.println(ps);
			ArrayList<Article> arr = new ArrayList<Article>();
			Article a = null;
			while(rs.next()){
				a = new Article();
				a.setTitle(rs.getString("title"));
				a.setContent(rs.getString("content"));
				a.setEnable(rs.getBoolean("enable"));
				a.setId(rs.getInt("id"));
				a.setName(rs.getString("name"));
				a.setImage(rs.getString("image"));
				a.setUserid(rs.getInt("userid"));
				a.setPdate(rs.getDate("publish_date"));
				arr.add(a);
			}
			return arr;

		} catch (SQLException e) {
		e.printStackTrace();
		}
		return null;
	}

	public boolean add(Article art) {
		String sql = "INSERT INTO tbarticle(title,userid,content,publish_date,enable,image) VALUES(?,?,?,?,?,?)";
		try (Connection cnn = dataSource.getConnection(); PreparedStatement ps = cnn.prepareStatement(sql);) {
			ps.setString(1, art.getTitle());
			ps.setInt(2, art.getUserid());
			ps.setString(3, art.getContent());
			ps.setDate(4, art.getPdate());
			ps.setBoolean(5, art.getEnable());
			ps.setString(6, art.getImage());
			if (ps.executeUpdate() > 0){
				System.out.println(ps);
				return true;
			}
		} catch (SQLException e) {
		e.printStackTrace();
		}
		return false;
	}

	public boolean update(Article art) {
		String sql = "UPDATE tbarticle set title=?,userid=?,content=?,publish_date=?,enable=?,image=? WHERE id =?";
		try (Connection cnn = dataSource.getConnection(); PreparedStatement ps = cnn.prepareStatement(sql);) {
			ps.setString(1, art.getTitle());
			ps.setInt(2, art.getUserid());
			ps.setString(3, art.getContent());
			ps.setDate(4, art.getPdate());
			ps.setBoolean(5, art.getEnable());
			ps.setString(6, art.getImage());
			ps.setInt(7, art.getId());
			if (ps.executeUpdate() > 0){
				System.out.println(ps);
				return true;
			}
		} catch (SQLException e) {
		e.printStackTrace();
		}
		return false;
	}

	public boolean delete(int artId) {
		String sql = "DELETE FROM tbarticle WHERE id =?";
		try (Connection cnn = dataSource.getConnection(); PreparedStatement ps = cnn.prepareStatement(sql);) {
			ps.setInt(1, artId);
			if (ps.executeUpdate() > 0){
				System.out.println(ps);
				return true;
			}

		} catch (SQLException e) {
		e.printStackTrace();
		}
		return false;
	}

	public Article show(int artId) {
		Article a = new Article();
		String sql = "SELECT tbarticle. ID, tbarticle.title, tbarticle.publish_date, tbarticle. ENABLE, tbarticle.image, tbarticle. CONTENT, tbarticle.userid, tbuser. NAME "
				+ "FROM ( tbarticle JOIN tbuser ON ((tbarticle.userid = tbuser. ID))) "
				+ "WHERE tbarticle. ID = ?";
		try (Connection cnn = dataSource.getConnection();
			PreparedStatement ps = cnn.prepareStatement(sql);
		) {
			ps.setInt(1, artId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				a.setTitle(rs.getString("title"));
				a.setContent(rs.getString("content"));
				a.setEnable(rs.getBoolean("enable"));
				a.setId(rs.getInt("id"));
				a.setName(rs.getString("name"));
				a.setImage(rs.getString("image"));
				a.setUserid(rs.getInt("userid"));
				a.setPdate(rs.getDate("publish_date"));
				return a;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<Article> search(String type, String keyword, int limit, int page) {
		if(page < 1) page = 1;
		if(limit < 1) limit = 15;
		if(limit > 100) limit = 100;
		int offset = limit * page - limit;
		ArrayList<Article> list = new ArrayList<>();
		Article s = null;
		String sql = "SELECT id,title,name,publish_date,userid,content,enable,image"
				+ " FROM v_list_all_article"
				+ " WHERE Lower(" + type + ")"
				+ " LIKE ? LIMIT ? OFFSET ?";
		try (Connection conn = dataSource.getConnection(); 
			PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setString(1, "%" + keyword.toLowerCase() + "%");
			ps.setInt(2, limit);
			ps.setInt(3, offset);
			ResultSet rs = ps.executeQuery();
			System.out.println(ps);
			while (rs.next()) {
				s = new Article();
				s.setId(rs.getInt("id"));
				s.setTitle(rs.getString("title"));
				s.setUserid(rs.getInt("userid"));
				s.setName(rs.getString("name"));
				s.setPdate(rs.getDate("publish_date"));
				s.setEnable(rs.getBoolean("ENABLE"));
				s.setImage(rs.getString("image"));
				s.setContent(rs.getString("content"));
				list.add(s);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	public ArrayList<Article> listByUser(int userid, int limitrow, int page) {
		if(page<=0) page=1;
		int offset = limitrow * page - limitrow;
		ArrayList<Article> list = new ArrayList<>();
		Article s = new Article();
		String sql = "SELECT id,title,name,publish_date,userid,content,enable,image"
				+ " FROM v_list_all_article"
				+ " WHERE userid = ?"
				+ " LIMIT ? OFFSET ?";
		try (Connection conn = dataSource.getConnection(); 
			PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setInt(1, userid);
			ps.setInt(2, limitrow);
			ps.setInt(3, offset);
			ResultSet rs = ps.executeQuery();
			System.out.println(ps);
			while (rs.next()) {
				s = new Article();
				s.setId(rs.getInt("id"));
				s.setTitle(rs.getString("title"));
				s.setUserid(rs.getInt("userid"));
				s.setName(rs.getString("name"));
				s.setPdate(rs.getDate("publish_date"));
				s.setEnable(rs.getBoolean("ENABLE"));
				s.setImage(rs.getString("image"));
				s.setContent(rs.getString("content"));
				list.add(s);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	//toggle between enable/disable
	@Override
	public boolean toggle(int artId) {		
		String sql = "UPDATE tbarticle SET enable = not enable WHERE id = ?";
		try (Connection cnn = dataSource.getConnection(); 
				PreparedStatement ps = cnn.prepareStatement(sql);) {
			ps.setInt(1, artId);
			if (ps.executeUpdate() > 0){
				System.out.println(ps);
				return true; //update successfully //not the state of article
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}


}
