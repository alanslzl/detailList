package com.detailList.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.detailList.dao.DetailWorkMapper;
import com.detailList.dao.WorkExportTemplateMapper;
import com.detailList.dao.WorkLabelMapper;
import com.detailList.dao.WorkMapper;
import com.detailList.dao.WorkMsgMapper;
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
import com.detailList.entity.WorkMsg;
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
	
	@Autowired
	private WorkMsgMapper msgMapper;
	

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
	public DetailListDto exportWorkType(String detailListId,Work work){
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
			for (Work typeWork : workList) {
				paramMap.put("workId", typeWork.getId());
				typeWork.setRelationWork(workMapper.selectRelationWork(paramMap));
				typeWork.setNodeList(workNodeMapper.selectByWorkId(typeWork.getId()));
			}
			dto.setList(workList);
			dtolist.add(dto);
		}
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("detailListId", detailListId);
		paramMap.put("queryWork", work);
		List<Work> workList = workMapper.selectNoTypeWork(paramMap);
		for (Work noTypeWork : workList) {
			paramMap.put("workId", noTypeWork.getId());
			noTypeWork.setRelationWork(workMapper.selectRelationWork(paramMap));
			noTypeWork.setNodeList(workNodeMapper.selectByWorkId(noTypeWork.getId()));
		}
		DetailListDto dto = new DetailListDto();
		dto.setTypeWorkListDto(dtolist);
		dto.setNoTypeWorkList(workList);
		return dto;
	}
	public List<Work> selectWork(Map<String, Object> queryMap){
		return workMapper.selectWork(queryMap);
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
	public List<WorkNode> queryNodeByWorkId(String workId) {
		return workNodeMapper.queryNodeByWorkId(workId);
	}
	public Work qeruyWorkById(String workId) {
		return workMapper.qeruyWorkById(workId);
	}
	
	public String queryWorkPerson(Map<String,Object> map) {
		return workMapper.queryWorkPerson(map);
	}
	
	public List<mergeWork> queryMergeWork(String workId){
		return  mergeWorkMapper.queryMergeWork(workId);
	}  

	public List<workEnclosure> queryEnclosureWork(String workId){
		return  workEnclosureMapper.queryEnclosureWork(workId);
	}  
	
	public void updateByPrimaryKeySelective(Work work){
		workMapper.updateByPrimaryKeySelective(work);
	}
	
	public void updateWorkPersonRelation(Work aWork,Work fWork) {
		String [] aPerson =aWork.getLiablePersonUserId().split(",");
		String [] fPerson =fWork.getLiablePerson().split(",");
		String [] aSupervisor =aWork.getSupervisorUserId().split(",");
		String [] fSupervisor =fWork.getSupervisor().split(",");
		List<String> addPList=compare(aPerson,fPerson);
		List<String> addSList=compare(aSupervisor,fSupervisor);
		List<String> delPList=compare(fPerson,aPerson);
		List<String> delSList=compare(fSupervisor,aSupervisor);
		//督办人	
		for (String supervisor : addPList) {
			workPerson p = new workPerson();
			p.setId(StringUtils.genUUid());
			p.setType("1");
			p.setUserId(supervisor);
			p.setWorkId(aWork.getId());
			workPersonMapper.insertSelective(p);
		}
		for (String supervisor : delSList) {
			Map<String,Object> delMap=new HashMap<String,Object>();
			delMap.put("workId", aWork.getId());
			delMap.put("userId", supervisor);
			workMapper.delWorkPerson(delMap);
		}
		//责任人
		for (String liablePerson : addSList) {
			workPerson p = new workPerson();
			p.setId(StringUtils.genUUid());
			p.setType("0");
			p.setUserId(liablePerson);
			p.setWorkId(aWork.getId());
			workPersonMapper.insertSelective(p);
		}
		for (String liablePerson : delSList) {
			Map delMap=new HashMap<>();
			delMap.put("workId", aWork.getId());
			delMap.put("userId", liablePerson);
			workMapper.delWorkPerson(delMap);
		}
	}
	
	public List<WorkMsg> queryWorkMsg(String workId){
		return msgMapper.queryWorkMsg(workId);
	}
	public void updateWorkNode(WorkNode workNode) {
		workNodeMapper.updateByPrimaryKeySelective(workNode);
	}
	public void insertWorkMsg(Map<String,Object> map){
		workMapper.insertWorkMsg(map);
	}
	public void updateState(Map<String,Object> map) {
		workMapper.updateState(map);
	}
	public static <T> List<T> compare(T[] t1, T[] t2) {    
	      List<T> list1 = Arrays.asList(t1);    
	      List<T> list2 = new ArrayList<T>();    
	      for (T t : t2) {    
	          if (!list1.contains(t)) {    
	              list2.add(t);    
	          }    
	      }    
	      return list2;    
	  }
}
