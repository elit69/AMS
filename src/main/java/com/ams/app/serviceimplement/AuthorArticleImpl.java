package com.ams.app.serviceimplement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.ams.app.entities.Article;
import com.ams.app.entities.User;
import com.ams.app.services.AuthorArticleService;

public class AuthorArticleImpl implements AuthorArticleService {
   
	private JdbcTemplate jdbcTemplate;
	
	public AuthorArticleImpl(JdbcTemplate jdbctemplate){
		this.jdbcTemplate=jdbctemplate;
	}
	
	@Override
	public boolean add(Article art) {
	    String sql="INSERT INTO tbarticle(title,content,image,userid,publish_date,enable) "
	    		 + "VALUES(?,?,?,?,Now(),?)";
	    Object obj[]=new Object[]{art.getTitle(),art.getContent(),art.getImage(),art.getUserid(),art.getEnable()};
	    
	    int insert=jdbcTemplate.update(sql,obj);
	    if(insert>0)
	    	return true;
	    else 
		    return false;
	}
	@Override
	public boolean update(Article art) {
		String sql="UPDATE tbarticle "
				 + "SET title=?,content=?,image=? "
				 + "WHERE id=?";
		Object obj[]=new Object[]{art.getTitle(),art.getContent(),art.getImage(),art.getId()};
		
		int update =jdbcTemplate.update(sql,obj);
		if(update>0)
			return true;
		else
			return false;
	}

	@Override
	public boolean delete(Article art) {
		String sql = "DELETE FROM tbarticle "
					+ "WHERE id = ?";
		Object[] obj=new Object[]{art.getId()};
		int delete=jdbcTemplate.update(sql,obj);
		if(delete>0)
			return true;
		else
			return false;
	}
	@Override
	public boolean toggle(Article art) {
		String sql = "UPDATE tbarticle "
					+ "SET enable = not enable "
					+ "WHERE id = ?";
		Object[] obj=new Object[]{art.getId()};
		
		int update=jdbcTemplate.update(sql,obj);
		if(update>0)
			return true;
		else
			return false;
	}
	@Override
	public Article show(Article arts) {
		String sql="SELECT "
				 + "title,image,content,publish_date "
				 + "FROM v_list_all_article "
				 + "WHERE id=?";
		Object[] obj=new Object[]{arts.getId()};
		Article art=jdbcTemplate.queryForObject(sql,obj,new ArticleRowMaperView());
		return art;
	}
	@Override
	public List<Article> search(Article art) {
		int begin=art.getPage()*art.getLimitRow()-art.getLimitRow();
		String sql="SELECT "
				+ "id,title,publish_date,enable "
				+ "FROM v_list_all_article "
				+ "WHERE lower("+art.getColumnName()+") "
				+ "LIKE ? AND userid=? "
				+ "ORDER BY id LIMIT ? OFFSET ? ";
		Object[] obj=new Object[]{art.getSearch().toLowerCase()+"%",art.getUserid(),art.getLimitRow(),begin};
		List<Article> articles=jdbcTemplate.query(sql,obj,new ArticleRowMaperList());
		return articles;
	}
	@Override
	public int getRowNumber(Article art) {
		String sql="SELECT count(*) "
				 + "FROM v_list_all_article"
				 + " WHERE LOWER("+art.getColumnName()+") LIKE ? AND userid=?";
		Object[] obj=new Object[]{art.getSearch().toLowerCase()+"%",art.getUserid()};
		int rows=jdbcTemplate.queryForObject(sql,obj,Integer.class);
		
		return rows;
	}
	@Override
	public User checkUser(String username) {
		String sql="SELECT id,name,username,password,image "
				+ "FROM tbuser "
				+ "WHERE username=? AND enable=TRUE";
		Object[] obj=new Object[]{username};
		try{
			User user=jdbcTemplate.queryForObject(sql,obj,new UserRowMaper());
			return user;
		}catch(Exception ex){
			
		}
		
		return null;
	}
	public class ArticleRowMaperList implements RowMapper<Article>{
		@Override
		public Article mapRow(ResultSet rs, int arg1) throws SQLException {
			Article art=new Article();
			art.setId(rs.getInt(1));
			art.setTitle(rs.getString(2));
			art.setPdate(rs.getDate(3));
			art.setEnable(rs.getBoolean(4));
			return art;
		}
	}
	public class ArticleRowMaperView implements RowMapper<Article>{
		@Override
		public Article mapRow(ResultSet rs, int arg1) throws SQLException {
			Article art=new Article();
			art.setTitle(rs.getString(1));
			art.setImage(rs.getString(2));
			art.setContent(rs.getString(3));
			art.setPdate(rs.getDate(4));
			return art;
		}
	}
	public class UserRowMaper implements RowMapper<User>{
		@Override
		public User mapRow(ResultSet rs, int arg1) throws SQLException {
			User user=new User();
			user.setId(rs.getInt(1));
			user.setName(rs.getString(2));
			user.setUsername(rs.getString(3));
			user.setPassword(rs.getString(4));
			user.setImage(rs.getString(5));
			return user;
		}
	}
	
}
