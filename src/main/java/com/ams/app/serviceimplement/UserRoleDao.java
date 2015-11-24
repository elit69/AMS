package com.ams.app.serviceimplement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;
import com.ams.app.entities.UserRoleDto;
import com.ams.app.services.UserRoleService;

public class UserRoleDao implements UserRoleService{

	private DataSource dataSource;
	private Connection con;
	
	public UserRoleDao(DataSource dataSource2) {
		this.dataSource = dataSource2;
	}
	
	@Override
	public ArrayList<UserRoleDto> getAllRoles() {
		UserRoleDto role = null;
		try {
			con = dataSource.getConnection();
			String sql = "SELECT * FROM tbuser_role ORDER BY id";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			ArrayList<UserRoleDto> users = new ArrayList<UserRoleDto>();
			while (rs.next()) {
				role=new UserRoleDto();
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
	public boolean insertUserRole(UserRoleDto role) {
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
}
