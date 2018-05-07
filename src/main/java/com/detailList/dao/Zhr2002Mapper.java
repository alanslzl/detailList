package com.detailList.dao;

import java.util.List;

import com.detailList.entity.Zhr2002;

public interface Zhr2002Mapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Zhr2002 record);

    int insertSelective(Zhr2002 record);

    Zhr2002 selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Zhr2002 record);

    int updateByPrimaryKey(Zhr2002 record);
    
    List<Zhr2002> selectOrg(Zhr2002 record);
}