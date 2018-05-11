package com.detailList.dao;

import java.util.List;
import java.util.Map;

import com.detailList.entity.DetailObServer;

public interface DetailObServerMapper {
    int deleteByPrimaryKey(String id);

    int insert(DetailObServer record);

    int insertSelective(DetailObServer record);

    DetailObServer selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(DetailObServer record);

    int updateByPrimaryKey(DetailObServer record);
    
    List<Map<String, Object>> selectObUser(DetailObServer record); 
    
    void deleteByDetailListId(String detailListId);
}