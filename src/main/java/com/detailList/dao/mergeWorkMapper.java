package com.detailList.dao;

import com.detailList.entity.mergeWork;

public interface mergeWorkMapper {
    int deleteByPrimaryKey(String id);

    int insert(mergeWork record);

    int insertSelective(mergeWork record);

    mergeWork selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(mergeWork record);

    int updateByPrimaryKey(mergeWork record);
}