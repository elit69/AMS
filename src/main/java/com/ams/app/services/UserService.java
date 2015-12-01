package com.ams.app.services;

import java.util.ArrayList;

import com.ams.app.entities.User;

public interface UserService {
	
	public ArrayList<User> list(int limitrow, int page);
	public boolean insertUser(User user);
	public boolean updateUser(User user);
	public User getUser(int id);
	public ArrayList<User> getPagination(int page,int limit);
	public int getTotalPage(int limit);
	public boolean toggle(int artId);	//toggle between enable/disable an article		
	public User showUser(String usrName);
	public ArrayList<User> search(String columnName, String keyword, int limitrow, int page);
	public int getLastID();
}
