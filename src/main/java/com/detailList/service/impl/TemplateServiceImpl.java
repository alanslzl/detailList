package com.detailList.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.detailList.dao.WorkExportTemplateMapper;
import com.detailList.entity.WorkExportTemplate;
import com.detailList.service.TemplateService;

@Service
public class TemplateServiceImpl implements TemplateService{
	@Autowired
	private WorkExportTemplateMapper workExportTemplateMapper;
	
	public int insertSelective(WorkExportTemplate record) {
		return workExportTemplateMapper.insertSelective(record);
	}
	public int deleteByPrimaryKey(String id) {
		return workExportTemplateMapper.deleteByPrimaryKey(id);
	}
	public int updateByPrimaryKeySelective(WorkExportTemplate record){
		return workExportTemplateMapper.updateByPrimaryKey(record);
	}
	public List<WorkExportTemplate> selectByName(String templateName){
		return workExportTemplateMapper.selectByName(templateName);
	}
	public WorkExportTemplate selectByPrimaryKey(String id) {
		return workExportTemplateMapper.selectByPrimaryKey(id);
	}
}
