package com.ams.app.serviceimplement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.ams.app.services.UserRoleService;

public class UserRoleImpl implements UserRoleService{

	private DataSource dataSource;
	
	public UserRoleImpl(DataSource dataSource2) {
		this.dataSource = dataSource2;
	}

	@Override
	public boolean insert(int userid, List<String> roles) {
		String sql = "WITH roleID AS ( SELECT ID FROM tbrole WHERE ROLE = ?)"
				+" insert into tbuser_role"
				+" SELECT ID, ? FROM roleID";
		try(Connection con = dataSource.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);) {		
			for(String role : roles){
				ps.setString(1, role);
				ps.setInt(2, userid);
				if (ps.executeUpdate() == 0){					
					return false;
				}
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

/*	@Override
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
*/
	@Override
	public List<String> list(int usrId) {
		String sql = "SELECT ROLE FROM	v_get_user_roles WHERE	ID = ?";
		try (Connection cnn = dataSource.getConnection();
			PreparedStatement ps = cnn.prepareStatement(sql);){			
			ps.setInt(1, usrId);
			ResultSet rs = ps.executeQuery();
			System.out.println(ps);
			List<String> arr = new ArrayList<String>();
			while(rs.next()){				
				arr.add(rs.getString("role"));
			}
			return arr;
		} catch (SQLException e) {
		e.printStackTrace();
		}
		return null;
	}
	
}
