package com.ams.app.serviceimplement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.ams.app.entities.ArticleDto;
import com.ams.app.entities.UserDto;
import com.ams.app.services.AuthorArticleService;

public class AuthorArticleDao implements AuthorArticleService {
   
	private JdbcTemplate jdbcTemplate;
	
	public AuthorArticleDao(JdbcTemplate jdbctemplate){
		this.jdbcTemplate=jdbctemplate;
	}
	
	@Override
	public boolean add(ArticleDto art) {
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
	public boolean update(ArticleDto art) {
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
	public boolean delete(ArticleDto art) {
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
	public boolean toggle(ArticleDto art) {
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
	public ArticleDto show(ArticleDto arts) {
		String sql="SELECT "
				 + "title,image,content,publish_date "
				 + "FROM v_list_all_article "
				 + "WHERE id=?";
		Object[] obj=new Object[]{arts.getId()};
		ArticleDto art=jdbcTemplate.queryForObject(sql,obj,new ArticleRowMaperView());
		return art;
	}
	@Override
	public List<ArticleDto> search(ArticleDto art) {
		int begin=art.getPage()*art.getLimitRow()-art.getLimitRow();
		String sql="SELECT "
				+ "id,title,publish_date,enable "
				+ "FROM v_list_all_article "
				+ "WHERE lower("+art.getColumnName()+") "
				+ "LIKE ? AND userid=? "
				+ "ORDER BY id LIMIT ? OFFSET ? ";
		Object[] obj=new Object[]{art.getSearch().toLowerCase()+"%",art.getUserid(),art.getLimitRow(),begin};
		List<ArticleDto> articles=jdbcTemplate.query(sql,obj,new ArticleRowMaperList());
		return articles;
	}
	@Override
	public int getRowNumber(ArticleDto art) {
		String sql="SELECT count(*) "
				 + "FROM v_list_all_article"
				 + " WHERE LOWER("+art.getColumnName()+") LIKE ? AND userid=?";
		Object[] obj=new Object[]{art.getSearch().toLowerCase()+"%",art.getUserid()};
		int rows=jdbcTemplate.queryForObject(sql,obj,Integer.class);
		
		return rows;
	}
	@Override
	public UserDto checkUser(String username) {
		String sql="SELECT id,name,username,password,image "
				+ "FROM tbuser "
				+ "WHERE username=? AND enable=TRUE";
		Object[] obj=new Object[]{username};
		try{
			UserDto user=jdbcTemplate.queryForObject(sql,obj,new UserRowMaper());
			return user;
		}catch(Exception ex){
			
		}
		
		return null;
	}
	public class ArticleRowMaperList implements RowMapper<ArticleDto>{
		@Override
		public ArticleDto mapRow(ResultSet rs, int arg1) throws SQLException {
			ArticleDto art=new ArticleDto();
			art.setId(rs.getInt(1));
			art.setTitle(rs.getString(2));
			art.setPdate(rs.getDate(3));
			art.setEnable(rs.getBoolean(4));
			return art;
		}
	}
	public class ArticleRowMaperView implements RowMapper<ArticleDto>{
		@Override
		public ArticleDto mapRow(ResultSet rs, int arg1) throws SQLException {
			ArticleDto art=new ArticleDto();
			art.setTitle(rs.getString(1));
			art.setImage(rs.getString(2));
			art.setContent(rs.getString(3));
			art.setPdate(rs.getDate(4));
			return art;
		}
	}
	public class UserRowMaper implements RowMapper<UserDto>{
		@Override
		public UserDto mapRow(ResultSet rs, int arg1) throws SQLException {
			UserDto user=new UserDto();
			user.setId(rs.getInt(1));
			user.setName(rs.getString(2));
			user.setUsername(rs.getString(3));
			user.setPassword(rs.getString(4));
			user.setImage(rs.getString(5));
			return user;
		}
	}
	
}
