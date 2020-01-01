package com.jared.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jared.mapper.UserMapper;
import com.jared.pojo.User;
import com.jared.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;

	/**
	 * 	登录功能
	 * 	@param u_username - 用户名
	 * */
	public User login(String u_username) {
		return userMapper.login(u_username);
	}

	/**
	 * 	查询username是否已被注册
	 * 	@param u_username - 要注册的用户名
	 * */
	public User checkName(String u_username) {
		
		return userMapper.checkName(u_username);
	}
	/**
	 * 	根据注册数据插入一条用户数据
	 * */
	public void insert(User user) {
		userMapper.insert(user);
	}
	/**
	 * 	查询所有用户数据
	 * */
	public ArrayList<User> findByPage() {
		
		return userMapper.findByPage();
	}

	/**
	 * 	根据ID查询用户数据
	 * 	@param u_id - 用户id
	 * */
	public User toViewUserById(int u_id) {
		
		return userMapper.toViewUserById(u_id);
	}

	@Override
	public void update(User user) {
	}
	/**
	 * 	修改头像路径
	 * 	@param id - u_id用户id
	 * 	@param u_img - 图片路径
	 * */
	public void updateImg(int id, String u_img) {
		userMapper.updateImg(id,u_img);
	}

	/**
	 * 	根据id修改User信息
	 * 	@param user - 用户pojo
	 * */
	public void updateUser(User user) {
		userMapper.updateUser(user);
	}

	/**
	 * 	根据Id删除User
	 * 	@param id - 用户 Id
	 * */
	public void remove(int u_id) {
		userMapper.remove(u_id);
	}

	/**
	 * 	设置用户状态
	 * 	@param u_id	用户Id
	 * 	@param u_status 状态标识
	 * */
	public void setStatus(int u_id, int u_status) {
		userMapper.setStatus(u_id,u_status);
	}

	/**
	 * 	设置用户角色
	 * 	@param u_id 用户Id
	 * 	@param u_role 用户角色
	 * */
	public void setRole(int u_id, int u_role) {
		userMapper.setRole(u_id,u_role);
	}
	
	
}
