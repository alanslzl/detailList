package com.detailList.dao;

import com.detailList.entity.WorkTalkRecord;

public interface WorkTalkRecordMapper {
    int deleteByPrimaryKey(String id);

    int insert(WorkTalkRecord record);

    int insertSelective(WorkTalkRecord record);

    WorkTalkRecord selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(WorkTalkRecord record);

    int updateByPrimaryKey(WorkTalkRecord record);
}