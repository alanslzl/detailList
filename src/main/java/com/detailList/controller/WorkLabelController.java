package com.detailList.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSON;
import com.detailList.dto.Result;
import com.detailList.entity.WorkLabel;
import com.detailList.service.WorkLabelService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RestController
@RequestMapping("/workLabel")
public class WorkLabelController {
	@Autowired
	private WorkLabelService workLabelService;
	
	@RequestMapping("/query")
	public ModelAndView queryMettingType(HttpServletRequest request,HttpServletResponse response,Integer page,WorkLabel label) {
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
	@RequestMapping("/add")
	public String insertMettingType(HttpServletRequest request,HttpServletResponse response,WorkLabel label) {
		try {
			workLabelService.insertWorkLabel(label);
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	@RequestMapping("/edit")
	public String updateMettingType(HttpServletRequest request,HttpServletResponse response,WorkLabel label) {
		try {
			workLabelService.editWorkLabel(label);
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	@RequestMapping("/del")
	public String deleteMettingType(HttpServletRequest request,HttpServletResponse response,String id) {
		try {
			workLabelService.delWorkLabel(id);
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
}
