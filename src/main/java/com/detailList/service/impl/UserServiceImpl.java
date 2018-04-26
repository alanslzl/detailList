package com.detailList.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.detailList.dao.UserMapper;
import com.detailList.entity.User;
import com.detailList.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	
	public User login(User u) {
		return userMapper.selectUser(u);
	}
}
