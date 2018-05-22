package com.detailList.service;

import java.util.List;

import com.detailList.entity.WorkExportTemplate;

public interface TemplateService {
	
	public List<WorkExportTemplate> selectByName(String templateName);
	
	public int updateByPrimaryKeySelective(WorkExportTemplate record);
	
	public int deleteByPrimaryKey(String id);
	
	public int insertSelective(WorkExportTemplate record);
	
	public WorkExportTemplate selectByPrimaryKey(String id);
}
