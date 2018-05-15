package com.detailList.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.detailList.dao.DetailWorkMapper;
import com.detailList.dao.WorkExportTemplateMapper;
import com.detailList.dao.WorkLabelMapper;
import com.detailList.dao.WorkMapper;
import com.detailList.dao.WorkNodeMapper;
import com.detailList.dao.WorkTalkRecordMapper;
import com.detailList.dao.WorkTypeMapper;
import com.detailList.dao.WorkTypeRelationMapper;
import com.detailList.dao.mergeWorkMapper;
import com.detailList.dao.workEnclosureMapper;
import com.detailList.dao.workPersonMapper;
import com.detailList.dto.DetailListDto;
import com.detailList.dto.DetailListTypeDto;
import com.detailList.entity.DetailWork;
import com.detailList.entity.Work;
import com.detailList.entity.WorkLabel;
import com.detailList.entity.WorkNode;
import com.detailList.entity.WorkType;
import com.detailList.entity.WorkTypeRelation;
import com.detailList.entity.mergeWork;
import com.detailList.entity.workEnclosure;
import com.detailList.entity.workPerson;
import com.detailList.service.WorkService;
import com.detailList.utils.StringUtils;

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
	private WorkTalkRecordMapper workTalkRecordMapper;
	
	@Autowired
	private WorkTypeRelationMapper workTypeRelationMapper;
	
	@Autowired
	private WorkExportTemplateMapper workExportTemplateMapper;
	
	@Autowired
	private workPersonMapper workPersonMapper;
	
	@Autowired
	private workEnclosureMapper workEnclosureMapper;
	
	@Autowired
	private mergeWorkMapper mergeWorkMapper;
	

	public DetailListDto selectWorkType(String detailListId,Work work){
		List<DetailListTypeDto> dtolist = new ArrayList<DetailListTypeDto>();
		List<WorkType> typeList = workTypeMapper.selectWorkType(detailListId);
		for (WorkType workType : typeList) {
			DetailListTypeDto dto = new DetailListTypeDto();
			dto.setWorkTypeId(workType.getId());
			dto.setWorkTypeName(workType.getWorkTypeName());
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("workTypeId", workType.getId());
			paramMap.put("queryWork", work);
			List<Work> workList = workMapper.selectWorkByWorkTypeId(paramMap);
			dto.setList(workList);
			dtolist.add(dto);
		}
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("detailListId", detailListId);
		paramMap.put("queryWork", work);
		List<Work> workList = workMapper.selectNoTypeWork(paramMap);
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
	public Work insertEasyWork(Work work) {
		insertWorkPersonRelation(work);
		workMapper.insertSelective(work);
		return work;
	}
	public void insertWorkPersonRelation(Work work) {
		//督办人
		String[] supervisorArr = work.getSupervisor().split(",");
		for (String supervisor : supervisorArr) {
			workPerson p = new workPerson();
			p.setId(StringUtils.genUUid());
			p.setType("1");
			p.setUserId(supervisor);
			p.setWorkId(work.getId());
			workPersonMapper.insertSelective(p);
		}
		//责任人
		String [] liablePersonArr =  work.getLiablePerson().split(",");
		for (String liablePerson : liablePersonArr) {
			workPerson p = new workPerson();
			p.setId(StringUtils.genUUid());
			p.setType("0");
			p.setUserId(liablePerson);
			p.setWorkId(work.getId());
			workPersonMapper.insertSelective(p);
		}
	}
	public Work queryEasyWork(String workId) {
		return workMapper.selectByWorkId(workId);
	}
	public void insertWork(Work work) {
		workMapper.insertSelective(work);
	}
	public void insertNode(WorkNode record) {
		workNodeMapper.insertSelective(record);
	}
	public void addMergeWork(mergeWork record) {
		mergeWorkMapper.insertSelective(record);
	}
	public void addWorkEnclosure(workEnclosure e) {
		workEnclosureMapper.insertSelective(e);
	}
}
