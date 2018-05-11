package com.detailList.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.detailList.dao.MettingMapper;
import com.detailList.entity.Metting;
import com.detailList.service.MettingTypeService;

@Service
public class MettingTypeServiceImpl implements MettingTypeService{
	@Autowired
	private MettingMapper mettingMapper;
	
	public List<Metting> queryMetting(Metting mettingType){
		return mettingMapper.selectMetting(mettingType);
	}
	public void insertMetting(Metting mettingType) {
		mettingMapper.insert(mettingType);
	}
	public void editMetting(Metting mettingType) {
		mettingMapper.updateByPrimaryKey(mettingType);
	}
	public void delMetting(String id) {
		mettingMapper.deleteByPrimaryKey(id);
	}
	public Metting queryMettingTypeById(String id) {
		return mettingMapper.selectByPrimaryKey(id);
	}
}
