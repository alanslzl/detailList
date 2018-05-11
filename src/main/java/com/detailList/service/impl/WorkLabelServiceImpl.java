package com.detailList.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.detailList.dao.WorkLabelMapper;
import com.detailList.entity.WorkLabel;
import com.detailList.service.WorkLabelService;

@Service
public class WorkLabelServiceImpl implements WorkLabelService{
	@Autowired
	private WorkLabelMapper workLabelMapper;
	
	public List<WorkLabel> queryWorkLabel(WorkLabel label){
		return workLabelMapper.selectWorkLabel(label);
	}
	public void insertWorkLabel(WorkLabel label) {
		workLabelMapper.insert(label);
	}
	public void editWorkLabel(WorkLabel label) {
		workLabelMapper.updateByPrimaryKey(label);
	}
	public void delWorkLabel(String id) {
		workLabelMapper.deleteByPrimaryKey(id);
	}
	@Override
	public WorkLabel queryWorkLabelById(String id) {
		return workLabelMapper.selectByPrimaryKey(id);
	}
}
