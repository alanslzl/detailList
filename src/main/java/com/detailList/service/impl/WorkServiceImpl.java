package com.detailList.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.detailList.dao.DetailWorkMapper;
import com.detailList.dao.WorkExportTemplateMapper;
import com.detailList.dao.WorkLabelMapper;
import com.detailList.dao.WorkLabelRelationMapper;
import com.detailList.dao.WorkMapper;
import com.detailList.dao.WorkNodeMapper;
import com.detailList.dao.WorkTalkRecordMapper;
import com.detailList.dao.WorkTypeMapper;
import com.detailList.dao.WorkTypeRelationMapper;
import com.detailList.dto.DetailListDto;
import com.detailList.dto.DetailListTypeDto;
import com.detailList.entity.DetailWork;
import com.detailList.entity.Work;
import com.detailList.entity.WorkType;
import com.detailList.entity.WorkTypeRelation;
import com.detailList.service.WorkService;

@Service
public class WorkServiceImpl implements WorkService{
	@Autowired
	private WorkMapper workMapper;
	
	@Autowired
	private WorkTypeMapper workTypeMapper;
	
	@Autowired
	private DetailWorkMapper detailWorkMapper;
	
	@Autowired
	private WorkNodeMapper workNodeMapper;
	
	@Autowired
	private WorkLabelMapper workLabelMapper;
	
	@Autowired
	private WorkLabelRelationMapper workLabelRelationMapper;
	
	@Autowired
	private WorkTalkRecordMapper workTalkRecordMapper;
	
	@Autowired
	private WorkTypeRelationMapper workTypeRelationMapper;
	
	@Autowired
	private WorkExportTemplateMapper workExportTemplateMapper;

	public DetailListDto selectWorkType(String detailListId){
		List<DetailListTypeDto> dtolist = new ArrayList<DetailListTypeDto>();
		List<WorkType> typeList = workTypeMapper.selectWorkType(detailListId);
		for (WorkType workType : typeList) {
			DetailListTypeDto dto = new DetailListTypeDto();
			dto.setWorkTypeId(workType.getId());
			dto.setWorkTypeName(workType.getWorkTypeName());
			List<Work> workList = workMapper.selectWorkByWorkTypeId(workType.getId());
			dto.setList(workList);
			dtolist.add(dto);
		}
		List<Work> workList = workMapper.selectNoTypeWork(detailListId);
		DetailListDto dto = new DetailListDto();
		dto.setTypeWorkListDto(dtolist);
		dto.setNoTypeWorkList(workList);
		return dto;
	}
	public List<Work> selectWork(String userId){
		return workMapper.selectWork(userId);
	}
	public WorkType insertWorkType(WorkType workType) {
		workTypeMapper.insertSelective(workType);
		return workType;
	}
	public void insertWorkTypeRelation(WorkTypeRelation wtr) {
		workTypeRelationMapper.insertSelective(wtr);
	}
	public void insertDetailWork(DetailWork work) {
		detailWorkMapper.insertSelective(work);
	}
	public void deleteWorkType(String workTypeId) {
		workTypeMapper.deleteByPrimaryKey(workTypeId);
	}
	public void deleteWorkTypeByDetailListId(String detailListId) {
		workTypeMapper.deleteByDetailListId(detailListId);;
	}
	public void deleteWorkTypeRelationByDeatailListId(String detailListId) {
		workTypeRelationMapper.deleteWorkTypeRelationByDeatailListId(detailListId);
	}
	public void deleteDetailWorkByDetailListId(String detailListId) {
		detailWorkMapper.deleteDetailWorkByDetailListId(detailListId);
	}
}
