package com.detailList.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.detailList.dao.UserMapper;
import com.detailList.dao.Zhr2001Mapper;
import com.detailList.entity.User;
import com.detailList.entity.Zhr2001;
import com.detailList.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private Zhr2001Mapper zhr2001Mapper;
	
	public User login(User u) {
		return userMapper.selectUser(u);
	}
	public Zhr2001 selectByPrimaryKey(Integer id){
		return zhr2001Mapper.selectByPrimaryKey(id);
	}
}
