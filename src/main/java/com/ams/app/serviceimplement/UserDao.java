package com.ams.app.serviceimplement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

import com.ams.app.entities.UserDto;
import com.ams.app.services.UserService;

public class UserDao implements UserService{
	@Autowired
	private DataSource dataSource;
	private Connection con;
	
	public UserDao(DataSource dataSource){
		this.dataSource=dataSource;
	}
	
	public ArrayList<UserDto> getAllUser() {
		UserDto user=null;
		try{
			con=dataSource.getConnection();
			String sql="SELECT * FROM tbuser ORDER BY id";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			ArrayList<UserDto> users=new ArrayList<UserDto>();
			while(rs.next()){
				user=new UserDto();
				user.setId(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setEnable(rs.getBoolean(4));
				user.setEmail(rs.getString(5));
				user.setAddress(rs.getString(6));
				user.setPhone(rs.getString(7));
				user.setName(rs.getString(8));
				user.setGender(rs.getString(9));
				user.setImage(rs.getString(10));
				
				users.add(user);
			}
			rs.close();
			return users;
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public boolean insertUser(UserDto user) {
		try{
			con=dataSource.getConnection();
			String sql="INSERT INTO tbuser VALUES(nextval('sq_user'),?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setBoolean(3, user.isEnable());
			ps.setString(4,user.getEmail());
			ps.setString(5,user.getAddress());
			ps.setString(6,user.getPhone());
			ps.setString(7, user.getName());
			ps.setString(8,user.getGender());
			if(user.getImage() != null){
				ps.setString(9, user.getImage());
			}else{
				ps.setString(9, "default.jpg");
			}
			if(ps.executeUpdate()>0) return true;
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean updateUser(UserDto user) {
		try{
			con = dataSource.getConnection();
			String sql = "UPDATE tbuser SET username=? , password=? , enable = ?,"+
											"email=?, address=?, phone=?, name=?,"+
											"gender=?, image=? WHERE id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2,user.getPassword());
			ps.setBoolean(3, user.isEnable());
			ps.setString(4,user.getEmail());
			ps.setString(5,user.getAddress());
			ps.setString(6,user.getPhone());
			ps.setString(7,user.getName());
			ps.setString(8,user.getGender());
			ps.setString(9,user.getImage());
			ps.setInt(10,user.getId());
			if(ps.executeUpdate() > 0){ 
				System.out.println("success with updated");
				return true;
			}
			System.out.println("fail with updated");
		}catch(SQLException e){
				e.printStackTrace();
		}finally{
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return false;
	}

	public boolean deleteUser(int id) {
		try{
			con = dataSource.getConnection();
			String sql = "DELETE FROM tbuser  WHERE id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			if(ps.executeUpdate() > 0) return true;
		}catch(SQLException e){
				e.printStackTrace();
		}finally{
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return false;
	}

	public UserDto getUser(int id) {
		try{
			con =	dataSource.getConnection();
			String sql = "SELECT * FROM tbuser WHERE id=? Limit 1";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			UserDto user = null;
			if(rs.next()){
				user.setId(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setEnable(rs.getBoolean(4));
				user.setEmail(rs.getString(5));
				user.setAddress(rs.getString(6));
				user.setPhone(rs.getString(7));
				user.setName(rs.getString(8));
				user.setGender(rs.getString(9));
				user.setImage(rs.getString(10));
				return user;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return null;
	}

	public ArrayList<UserDto> getPagination(int page, int limit) {
				UserDto user=null;
				int begin;
				begin=(page*limit)-limit;
				try{
					con=dataSource.getConnection();
					String sql="SELECT * FROM tbuser OFFSET "+begin+" LIMIT "+limit;
					PreparedStatement ps=con.prepareStatement(sql);
					ResultSet rs=ps.executeQuery();
					ArrayList<UserDto> users=new ArrayList<UserDto>();
					while(rs.next()){
						user=new UserDto();
						user.setId(rs.getInt(1));
						user.setUsername(rs.getString(2));
						user.setPassword(rs.getString(3));
						user.setEnable(rs.getBoolean(4));
						user.setEmail(rs.getString(5));
						user.setAddress(rs.getString(6));
						user.setPhone(rs.getString(7));
						user.setName(rs.getString(8));
						user.setGender(rs.getString(9));
						user.setImage(rs.getString(10));
						
						users.add(user);
					}
					rs.close();
					return users;
				}catch(SQLException e){
					e.printStackTrace();
				}finally{
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				return null;
	}

	public int getTotalPage(int limit) {
		int total_page;
		try{
			con=dataSource.getConnection();
			String sql="SELECT * FROM tbuser";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total_page=rs.getInt(1)/limit;
			rs.close();
			return total_page;
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

	public UserDto showUser(String usrName) {
		try{
			con =	dataSource.getConnection();
			String sql = "SELECT * FROM tbuser WHERE username=? Limit 1";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, usrName);
			ResultSet rs = ps.executeQuery();
			UserDto user = null;
			if(rs.next()){
				user.setId(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setEnable(rs.getBoolean(4));
				user.setEmail(rs.getString(5));
				user.setAddress(rs.getString(6));
				user.setPhone(rs.getString(7));
				user.setName(rs.getString(8));
				user.setGender(rs.getString(9));
				user.setImage(rs.getString(10));
				return user;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return null;
	}

	public ArrayList<UserDto> searchUser(String keyword, String type) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
