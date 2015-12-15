package com.ams.app.services;

import java.util.List;

import com.ams.app.entities.Role;

public interface UserRoleService {
	public boolean insertUserRole(int roleid, int userid);
	public boolean updateUserRole(int roleid, int userid);
	public List<Role> getUserRoles(int usrId);
}
