package com.ams.app.serviceimplement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.ams.app.entities.Role;
import com.ams.app.services.UserRoleService;

public class UserRoleImpl implements UserRoleService{

	private DataSource dataSource;
	
	public UserRoleImpl(DataSource dataSource2) {
		this.dataSource = dataSource2;
	}

	@Override
	public boolean insertUserRole(int roleid, int userid) {
		try(Connection con = dataSource.getConnection();) {			
			String sql = "INSERT INTO tbuser_role(id,user_id) VALUES(?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			System.out.println("role id="+roleid+"user id="+userid);
			ps.setInt(1, roleid);
			ps.setInt(2, userid);
			if (ps.executeUpdate() > 0){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean updateUserRole(int roleid, int userid) {
		try(Connection con = dataSource.getConnection();){			
			String sql = "UPDATE tbuser_role SET id=? WHERE user_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, roleid);
			ps.setInt(2, userid);
			if (ps.executeUpdate() > 0) {
				System.out.println("success with updated");
				//con.commit();
				return true;
			}
			System.out.println("fail with updated");
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return false;
	}

	@Override
	public List<Role> getUserRoles(int usrId) {
		String sql = "SELECT ROLE FROM	v_get_user_roles WHERE	ID = ?";
		try (Connection cnn = dataSource.getConnection();
				PreparedStatement ps = cnn.prepareStatement(sql);		
		)
		{
			ps.setInt(1, usrId);
			ResultSet rs = ps.executeQuery();
			System.out.println(ps);
			List<Role> arr = new ArrayList<Role>();
			Role a = null;
			while(rs.next()){
				a = new Role();
				a.setId(rs.getInt("id"));
				a.setRole(rs.getString("role"));
				arr.add(a);
			}
			return arr;

		} catch (SQLException e) {
		e.printStackTrace();
		}
		return null;
	}
	
}
