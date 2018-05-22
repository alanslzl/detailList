package com.detailList.dao;

import java.util.List;

import com.detailList.entity.WorkExportTemplate;

public interface WorkExportTemplateMapper {
    int deleteByPrimaryKey(String id);

    int insert(WorkExportTemplate record);

    int insertSelective(WorkExportTemplate record);

    WorkExportTemplate selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(WorkExportTemplate record);

    int updateByPrimaryKey(WorkExportTemplate record);
    
    List<WorkExportTemplate> selectByName(String templateName);
}