package com.detailList.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.detailList.dto.DetailListDto;
import com.detailList.dto.Result;
import com.detailList.entity.DetailList;
import com.detailList.entity.User;
import com.detailList.entity.Work;
import com.detailList.service.WorkService;
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
	@RequestMapping("/queryDetailListWork")
	@ResponseBody
	public Object queryDetailListWork(HttpServletRequest request,HttpServletResponse response,@Param("detailList")DetailList detailList) {
		try {
			DetailListDto dto = workService.selectWorkType(detailList.getId());
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
}
