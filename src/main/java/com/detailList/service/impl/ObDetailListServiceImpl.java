package com.detailList.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.detailList.dao.DetailListMapper;
import com.detailList.dao.DetailObServerMapper;
import com.detailList.entity.DetailList;
import com.detailList.entity.DetailObServer;
import com.detailList.service.ObDetailListService;

@Service
public class ObDetailListServiceImpl implements ObDetailListService{
	
	@Autowired
	private DetailObServerMapper detailObServerMapper;
	@Autowired
	private DetailListMapper detailListMapper;
	
	public List<Map<String, Object>> selectObUser(String userId,String obUserId,String detailListId){
		DetailObServer o = new DetailObServer();
		o.setUserId(userId);
		o.setObUserId(obUserId);
		o.setDetailListId(detailListId);
		return detailObServerMapper.selectObUser(o);
	}
	public List<DetailList> selectObDetailListByUserId(String userId){
		return detailListMapper.selectObDetailListByUserId(userId);
	}
	public void insertSelective(DetailObServer record) {
		detailObServerMapper.insertSelective(record);
	}
	public void deleteByDetailListId(String detailListId) {
		detailObServerMapper.deleteByDetailListId(detailListId);
	}
}
