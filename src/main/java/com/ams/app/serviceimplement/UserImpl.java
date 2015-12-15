package com.ams.app.serviceimplement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import com.ams.app.entities.User;
import com.ams.app.services.UserService;


public class UserImpl implements UserService {


	private DataSource dataSource;
	private Connection con;
	public UserImpl(DataSource dataSource2) {
		this.dataSource = dataSource2;
	}

	@Override
	public ArrayList<User> list(int limitrow, int page) {
		if(page<=0) page=1;
		int offset = limitrow * page - limitrow;
		User user = null;
		try {
			con = dataSource.getConnection();
			String sql = "SELECT * FROM tbuser where enable = true ORDER BY id LIMIT ? OFFSET ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, limitrow);
			ps.setInt(2, offset);
			ResultSet rs = ps.executeQuery();
			ArrayList<User> users = new ArrayList<User>();
			while (rs.next()) {
				user = new User();
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
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	@Override
	public boolean insert(User user) {
		System.out.println("user dao."+user.getName());
		
		try {
			con = dataSource.getConnection();
			String sql = "INSERT INTO tbuser(username,password,enable,email,address,phone,name,gender,image) "
					+ "VALUES(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setBoolean(3, user.isEnable());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getAddress());
			ps.setString(6, user.getPhone());
			ps.setString(7, user.getName());
			ps.setString(8, user.getGender());
			if (user.getImage() != null) {
				ps.setString(9, user.getImage());
			} else {
				ps.setString(9, "default.jpg");
			}
			if (ps.executeUpdate() > 0)
				return true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	@Override
	public boolean update(User user) {
		//System.out.println("user enable "+user.isEnable());
		try {
			con = dataSource.getConnection();
			String sql = "UPDATE tbuser SET username=? , password=? ," //enable = ?,"
					+ "email=?, address=?, phone=?, name=?,"
					+ "gender=?, image=? WHERE id = ?";// and enable = true";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			//ps.setBoolean(3, user.isEnable());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getAddress());
			ps.setString(5, user.getPhone());
			ps.setString(6, user.getName());
			ps.setString(7, user.getGender());
			ps.setString(8, user.getImage());
			ps.setInt(9, user.getId());
			if (ps.executeUpdate() > 0) {
				System.out.println("success with updated");
				//con.commit();
				return true;
			}
			System.out.println("fail with updated");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	@Override
	public User show(int id) {
		try {
			con = dataSource.getConnection();
			String sql = "SELECT * FROM tbuser WHERE id=? and enable = true Limit 1";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			User user = null;
			if (rs.next()) {
				user = new User();
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
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	@Override
	public User show(String usrName) {
		try {
			con = dataSource.getConnection();
			String sql = "SELECT * FROM tbuser WHERE username=? and enable = true Limit 1";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, usrName);
			ResultSet rs = ps.executeQuery();
			User user = null;
			if (rs.next()) {
				user = new User();
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
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
		
	@Override
	public ArrayList<User> search(String columnName, String keyword, int limitrow, int page) {
		if(page<=0) page=1;
		int offset = limitrow * page - limitrow;
		ArrayList<User> list = new ArrayList<>();
		User user = null;
		String sql = "SELECT id,username,password,enable,email,address,phone,name,gender,image"
				+ " FROM tbuser"
				+ " WHERE Lower(" + columnName + ") LIKE ? AND enable = true"
				+ " LIMIT ? OFFSET ?";
		try (Connection conn = dataSource.getConnection(); 
			PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setString(1, "%" + keyword.toLowerCase() + "%");
			ps.setInt(2, limitrow);
			ps.setInt(3, offset);
			ResultSet rs = ps.executeQuery();
			System.out.println(ps);
			while (rs.next()) {
				user = new User();
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
				list.add(user);
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return list;
	}

	@Override
	public boolean toggle(int artId) {
		String sql = "UPDATE tbuser SET enable = not enable WHERE id = ?";
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
