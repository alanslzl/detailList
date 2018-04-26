package com.detailList.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class IndexController {
	@RequestMapping("index")
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView view = new ModelAndView("page/mainPage");
		return view;
	}
}
