package com.detailList.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authc.AuthenticationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.detailList.dto.Result;
import com.detailList.entity.User;
import com.detailList.entity.Zhr2001;
import com.detailList.service.UserService;
import com.detailList.utils.LdapValidator;

@Controller
public class LoginController{
	@Autowired
	private UserService userService;
    @RequestMapping(value = "/login" ,method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
    public String login(HttpServletRequest request,HttpServletResponse response, @ModelAttribute User currUser){
        try {
        	User user = userService.login(currUser);
        	if(null!=user){
        		Zhr2001 userInfo = userService.selectByPrimaryKey(Integer.parseInt(user.getId()));
        		request.getSession().setAttribute("user", user);
        		request.getSession().setAttribute("userInfo", userInfo);
        		return "redirect:/index.do";
        	}else {
        		throw new AuthenticationException("用户验证失败");
        	}
        }catch (AuthenticationException e) {
            //token.clear();
            return "redirect:page/login.jsp";
        }
    }
    @RequestMapping(value = "/ldapLogin" ,produces={"application/json;charset=UTF-8"})
    public String ldapLogin(HttpServletRequest request,HttpServletResponse response, @ModelAttribute User currUser){
        try {
        	Result r =  LdapValidator.validateLdapUser(currUser.getUserid(), currUser.getPassword());
        	if(r.getResultCode().equals(LdapValidator.SUCCESS)){
        		List<Map<String, Object>> rsmap = (List<Map<String, Object>>) r.getResultObject();
        		Zhr2001 userInfo = userService.selectPersonInfoByDomainId(rsmap.get(0).get("displayName").toString());
        		request.getSession().setAttribute("userInfo", userInfo);
        		return "redirect:/index.do";
        	}else {
        		return "redirect:page/login.jsp";
        	}
        }catch (Exception e) {
        	e.printStackTrace();
            return "redirect:page/login.jsp";
        }
    }
    @RequestMapping(value = "/doLogin" ,produces={"application/json;charset=UTF-8"})
    public String login(HttpServletRequest request,HttpServletResponse response){
    	return "redirect:page/login.jsp";
    }
    @RequestMapping(value = "/logout" ,produces={"application/json;charset=UTF-8"})
    public String logout(HttpServletRequest request,HttpServletResponse response){
        try {
        		request.getSession().removeAttribute("user");
        		request.getSession().removeAttribute("userInfo");
        		return "redirect:page/login.jsp";
        }catch (AuthenticationException e) {
            //token.clear();
            return "redirect:page/login.jsp";
        }
    }
}