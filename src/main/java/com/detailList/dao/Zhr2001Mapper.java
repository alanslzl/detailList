package com.detailList.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.detailList.entity.Zhr2001;

public interface Zhr2001Mapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Zhr2001 record);

    int insertSelective(Zhr2001 record);

    Zhr2001 selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Zhr2001 record);

    int updateByPrimaryKey(Zhr2001 record);
    
    List<Zhr2001> selectPersonInfo(@Param("personInfo")String personInfo);
    
    Zhr2001 selectPersonInfoByDomainId(String domainId);
}