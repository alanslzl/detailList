package com.detailList.service;

import java.util.List;

import com.detailList.entity.Metting;

public interface MettingTypeService {
	/**
	 * 查询工作标签
	 * @param mettingType
	 * @return
	 */
	public List<Metting> queryMetting(Metting mettingType);
	/**
	 * 新增
	 * @param mettingType
	 */
	public void insertMetting(Metting mettingType);
	/**
	 * 修改
	 * @param mettingType
	 */
	public void editMetting(Metting mettingType);
	/**
	 * 删除
	 * @param id
	 */
	public void delMetting(String id);
}
