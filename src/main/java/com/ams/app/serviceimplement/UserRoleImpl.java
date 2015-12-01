package com.ams.app.serviceimplement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.sql.DataSource;

import com.ams.app.entities.UserRole;
import com.ams.app.services.UserRoleService;

public class UserRoleImpl implements UserRoleService{

	private DataSource dataSource;
	private Connection con;
	
	public UserRoleImpl(DataSource dataSource2) {
		this.dataSource = dataSource2;
	}

	@Override
	public boolean insertUserRole(UserRole role) {
		try {
			con = dataSource.getConnection();
			String sql = "INSERT INTO tbuser_role(id,user_id) VALUES(?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			System.out.println("role id="+role.getId()+"user id="+role.getUser_id());
			ps.setInt(1, role.getId());
			ps.setInt(2, role.getUser_id());
			if (ps.executeUpdate() > 0){
				return true;
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
		return false;
	}

	@Override
	public boolean updateUserRole(UserRole role) {
		try {
			con = dataSource.getConnection();
			String sql = "UPDATE tbuser_role SET id=? WHERE user_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, role.getId());
			ps.setInt(2, role.getUser_id());
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
	
}
