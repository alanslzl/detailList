package com.detailList.service;

import java.util.List;

import com.detailList.entity.userGroup;

public interface UserGroupService {
	public List<userGroup> queryUserGroup(userGroup userGroup);
	public void insertUserGroup(userGroup userGroup);
	public void editUserGroup(userGroup userGroup);
	public void delUserGroup(int id);
	public userGroup queryUserGroupById(int id);
}
