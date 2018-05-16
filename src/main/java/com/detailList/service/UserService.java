package com.detailList.service;

import com.detailList.entity.User;
import com.detailList.entity.Zhr2001;

public interface UserService {
	public User login(User user);
	
	public Zhr2001 selectByPrimaryKey(Integer id);
	
	public Zhr2001 selectPersonInfoByDomainId(String domainId);
}
