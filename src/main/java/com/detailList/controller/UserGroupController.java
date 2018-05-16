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
import com.detailList.entity.Zhr2001;
import com.detailList.entity.userGroup;
import com.detailList.service.UserGroupService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RestController
@RequestMapping("/userGroup")
public class UserGroupController {
	@Autowired
	private UserGroupService userGroupService;
	
	@RequestMapping("/query")
	public ModelAndView queryuserGroup(HttpServletRequest request,HttpServletResponse response,Integer page,userGroup userGroup) {
		ModelAndView view = new ModelAndView("/page/userGroupManager");
		try {
			if(null == page) {
				page = 1;
			}
			PageHelper.startPage(page, 10);
			List<userGroup> userGroupList = userGroupService.queryUserGroup(userGroup);
			PageInfo<userGroup> userGroupPage=new PageInfo<userGroup>(userGroupList);
			view.addObject("page", userGroupPage);
			view.addObject("userGroup", userGroupList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return view;
	}
	@RequestMapping("/queryAll")
	public Object queryuserGroupAll(HttpServletRequest request,HttpServletResponse response,Integer page,userGroup userGroup) {
		try {
			List<userGroup> userGroupList = userGroupService.queryUserGroup(userGroup);
			return userGroupList;
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	@RequestMapping("/add")
	public String insertuserGroup(HttpServletRequest request,HttpServletResponse response,userGroup userGroup,String userId) {
		try {
			Zhr2001 userInfo = (Zhr2001)request.getSession().getAttribute("userInfo");
			userGroupService.insertUserGroup(userGroup);
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	@RequestMapping("/edit")
	public String updateuserGroup(HttpServletRequest request,HttpServletResponse response,userGroup userGroup) {
		try {
			userGroupService.editUserGroup(userGroup);
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	@RequestMapping("/del")
	public String deleteuserGroup(HttpServletRequest request,HttpServletResponse response,int id) {
		try {
			userGroupService.delUserGroup(id);
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	@RequestMapping("/queryById")
	@ResponseBody
	public Object queryuserGroupById(HttpServletRequest request,HttpServletResponse response,int id) {
		try {
			return userGroupService.queryUserGroupById(id);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
}

