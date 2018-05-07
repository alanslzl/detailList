package com.detailList.controller;

import java.util.List;

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

@RestController
@RequestMapping("/personInfo")
public class PersonInfoController {
	
	@Autowired
	private PersonInfoService personInfoService;
	
	@RequestMapping("/queryPersonInfo")
	@ResponseBody
	public String queryPersonInfo(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="personInfo",required=false)String personInfo) {
		List<Zhr2001> personInfoList = personInfoService.selectPersonInfo(personInfo);
		return JSON.toJSONString(personInfoList);
	}
}
