package com.detailList.service;

import java.util.List;

import com.detailList.dto.DetailListDto;
import com.detailList.entity.DetailWork;
import com.detailList.entity.Work;
import com.detailList.entity.WorkLabel;
import com.detailList.entity.WorkNode;
import com.detailList.entity.WorkType;
import com.detailList.entity.WorkTypeRelation;

public interface WorkService {
	/**
	 * 传入清单id 获取清单下所有工作类别和工作
	 * @param detailListId
	 * @return
	 */
	public DetailListDto selectWorkType(String detailListId,Work work);
	
	/**
	 * 获取用户的所有工作
	 * @param userId
	 * @return
	 */
	public List<Work> selectWork(String userId);
	/**
	 * 新增工作类别
	 * @param workType
	 * @return
	 */
	public WorkType insertWorkType(WorkType workType);
	/**
	 * 新增 工作类别与工作关系
	 * @param wtr
	 */
	public void insertWorkTypeRelation(WorkTypeRelation wtr);
	/**
	 * 新增无类别工作
	 * @param work
	 */
	public void insertDetailWork(DetailWork work);
	/**
	 * 删除工作类别
	 * @param workTypeId
	 */
	public void deleteWorkType(String workTypeId);
	
	/**
	 * 删除传入清单id 的所有工作类别
	 * @param detailListId
	 */
	public void deleteWorkTypeByDetailListId(String detailListId);
	/**
	 * 删除传入清单id的所有工作类别关系
	 * @param detailListId
	 */
	public void deleteWorkTypeRelationByDeatailListId(String detailListId);
	/**
	 * 删除无类别清单工作
	 * @param detailListId
	 */
	public void deleteDetailWorkByDetailListId(String detailListId);
	/**
	 * 新增工作
	 * @param work
	 */
	public Work insertEasyWork(Work work);
	/**
	 * 简单查看工作内容
	 * @param workId
	 * @return
	 */
	public Work queryEasyWork(String workId);
	/**
	 * 新增工作
	 * @param work
	 */
	public void insertWork(Work work);
	
	public void insertWorkPersonRelation(Work work);
	
	public void insertNode(WorkNode record);
}
