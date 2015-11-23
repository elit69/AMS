package com.ams.app.services;

import java.util.ArrayList;
import com.ams.app.entities.UserRoleDto;

public interface UserRoleService {
	public ArrayList<UserRoleDto> getAllRoles();
	public boolean insertUserRole(UserRoleDto role);
}
