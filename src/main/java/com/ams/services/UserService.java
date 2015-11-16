package com.ams.services;

import java.util.ArrayList;

import com.ams.entities.User;

public interface UserService {
	public ArrayList<User> list();
	public boolean add(User usr);
	public boolean update(User usr);
	public boolean delete(int usrId);
	public User show(int usrId);
	public User show(String usrName);
	public ArrayList<User> search(String keyword, String type);
}
