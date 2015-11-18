package com.ams.app.serviceimplement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ams.app.entities.ArticleDto;
import com.ams.app.services.ArticleService;

@Repository
public class ArticleDao implements ArticleService {

	@Autowired
	private DataSource dataSource;

	public String list(int limit,int offset) {
		
		String sql = "select f_list_article(?,?)";
		try (Connection cnn = dataSource.getConnection();
				PreparedStatement ps = cnn.prepareStatement(sql);
		
		)
		{
			ps.setInt(1, limit);
			ps.setInt(2, offset);
			ResultSet rs = ps.executeQuery();
			rs.next();
			return rs.getString(1);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return null;
	}

	public boolean add(ArticleDto art) {
		String sql = "INSERT INTO tblarticle(title,userid,content,publish_date,enable,image) VALUES(?,?,?,NOW(),?,?)";
		try (Connection cnn = dataSource.getConnection(); PreparedStatement ps = cnn.prepareStatement(sql);) {
			ps.setString(1, art.getTitle());
			ps.setInt(2, art.getUserid());
			ps.setString(3, art.getContent());
			ps.setDate(4, art.getPdate());
			ps.setBoolean(5, art.getEnable());
			ps.setString(6, art.getImage());
			if (ps.executeUpdate() > 0)
				return true;

		} catch (SQLException e) {
			System.out.println(e);
		}
		return false;
	}

	public boolean update(ArticleDto art) {
		String sql = "UPDATE tbarticle set title=?,userid=?,content=?,publish_date=?,enable=?,image=? WHERE id =?";
		try (Connection cnn = dataSource.getConnection(); PreparedStatement ps = cnn.prepareStatement(sql);) {
			ps.setString(1, art.getTitle());
			ps.setInt(2, art.getUserid());
			ps.setString(2, art.getContent());
			ps.setBoolean(4, art.getEnable());
			ps.setString(5, art.getImage());
			if (ps.executeUpdate() > 0)
				return true;

		} catch (SQLException e) {
			System.out.println(e);
		}
		return false;
	}

	public boolean delete(int artId) {
		String sql = "DELETE FROM tbarticle WHERE id =?";
		try (Connection cnn = dataSource.getConnection(); PreparedStatement ps = cnn.prepareStatement(sql);) {
			ps.setInt(1, artId);
			if (ps.executeUpdate() > 0)
				return true;

		} catch (SQLException e) {
			System.out.println(e);
		}
		return false;
	}

	public String show(int artId) {
		String a = null;
		String sql = "SELECT array_to_json (ARRAY_AGG(row_to_json(T))) FROM ( SELECT tbarticle. ID, tbarticle.title, tbuser. NAME, tbarticle.publish_date, tbarticle. ENABLE, tbarticle.image, tbarticle. CONTENT FROM ( tbarticle JOIN tbuser ON ((tbarticle.userid = tbuser. ID))) WHERE tbarticle. ID = ? ) T";
		try (Connection cnn = dataSource.getConnection(); PreparedStatement ps = cnn.prepareStatement(sql);

		) {
			ps.setInt(1, artId);
			ResultSet rs = ps.executeQuery();
			rs.next();
			a = rs.getString(1);

			System.out.println(a);
			return a;

		} catch (SQLException e) {
			System.out.println(e);
		}
		return null;
	}

	public ArrayList<ArticleDto> search(String columnName, String keyword, int page, int limitrow) {
		int begin = limitrow * page - limitrow;
		ArrayList<ArticleDto> list = new ArrayList<>();
		ArticleDto s = null;
		String sql = "SELECT id,title,name,publish_date,userid,content,enable,image"
				+ " FROM v_list_all_article_lit"
				+ " WHERE Lower(" + columnName + ")"
				+ " LIKE ? LIMIT ? OFFSET ?";
		try (Connection conn = dataSource.getConnection(); 
			PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setString(1, "%" + keyword.toLowerCase() + "%");
			ps.setInt(2, limitrow);
			ps.setInt(3, begin);
			ResultSet rs = ps.executeQuery();
			System.out.println(ps);
			while (rs.next()) {
				s = new ArticleDto();
				s.setId(rs.getInt("id"));
				s.setTitle(rs.getString("title"));
				s.setUserid(rs.getInt("userid"));
				s.setName(rs.getString("name"));
				s.setPdate(rs.getDate("publish_date"));
				s.setEnable(rs.getBoolean("ENABLE"));
				s.setImage(rs.getString("image"));
				list.add(s);
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return list;
	}

}
