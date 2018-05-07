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
import com.detailList.entity.Metting;
import com.detailList.service.MettingTypeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RestController
@RequestMapping("/mettingType")
public class MettingTypeController {
	@Autowired
	private MettingTypeService MettingTypeService;
	
	@RequestMapping("/query")
	public ModelAndView queryMettingType(HttpServletRequest request,HttpServletResponse response,Integer page,Metting label) {
		ModelAndView view = new ModelAndView("/page/MettingTypeManager");
		try {
			if(null == page) {
				page = 1;
			}
			PageHelper.startPage(page, 10);
			List<Metting> mettingList = MettingTypeService.queryMetting(label);
			PageInfo<Metting> mettingPage=new PageInfo<Metting>(mettingList);
			view.addObject("page", mettingPage);
			view.addObject("metting", mettingList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return view;
	}
	@RequestMapping("/add")
	public String insertMettingType(HttpServletRequest request,HttpServletResponse response,Metting label) {
		try {
			MettingTypeService.insertMetting(label);
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	@RequestMapping("/edit")
	public String updateMettingType(HttpServletRequest request,HttpServletResponse response,Metting label) {
		try {
			MettingTypeService.editMetting(label);
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	@RequestMapping("/del")
	public String deleteMettingType(HttpServletRequest request,HttpServletResponse response,String id) {
		try {
			MettingTypeService.delMetting(id);
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
}
