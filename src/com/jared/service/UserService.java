package com.jared.service;

import java.io.File;
import java.util.ArrayList;

import com.jared.pojo.User;

public interface UserService {
	User login(String u_username);
	User checkName(String u_username);
	void insert(User user);
	ArrayList<User> findByPage();
	User toViewUserById(int id);
	void update(User user);
	void updateImg(int id, String u_img);
	void updateUser(User user);
	void remove(int u_id);
	void setStatus(int u_id, int u_status);
	void setRole(int u_id, int u_role);
}
