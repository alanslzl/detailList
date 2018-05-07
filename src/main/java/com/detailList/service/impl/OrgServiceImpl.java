package com.detailList.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.detailList.dao.Zhr2002Mapper;
import com.detailList.entity.Zhr2002;
import com.detailList.service.OrgService;

@Service
public class OrgServiceImpl implements OrgService{
	@Autowired
	private Zhr2002Mapper zhr2002Mapper;
	
	public List<Zhr2002> selectOrg(Zhr2002 record){
		return zhr2002Mapper.selectOrg(record);
	}
}
