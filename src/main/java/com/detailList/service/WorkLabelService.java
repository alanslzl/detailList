package com.detailList.service;

import java.util.List;

import com.detailList.entity.WorkLabel;

public interface WorkLabelService {
	/**
	 * 查询工作标签
	 * @param label
	 * @return
	 */
	public List<WorkLabel> queryWorkLabel(WorkLabel label);
	/**
	 * 新增
	 * @param label
	 */
	public void insertWorkLabel(WorkLabel label);
	/**
	 * 修改
	 * @param label
	 */
	public void editWorkLabel(WorkLabel label);
	/**
	 * 删除
	 * @param id
	 */
	public void delWorkLabel(String id);
	/**
	 * 根据id查询工作标签
	 */
	public WorkLabel queryWorkLabelById(String id);
}
