package com.detailList.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.detailList.dao.Zhr2001Mapper;
import com.detailList.entity.Zhr2001;
import com.detailList.service.PersonInfoService;

@Service
public class PersonInfoServiceImpl implements PersonInfoService{
	
	@Autowired
	private Zhr2001Mapper zhr2001Mapper;
	
	public List<Zhr2001> selectPersonInfo(String personInfo){
		return zhr2001Mapper.selectPersonInfo(personInfo);
	}
}
