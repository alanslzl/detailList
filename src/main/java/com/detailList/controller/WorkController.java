package com.detailList.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
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
import com.detailList.entity.User;
import com.detailList.entity.Work;
import com.detailList.entity.WorkNode;
import com.detailList.entity.WorkTypeRelation;
import com.detailList.entity.Zhr2001;
import com.detailList.service.WorkService;
import com.detailList.utils.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


@RestController
@RequestMapping("/work")
public class WorkController{
	
	@Autowired
	private WorkService workService;
	
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
			User user = (User)request.getSession().getAttribute("user");
			List<Work> workList = workService.selectWork(user.getId());
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
	public ModelAndView workManager(HttpServletRequest request,HttpServletResponse response,Work work,Integer labelPage,Integer tablePage) {
		ModelAndView view = new ModelAndView("page/workManager");
		try {
			if(null == labelPage) {
				labelPage = 1;
			}
			if(null == tablePage) {
				tablePage = 1;
			}
			User user = (User)request.getSession().getAttribute("user");
			PageHelper.startPage(labelPage, 8);
			List<Work> workList = workService.selectWork(user.getId());
			PageInfo<Work> labelPageInfo=new PageInfo<Work>(workList);
			view.addObject("labelPage", labelPageInfo);
			view.addObject("labelList", workList);
			PageHelper.startPage(tablePage, 8);
			workList = workService.selectWork(user.getId());
			PageInfo<Work> tablePageInfo=new PageInfo<Work>(workList);
			view.addObject("tablePage", tablePageInfo);
			view.addObject("tableList", workList);
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSON.toJSONString(Result.success());
	}
}
