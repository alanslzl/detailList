package com.detailList.dao;

import com.detailList.entity.Metting;

public interface MettingMapper {
    int deleteByPrimaryKey(String id);

    int insert(Metting record);

    int insertSelective(Metting record);

    Metting selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Metting record);

    int updateByPrimaryKey(Metting record);
}