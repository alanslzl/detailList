package com.detailList.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSON;
import com.detailList.dto.Result;
import com.detailList.entity.Metting;
import com.detailList.entity.User;
import com.detailList.entity.WorkLabel;
import com.detailList.entity.Zhr2001;
import com.detailList.service.WorkLabelService;
import com.detailList.utils.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import freemarker.template.utility.StringUtil;

@RestController
@RequestMapping("/workLabel")
public class WorkLabelController {
	@Autowired
	private WorkLabelService workLabelService;
	
	@RequestMapping("/query")
	public ModelAndView queryWorkLabel(HttpServletRequest request,HttpServletResponse response,Integer page,WorkLabel label) {
		ModelAndView view = new ModelAndView("/page/workLabelManager");
		try {
			if(null == page) {
				page = 1;
			}
			PageHelper.startPage(page, 10);
			List<WorkLabel> labelList = workLabelService.queryWorkLabel(label);
			PageInfo<WorkLabel> labelPage=new PageInfo<WorkLabel>(labelList);
			view.addObject("page", labelPage);
			view.addObject("label", labelList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return view;
	}
	
	@RequestMapping("/queryAll")
	public Object queryWorkLabelAll(HttpServletRequest request,HttpServletResponse response,Integer page,WorkLabel label) {
		try {
			List<WorkLabel> labelList = workLabelService.queryWorkLabel(label);
			return labelList;
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	
	@RequestMapping("/add")
	public String insertWorkLabel(HttpServletRequest request,HttpServletResponse response,WorkLabel label) {
		try {
			Zhr2001 userInfo = (Zhr2001)request.getSession().getAttribute("userInfo");
			label.setId(StringUtils.genUUid());
			label.setInsertUser(userInfo.getPernr());
			workLabelService.insertWorkLabel(label);
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	@RequestMapping("/edit")
	public String updateWorkLabel(HttpServletRequest request,HttpServletResponse response,WorkLabel label) {
		try {
			workLabelService.editWorkLabel(label);
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	@RequestMapping("/del")
	public String deleteWorkLabel(HttpServletRequest request,HttpServletResponse response,String id) {
		try {
			workLabelService.delWorkLabel(id);
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	@RequestMapping("/queryById")
	@ResponseBody
	public Object queryWorkLabelById(HttpServletRequest request,HttpServletResponse response,String id) {
		try {
			return workLabelService.queryWorkLabelById(id);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
}
