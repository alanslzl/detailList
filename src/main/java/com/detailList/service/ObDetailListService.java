package com.detailList.service;

import java.util.List;
import java.util.Map;

import com.detailList.entity.DetailList;
import com.detailList.entity.DetailObServer;

public interface ObDetailListService {
	public List<Map<String, Object>> selectObUser(String userId,String obUserId,String detailListId);
	
	public List<DetailList> selectObDetailListByUserId(String userId);
	
	public void insertSelective(DetailObServer record);
	
	public void deleteByDetailListId(String detailListId);
	
}
