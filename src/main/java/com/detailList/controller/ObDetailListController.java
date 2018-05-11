package com.detailList.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.detailList.dto.Result;
import com.detailList.entity.DetailList;
import com.detailList.entity.User;
import com.detailList.service.ObDetailListService;

@RestController
@RequestMapping("/obDetailList")
public class ObDetailListController {
	
	@Autowired
	private ObDetailListService obDetailListService;
	
	/**
	 * 借阅用户查询
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/queryObUser")
	@ResponseBody
	public Object queryObUser(HttpServletRequest request,HttpServletResponse response) {
		try {
			User user = (User)request.getSession().getAttribute("user");
			List<Map<String, Object>> queryList = obDetailListService.selectObUser(null,user.getId(),null);
			return queryList;
		} catch (Exception e) {
			e.printStackTrace();
			return Result.error(e.getMessage());
		}
	}
	/**
	 * 工作台查询清单列表
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/queryUserObDetailList")
	@ResponseBody
	public Object queryDetailList(HttpServletRequest request,HttpServletResponse response,String userId) {
		try {
			List<DetailList> queryList = obDetailListService.selectObDetailListByUserId(userId);
			return queryList;
		} catch (Exception e) {
			e.printStackTrace();
			return Result.error(e.getMessage());
		}
	}
}
