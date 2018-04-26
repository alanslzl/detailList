package com.detailList.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.detailList.dto.DetailListDto;
import com.detailList.dto.DetailListManagerDto;
import com.detailList.dto.Result;
import com.detailList.dto.WorkTypeDto;
import com.detailList.entity.DetailList;
import com.detailList.entity.DetailWork;
import com.detailList.entity.User;
import com.detailList.entity.WorkType;
import com.detailList.entity.WorkTypeRelation;
import com.detailList.service.DetailListService;
import com.detailList.service.WorkService;
import com.detailList.utils.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RestController
@RequestMapping("/detailList")
public class DetailListController{
	
	@Autowired
	private DetailListService detailListService;
	
	@Autowired
	private WorkService workService;
	
	@RequestMapping("/editDetailList")
	public ModelAndView editDetailList(HttpServletRequest request,HttpServletResponse response,String detailListId) {
		ModelAndView view = new ModelAndView("page/editDetailList");
		try {
			DetailList ndl = detailListService.selectDetailListById(detailListId);
			view.addObject("detailListId", detailListId);
			view.addObject("detailListName", ndl.getDetailListName());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return view;
	}
	@RequestMapping("/queryDetailListManager")
	public ModelAndView queryDetailListManager(HttpServletRequest request,HttpServletResponse response,DetailList detailList,Integer page) {
		ModelAndView view = new ModelAndView("page/detailListManager");
		try {
			if(null == page) {
				page = 1;
			}
			List<DetailListManagerDto> dtoList = new ArrayList<>();
			User user = (User)request.getSession().getAttribute("user");
			detailList.setDetailListPerson(user.getId());
			PageHelper.startPage(page, 3);
			List<DetailList> queryList = detailListService.selectDetailList(detailList);
			for (DetailList dl : queryList) {
				DetailListDto wtList = workService.selectWorkType(dl.getId());
				DetailListManagerDto dto = new DetailListManagerDto();
				dto.setDetailList(dl);
				dto.setDetailListDto(wtList);
				dtoList.add(dto);
			}
			PageInfo<DetailList> labelPage=new PageInfo<DetailList>(queryList);
			view.addObject("labelPage", labelPage);
			view.addObject("labelData", dtoList);
			PageHelper.startPage(page, 6);
			queryList = detailListService.selectDetailList(detailList);
			PageInfo<DetailList> tablePage=new PageInfo<DetailList>(queryList);
			view.addObject("tablePage", tablePage);
			view.addObject("tableData", queryList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return view;
	}
	
	/**
	 * 工作台查询清单列表
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/queryUserDetailList")
	@ResponseBody
	public Object queryDetailList(HttpServletRequest request,HttpServletResponse response,DetailList detailList) {
		try {
			User user = (User)request.getSession().getAttribute("user");
			detailList.setDetailListPerson(user.getId());
			List<DetailList> queryList = detailListService.selectDetailList(detailList);
			return queryList;
		} catch (Exception e) {
			e.printStackTrace();
			return Result.error(e.getMessage());
		}
	}
	
	@RequestMapping("/editUserDetailList")
	@ResponseBody
	public Object editDetailList(HttpServletRequest request,HttpServletResponse response,
		@Param("detailListId")String detailListId,
			@Param("detailListName")String detailListName,
				@Param("workTypeAndWork")String workTypeAndWork,
					@Param("noTypeWork")String noTypeWork) {
		try {
			//修改清单
			DetailList ndl = detailListService.selectDetailListById(detailListId);
			ndl.setDetailListName(detailListName);
			detailListService.updateByPrimaryKeySelective(ndl);
			//删除清单工作类别和工作类别关系
			workService.deleteWorkTypeByDetailListId(detailListId);
			workService.deleteWorkTypeRelationByDeatailListId(detailListId);
			workService.deleteDetailWorkByDetailListId(detailListId);
			//获取新增清单的工作类别
			List<WorkTypeDto> dtoList = JSONArray.parseArray(workTypeAndWork, WorkTypeDto.class);
			for (WorkTypeDto workTypeDto : dtoList) {
				//创建工作类别
				WorkType worktype = new WorkType();
				worktype.setId(StringUtils.genUUid());
				worktype.setDetailListId(ndl.getId());
				worktype.setWorkTypeName(workTypeDto.getWorkTypeName());
				worktype = workService.insertWorkType(worktype);
				for (String workId : workTypeDto.getWorkIds()) {
					//创建类别与工作关系
					WorkTypeRelation wtr = new WorkTypeRelation();
					wtr.setId(StringUtils.genUUid());
					wtr.setWorkId(workId);
					wtr.setWorkTypeId(worktype.getId());
					workService.insertWorkTypeRelation(wtr);
				}
			}
			//获取无工作类别的清单工作
			List<String> noTypeWorkList = JSONArray.parseArray(noTypeWork, String.class);
			for (String workId : noTypeWorkList) {
				DetailWork work = new DetailWork();
				work.setId(StringUtils.genUUid());
				work.setDetailListId(ndl.getId());
				work.setWorkId(workId);
				workService.insertDetailWork(work);;
			}
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	
	@RequestMapping("/addUserDetailList")
	@ResponseBody
	public Object addDetailList(HttpServletRequest request,HttpServletResponse response,
			@Param("detailListName")String detailListName,
				@Param("workTypeAndWork")String workTypeAndWork,
					@Param("noTypeWork")String noTypeWork) {
		try {
			//取得用户
			User user = (User)request.getSession().getAttribute("user");
			//创建清单
			DetailList ndl = new DetailList();
			ndl.setId(StringUtils.genUUid());
			ndl.setDetailListName(detailListName);
			ndl.setDetailListPerson(user.getId());
			ndl.setCreateTime(new Date());
			ndl = detailListService.insertDetailList(ndl);
			//获取新增清单的工作类别
			List<WorkTypeDto> dtoList = JSONArray.parseArray(workTypeAndWork, WorkTypeDto.class);
			for (WorkTypeDto workTypeDto : dtoList) {
				//创建工作类别
				WorkType worktype = new WorkType();
				worktype.setId(StringUtils.genUUid());
				worktype.setDetailListId(ndl.getId());
				worktype.setWorkTypeName(workTypeDto.getWorkTypeName());
				worktype = workService.insertWorkType(worktype);
				for (String workId : workTypeDto.getWorkIds()) {
					//创建类别与工作关系
					WorkTypeRelation wtr = new WorkTypeRelation();
					wtr.setId(StringUtils.genUUid());
					wtr.setWorkId(workId);
					wtr.setWorkTypeId(worktype.getId());
					workService.insertWorkTypeRelation(wtr);
				}
			}
			//获取无工作类别的清单工作
			List<String> noTypeWorkList = JSONArray.parseArray(noTypeWork, String.class);
			for (String workId : noTypeWorkList) {
				DetailWork work = new DetailWork();
				work.setId(StringUtils.genUUid());
				work.setDetailListId(ndl.getId());
				work.setWorkId(workId);
				workService.insertDetailWork(work);;
			}
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
}
