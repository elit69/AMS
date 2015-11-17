package com.ams.app.services;

import java.util.ArrayList;

import com.ams.app.entities.UserDto;

public interface UserService {
	public ArrayList<UserDto> list();
	public boolean add(UserDto usr);
	public boolean update(UserDto usr);
	public boolean delete(int usrId);
	public UserDto show(int usrId);
	public UserDto show(String usrName);
	public ArrayList<UserDto> search(String keyword, String type);
}
