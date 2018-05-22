package com.detailList.controller;

import java.util.Date;
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
import com.detailList.entity.WorkExportTemplate;
import com.detailList.entity.Zhr2001;
import com.detailList.service.TemplateService;
import com.detailList.utils.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RestController
@RequestMapping("/template")
public class TemplateController {
	@Autowired
	private TemplateService TemplateService;
	
	@RequestMapping("/query")
	public ModelAndView queryTemplate(HttpServletRequest request,HttpServletResponse response,Integer page,String templateName) {
		ModelAndView view = new ModelAndView("/page/templateManager");
		try {
			if(null == page) {
				page = 1;
			}
			PageHelper.startPage(page, 10);
			List<WorkExportTemplate> templateList = TemplateService.selectByName(templateName);
			PageInfo<WorkExportTemplate> templatePage=new PageInfo<WorkExportTemplate>(templateList);
			view.addObject("page", templatePage);
			view.addObject("template", templateList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return view;
	}
	@RequestMapping("/queryAll")
	public Object queryTemplateAll(HttpServletRequest request,HttpServletResponse response) {
		try {
			List<WorkExportTemplate> templateList = TemplateService.selectByName(null);
			return templateList;
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	@RequestMapping("/add")
	public String insertTemplate(HttpServletRequest request,HttpServletResponse response,WorkExportTemplate template) {
		try {
			Zhr2001 userInfo = (Zhr2001)request.getSession().getAttribute("userInfo");
			template.setId(StringUtils.genUUid());
			template.setCreateUser(userInfo.getPernr());
			template.setUpdateTime(new Date());
			TemplateService.insertSelective(template);
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	@RequestMapping("/edit")
	public String updateTemplate(HttpServletRequest request,HttpServletResponse response,WorkExportTemplate template) {
		try {
			template.setUpdateTime(new Date());
			TemplateService.updateByPrimaryKeySelective(template);
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	@RequestMapping("/del")
	public String deleteTemplate(HttpServletRequest request,HttpServletResponse response,String id) {
		try {
			TemplateService.deleteByPrimaryKey(id);
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	@RequestMapping("/queryById")
	@ResponseBody
	public Object queryTemplateById(HttpServletRequest request,HttpServletResponse response,String id) {
		try {
			return TemplateService.selectByPrimaryKey(id);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
}
