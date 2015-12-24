package com.ams.app.services;

import java.util.List;

public interface UserRoleService {
	public boolean insert(int userid, List<String> role);
	//public boolean updateUserRole(int roleid, int userid);
	public List<String> list(int usrId);
}
