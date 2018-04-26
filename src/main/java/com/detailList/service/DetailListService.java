package com.detailList.service;

import java.util.List;

import com.detailList.entity.DetailList;
/**
 * 清单service
 * @author luozl
 *
 */
public interface DetailListService {
	public List<DetailList> selectDetailList(DetailList detailList);
	
	public DetailList insertDetailList(DetailList detailList);
	
	public DetailList selectDetailListById(String id);
	
	public int updateByPrimaryKeySelective(DetailList record);
}
