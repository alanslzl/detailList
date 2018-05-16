package com.detailList.dao;

import com.detailList.entity.workEnclosure;

public interface workEnclosureMapper {
    int deleteByPrimaryKey(String id);

    int insert(workEnclosure record);

    int insertSelective(workEnclosure record);

    workEnclosure selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(workEnclosure record);

    int updateByPrimaryKey(workEnclosure record);
}