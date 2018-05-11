package com.detailList.dao;

import java.util.List;

import com.detailList.entity.DetailList;

public interface DetailListMapper {
    int deleteByPrimaryKey(String id);

    int insert(DetailList record);

    int insertSelective(DetailList record);

    DetailList selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(DetailList record);

    int updateByPrimaryKey(DetailList record);
    
    List<DetailList> selectDetailList(DetailList detailList);
    
    List<DetailList> selecObDetailList(DetailList detailList);
    
    List<DetailList> selectObDetailListByUserId(String userId);
}