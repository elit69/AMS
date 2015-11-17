package com.ams.services.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

import com.ams.entities.User;
import com.ams.services.UserService;

public class UserServiceImpl implements UserService{
	@Autowired
	private DataSource dataSource;
	private Connection con;
	
	public UserServiceImpl(DataSource dataSource){
		this.dataSource=dataSource;
	}
	
	public ArrayList<User> list() {
		System.out.println("get all students class");
		User user=null;
		try{
			con=dataSource.getConnection();
			String sql="SELECT * FROM tbuser ORDER BY id";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			ArrayList<User> users=new ArrayList<User>();
			while(rs.next()){
				user=new User();
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

	public boolean addUser(User user) {
		try{
			con=dataSource.getConnection();
			String sql="INSERT INTO tbuser VALUES(nextval('sq_user'),?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,user.getName());
			ps.setString(2,user.getGender());
			if(user.getImage() != null){
				ps.setString(3, user.getImage());
			}else{
				ps.setString(3, "default.jpg");
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

	public boolean updateUser(User usr) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean deleteUser(int usrId) {
		// TODO Auto-generated method stub
		return false;
	}

	public User showUser(int usrId) {
		// TODO Auto-generated method stub
		return null;
	}

	public User showUser(String usrName) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<User> searchUser(String keyword, String type) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean add(User usr) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean update(User usr) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean delete(int usrId) {
		// TODO Auto-generated method stub
		return false;
	}

	public User show(int usrId) {
		// TODO Auto-generated method stub
		return null;
	}

	public User show(String usrName) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<User> search(String keyword, String type) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
