package com.ams.app.services;

import java.util.ArrayList;

import com.ams.app.entities.User;

public interface UserService {
	
	public ArrayList<User> list(int limitrow, int page);
	public boolean insert(User user);
	public boolean update(User user);
	public User show(int id);
	public User show(String usrName);
	public boolean toggle(int artId);	
	public ArrayList<User> search(String columnName, String keyword, int limitrow, int page);	
}
