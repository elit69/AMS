package com.ams.app.services;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.ams.app.entities.UserDto;
@Service
public interface UserService {
	public ArrayList<UserDto> getAllUser();
	public boolean insertUser(UserDto user);
	public boolean updateUser(UserDto user);
	public boolean deleteUser(int id);
	public UserDto getUser(int id);
	public ArrayList<UserDto> getPagination(int page,int limit);
	public int getTotalPage(int limit);
	
	public UserDto showUser(String usrName);
	public ArrayList<UserDto> searchUser(String keyword, String type);
}
