package com.detailList.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSON;
import com.detailList.entity.Zhr2001;
import com.detailList.service.PersonInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RestController
@RequestMapping("/personInfo")
public class PersonInfoController {
	
	@Autowired
	private PersonInfoService personInfoService;
	
	@RequestMapping("/queryPersonInfo")
	@ResponseBody
	public String queryPersonInfo(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="personInfo",required=false)String personInfo,Integer page) {
		if(null == page) {
			page = 1;
		}
		PageHelper.startPage(page, 7);
		List<Zhr2001> personInfoList = personInfoService.selectPersonInfo(personInfo);
		PageInfo<Zhr2001> pageInfo=new PageInfo<Zhr2001>(personInfoList);
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("total",pageInfo.getTotal());
        result.put("rows",pageInfo.getList());
		return JSON.toJSONString(result);
	}
}
