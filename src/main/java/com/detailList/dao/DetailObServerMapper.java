package com.detailList.dao;

import com.detailList.entity.DetailObServer;

public interface DetailObServerMapper {
    int deleteByPrimaryKey(String id);

    int insert(DetailObServer record);

    int insertSelective(DetailObServer record);

    DetailObServer selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(DetailObServer record);

    int updateByPrimaryKey(DetailObServer record);
}