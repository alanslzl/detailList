package com.detailList.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.detailList.dao.DetailListMapper;
import com.detailList.entity.DetailList;
import com.detailList.service.DetailListService;
/**
 * 清单实现类
 * @author luozl
 *
 */
@Service
public class DetailListServiceImpl implements DetailListService{
	@Autowired
	private DetailListMapper detailListMapper;
	
	public List<DetailList> selectDetailList(DetailList detailList){
		return detailListMapper.selectDetailList(detailList);
	}
	
	public DetailList insertDetailList(DetailList detailList) {
		detailListMapper.insertSelective(detailList);
		return detailList;
	}
	public DetailList selectDetailListById(String id) {
		return detailListMapper.selectByPrimaryKey(id);
	}
	public int updateByPrimaryKeySelective(DetailList record) {
		return detailListMapper.updateByPrimaryKeySelective(record);
	}
}
