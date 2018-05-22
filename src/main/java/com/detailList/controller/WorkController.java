package com.detailList.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.detailList.dto.DetailListDto;
import com.detailList.dto.EasyWorkDto;
import com.detailList.dto.Result;
import com.detailList.entity.DetailList;
import com.detailList.entity.DetailWork;
import com.detailList.entity.Work;
import com.detailList.entity.WorkMsg;
import com.detailList.entity.WorkNode;
import com.detailList.entity.WorkTypeRelation;
import com.detailList.entity.Zhr2001;
import com.detailList.entity.mergeWork;
import com.detailList.entity.workEnclosure;
import com.detailList.service.WorkService;
import com.detailList.utils.DateUtils;
import com.detailList.utils.FileUtils;
import com.detailList.utils.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


@RestController
@RequestMapping("/work")
public class WorkController{
	
	@Autowired
	private WorkService workService;
	
	

	@RequestMapping("/toAddWork")
	public ModelAndView descDetailList(HttpServletRequest request,HttpServletResponse response,String detailListId) {
		ModelAndView view = new ModelAndView("page/addWork");
		return view;
	}
	
	/**
	 * 查询工作列表
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/queryWork")
	@ResponseBody
	public Object queryWork(HttpServletRequest request,HttpServletResponse response,Work work) {
		try {
			Zhr2001 user = (Zhr2001)request.getSession().getAttribute("userInfo");
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("userId",user.getPernr());
			paramMap.put("queryWork", work);
			List<Work> workList = workService.selectWork(paramMap);
			return workList;
		} catch (Exception e) {
			e.printStackTrace();
			return Result.error(e.getMessage());
		}
	}
	@RequestMapping("/queryEasyWork")
	@ResponseBody
	public Object easyWork(HttpServletRequest request,HttpServletResponse response,String workId) {
		Work work = workService.queryEasyWork(workId);
		return work;
	}
	
	@RequestMapping("/queryDetailListWork")
	@ResponseBody
	public Object queryDetailListWork(HttpServletRequest request,HttpServletResponse response,@Param("detailList")DetailList detailList,String queryWork) {
		try {
			Work work = null;
			if(queryWork!=null) {
				JSONObject obj = JSON.parseObject(queryWork);
				work = obj.parseObject(queryWork, Work.class);
			}
			DetailListDto dto = workService.selectWorkType(detailList.getId(),work);
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return Result.error(e.getMessage());
		}
	}
	/**
	 * 查询工作列表
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/queryWorkManager")
	public ModelAndView workManager(HttpServletRequest request,HttpServletResponse response,Work work,Integer page,String type) {
		ModelAndView view = new ModelAndView("page/workManager");
		try {
			if(null == page) {
				page = 1;
			}
			if(null == type || org.apache.commons.lang.StringUtils.isEmpty(type)){
				type = "label";
			}
			Zhr2001 user = (Zhr2001)request.getSession().getAttribute("userInfo");
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("userId",user.getPernr());
			paramMap.put("queryWork", work);
			PageHelper.startPage(page, 8);
			List<Work> workList = workService.selectWork(paramMap);
			PageInfo<Work> labelPageInfo=new PageInfo<Work>(workList);
			view.addObject("labelPage", labelPageInfo);
			view.addObject("labelList", workList);
			PageHelper.startPage(page, 8);
			workList = workService.selectWork(paramMap);
			PageInfo<Work> tablePageInfo=new PageInfo<Work>(workList);
			view.addObject("tablePage", tablePageInfo);
			view.addObject("tableList", workList);
			view.addObject("queryWork", work);
			view.addObject("type", type);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return view;
	}
	
	
	/**
	 * 简单版新增工作
	 * @param request
	 * @param response
	 * @param dto
	 * @return
	 */
	@RequestMapping("/addEasyWork")
	@ResponseBody
	public String addEasyWork(HttpServletRequest request,HttpServletResponse response,@ModelAttribute EasyWorkDto dto) {
		Zhr2001 userInfo = (Zhr2001)request.getSession().getAttribute("userInfo");
		Work work = new Work();
		work.setId(StringUtils.genUUid());
		work.setWorkName(dto.getWorkName());
		work.setLiablePerson(dto.getLiablePerson());
		work.setSupervisor(dto.getSupervisor());
		work.setSupervisorStrategy(dto.getSupervisorStrategy());
		work.setWorkCompany(userInfo.getOrgeh());
		work.setInputCompany(userInfo.getOrgeh());
		work.setWorkStatus("0");
		work = workService.insertEasyWork(work);
		if(dto.getWorkType().equals("notype")){
			DetailWork dw = new DetailWork();
			dw.setId(StringUtils.genUUid());
			dw.setWorkId(work.getId());
			dw.setDetailListId(dto.getDetailListId());
			workService.insertDetailWork(dw);
		}else{
			WorkTypeRelation wtr = new WorkTypeRelation();
			wtr.setId(StringUtils.genUUid());
			wtr.setWorkId(work.getId());
			wtr.setWorkTypeId(dto.getWorkType());
			workService.insertWorkTypeRelation(wtr);
		}
		return JSON.toJSONString(Result.success());
	}
	@RequestMapping("/addWork")
	@ResponseBody
	public String addWork(HttpServletRequest request,HttpServletResponse response,String workListStr) {
		try {
			Zhr2001 userInfo = (Zhr2001)request.getSession().getAttribute("userInfo");
			List<Work> workList = JSONArray.parseArray(workListStr, Work.class);
			for (Work work : workList) {
				work.setId(StringUtils.genUUid());
				work.setWorkPublishPerson(userInfo.getPernr());
				workService.insertWork(work);
				workService.insertWorkPersonRelation(work);
				for(WorkNode node : work.getNodeList()) {
					node.setId(StringUtils.genUUid());
					node.setWorkId(work.getId());
					workService.insertNode(node);;
				}
				if(org.apache.commons.lang.StringUtils.isNotEmpty(work.getMergeId())) {
					String[] mergeIds = work.getMergeId().split(",");
					for (String mergeId : mergeIds) {
						mergeWork mer = new mergeWork();
						mer.setId(StringUtils.genUUid());
						mer.setWorkId(work.getId());
						mer.setMergeWorkId(mergeId);
						mer.setType("0");
						workService.addMergeWork(mer);
					}
				}
				if(org.apache.commons.lang.StringUtils.isNotEmpty(work.getRelationId())) {
					String[] mergeIds = work.getRelationId().split(",");
					for (String mergeId : mergeIds) {
						mergeWork mer = new mergeWork();
						mer.setId(StringUtils.genUUid());
						mer.setWorkId(work.getId());
						mer.setMergeWorkId(mergeId);
						mer.setType("1");
						workService.addMergeWork(mer);
					}
				}
				if(org.apache.commons.lang.StringUtils.isNotEmpty(work.getEnclosure())) {
					String[] enclosures = work.getEnclosure().split(",");
					for (String enclosure : enclosures) {
						workEnclosure e = new workEnclosure();
						e.setId(StringUtils.genUUid());
						e.setWorkId(work.getId());
						e.setEnclosure(enclosure);
						workService.addWorkEnclosure(e);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSON.toJSONString(Result.success());
	}
	@RequestMapping("/uploadEnclosure")
	@ResponseBody
	public String uploadFiles(HttpServletRequest request,HttpServletResponse response,@RequestParam MultipartFile[] enclosure) {
		List<String> urls = new ArrayList<>();
		for (MultipartFile multipartFile : enclosure) {
			String url = FileUtils.uploadFile(multipartFile);
			urls.add(url);
		}
		return JSONUtils.toJSONString(urls);
	}
	/**
	 * 查询工作任务详情
	 * 
	 * @throws ParseException
	 */
	@RequestMapping("/queryWorkById")
	@ResponseBody
	public ModelAndView queryWorkById(HttpServletRequest request, HttpServletResponse response, String workId)
			throws ParseException {
		ModelAndView view = new ModelAndView("page/queryWork");
		Zhr2001 user = (Zhr2001) request.getSession().getAttribute("userInfo");
		Work work = workService.qeruyWorkById(workId);
		List<WorkNode> listNode = workService.queryNodeByWorkId(workId);
		Map<String, Object> map = new HashMap<>();
		map.put("workId", workId);
		map.put("userId", user.getPernr());
		String personType = workService.queryWorkPerson(map);
		view.addObject("personType", personType);
		view.addObject(work);
		if (null != listNode) {
			view.addObject("listNode", listNode);
		}
		List<mergeWork> listMergeWork = workService.queryMergeWork(workId);
		List<workEnclosure> listEnclosuerWork = workService.queryEnclosureWork(workId);
		List<WorkMsg> listWorkMsg = workService.queryWorkMsg(workId);
		view.addObject("listMergeWork", listMergeWork);
		view.addObject("listEnclosuerWork", listEnclosuerWork);
		view.addObject("listWorkMsg", listWorkMsg);
		return view;
	}

	/**
	 * 修改工作任务
	 */
	@RequestMapping("/updateWork")
	@ResponseBody
	public String updateWork(HttpServletRequest request, HttpServletResponse response, String workListStr) {
		System.out.println(workListStr);
		JSONObject obj = JSON.parseObject(workListStr);
		Work fWork = obj.parseObject(workListStr, Work.class);
		Work aWork = workService.qeruyWorkById(fWork.getId());
		Zhr2001 userInfo = (Zhr2001) request.getSession().getAttribute("userInfo");
		// 更新work
		fWork.setWorkPublishPerson(userInfo.getPernr());
		workService.updateByPrimaryKeySelective(fWork);
		
		// 更新workNode
		for (WorkNode node : fWork.getNodeList()) {
			if (org.apache.commons.lang.StringUtils.isNotEmpty(node.getId())) {
				workService.updateWorkNode(node);
			} else {
				node.setId(StringUtils.genUUid());
				node.setWorkId(fWork.getId());
				workService.insertNode(node);
			}
		}
		// 更新责任人督办人
		workService.updateWorkPersonRelation(aWork, fWork);
		// 更新合并work
		
		if (org.apache.commons.lang.StringUtils.isNotEmpty(fWork.getMergeId())) {
			String[] mergeIds = fWork.getMergeId().split(",");
			for (String mergeId : mergeIds) {
				mergeWork mer = new mergeWork();
				mer.setId(StringUtils.genUUid());
				mer.setWorkId(fWork.getId());
				mer.setMergeWorkId(mergeId);
				workService.addMergeWork(mer);
				Map<String,Object> stateMap =new HashMap<>();
				stateMap.put("workStatus", "已合并");
				stateMap.put("workId", fWork.getId());
				workService.updateState(stateMap);
			}
		}
		// 记录发布信息
		String content = "我又重新发布了此任务!";
		Map<String, Object> msgMap = new HashMap<>();
		msgMap.put("id", StringUtils.genUUid());
		msgMap.put("msgName", userInfo.getNachn() + userInfo.getVorna());
		msgMap.put("workId", fWork.getId());
		msgMap.put("msgContent", content);
		msgMap.put("msgTime", new Date());
		workService.insertWorkMsg(msgMap);
		// 更新附件
		return JSON.toJSONString(Result.success());
	}

	/**
	 * 新增沟通记录
	 */
	@RequestMapping("/addWorkMsg")
	@ResponseBody
	public String addWorkMsg(HttpServletRequest request, HttpServletResponse response, String msgContent,
			String bgContent, String jxContent, String wcContent, String workId) {
		String content = "";
		Map<String, Object> msgMap = new HashMap<>();
		if (null != bgContent) {
			content = "变更申请:</br>" + bgContent;
			msgMap.put("workStatus", "变更申请中");
			msgMap.put("workId", workId);
			workService.updateState(msgMap);
		}
		if (null != jxContent) {
			content = "结项申请:</br>" + jxContent;
			msgMap.put("workStatus", "结项申请中");
			msgMap.put("workId", workId);
			workService.updateState(msgMap);
		}
		if (null != wcContent) {
			content = "结项通过:</br>" + wcContent;
			msgMap.put("workStatus", "已完成");
			msgMap.put("workId", workId);
			workService.updateState(msgMap);
		}
		if (null != msgContent) {
			content = msgContent;
		}

		Zhr2001 userInfo = (Zhr2001) request.getSession().getAttribute("userInfo");
		msgMap.put("id", StringUtils.genUUid());
		msgMap.put("msgName", userInfo.getNachn() + userInfo.getVorna());
		msgMap.put("workId", workId);
		msgMap.put("msgContent", content);
		msgMap.put("msgTime", new Date());
		workService.insertWorkMsg(msgMap);
		return JSON.toJSONString(Result.success());
	}
}
