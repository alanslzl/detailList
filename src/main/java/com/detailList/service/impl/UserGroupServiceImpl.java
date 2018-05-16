package com.detailList.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.detailList.dao.userGroupInsMapper;
import com.detailList.dao.userGroupMapper;
import com.detailList.entity.userGroup;
import com.detailList.service.UserGroupService;

@Service
public class UserGroupServiceImpl implements UserGroupService{
	@Autowired
	private userGroupMapper userGroupMapper;
	@Autowired
	private userGroupInsMapper userGroupInsMapper;
	
	public List<userGroup> queryUserGroup(userGroup userGroup) {
		return userGroupMapper.selectGroup(userGroup);
	}
	
	public void insertUserGroup(userGroup userGroup) {
		userGroupMapper.insertSelective(userGroup);
	}
	public void editUserGroup(userGroup userGroup) {
		userGroupMapper.updateByPrimaryKeySelective(userGroup);
	}
	public void delUserGroup(int id) {
		userGroupMapper.deleteByPrimaryKey(id);
	}
	public userGroup queryUserGroupById(int id) {
		return userGroupMapper.selectByPrimaryKey(id);
	}
}
