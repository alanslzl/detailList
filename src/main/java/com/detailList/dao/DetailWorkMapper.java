package com.detailList.dao;

import com.detailList.entity.DetailWork;

public interface DetailWorkMapper {
    int deleteByPrimaryKey(String id);

    int insert(DetailWork record);

    int insertSelective(DetailWork record);

    DetailWork selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(DetailWork record);

    int updateByPrimaryKey(DetailWork record);
    
    void deleteDetailWorkByDetailListId(String detailListId);
}