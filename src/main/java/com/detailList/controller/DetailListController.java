package com.detailList.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.detailList.dto.DetailListDto;
import com.detailList.dto.DetailListManagerDto;
import com.detailList.dto.Result;
import com.detailList.dto.WorkTypeDto;
import com.detailList.entity.DetailList;
import com.detailList.entity.DetailObServer;
import com.detailList.entity.DetailWork;
import com.detailList.entity.User;
import com.detailList.entity.Work;
import com.detailList.entity.WorkExportTemplate;
import com.detailList.entity.WorkType;
import com.detailList.entity.WorkTypeRelation;
import com.detailList.entity.Zhr2001;
import com.detailList.service.DetailListService;
import com.detailList.service.ObDetailListService;
import com.detailList.service.WorkService;
import com.detailList.utils.DateUtils;
import com.detailList.utils.StringUtils;
import com.detailList.utils.freemakerUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RestController
@RequestMapping("/detailList")
public class DetailListController{
	
	@Autowired
	private DetailListService detailListService;
	
	@Autowired
	private WorkService workService;
	
	@Autowired
	private ObDetailListService obDetailListService;
	
	@RequestMapping("/editDetailList")
	public ModelAndView editDetailList(HttpServletRequest request,HttpServletResponse response,String detailListId) {
		ModelAndView view = new ModelAndView("page/editDetailList");
		try {
			Zhr2001 user = (Zhr2001)request.getSession().getAttribute("userInfo");
			List<Map<String, Object>> ads = obDetailListService.selectObUser(null,user.getPernr(),detailListId);
			DetailList ndl = detailListService.selectDetailListById(detailListId);
			view.addObject("detailListId", detailListId);
			view.addObject("detailListName", ndl.getDetailListName());
			view.addObject("obUsers", JSONUtils.toJSONString(ads));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return view;
	}
	@RequestMapping("/queryDetailListManager")
	public ModelAndView queryDetailListManager(HttpServletRequest request,HttpServletResponse response,DetailList detailList,Integer page) {
		ModelAndView view = new ModelAndView("page/detailListManager");
		try {
			if(null == page) {
				page = 1;
			}
			List<DetailListManagerDto> dtoList = new ArrayList<>();
			User user = (User)request.getSession().getAttribute("user");
			detailList.setDetailListPerson(user.getId());
			PageHelper.startPage(page, 3);
			List<DetailList> queryList = detailListService.selectDetailList(detailList);
			for (DetailList dl : queryList) {
				DetailListDto wtList = workService.selectWorkType(dl.getId(),new Work());
				DetailListManagerDto dto = new DetailListManagerDto();
				dto.setDetailList(dl);
				dto.setDetailListDto(wtList);
				dtoList.add(dto);
			}
			PageInfo<DetailList> labelPage=new PageInfo<DetailList>(queryList);
			view.addObject("labelPage", labelPage);
			view.addObject("labelData", dtoList);
			PageHelper.startPage(page, 6);
			queryList = detailListService.selectDetailList(detailList);
			PageInfo<DetailList> tablePage=new PageInfo<DetailList>(queryList);
			view.addObject("tablePage", tablePage);
			view.addObject("tableData", queryList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return view;
	}
	
	/**
	 * 工作台查询清单列表
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/queryUserDetailList")
	@ResponseBody
	public Object queryDetailList(HttpServletRequest request,HttpServletResponse response,DetailList detailList) {
		try {
			User user = (User)request.getSession().getAttribute("user");
			detailList.setDetailListPerson(user.getId());
			List<DetailList> queryList = detailListService.selectDetailList(detailList);
			return queryList;
		} catch (Exception e) {
			e.printStackTrace();
			return Result.error(e.getMessage());
		}
	}
	
	@RequestMapping("/editUserDetailList")
	@ResponseBody
	public Object editDetailList(HttpServletRequest request,HttpServletResponse response,
		@Param("detailListId")String detailListId,
			@Param("detailListName")String detailListName,
				@Param("workTypeAndWork")String workTypeAndWork,
					@Param("noTypeWork")String noTypeWork,
						@Param("obUser")String obUser) {
		try {
			Zhr2001 user = (Zhr2001)request.getSession().getAttribute("userInfo");
			//修改清单
			DetailList ndl = detailListService.selectDetailListById(detailListId);
			ndl.setDetailListName(detailListName);
			detailListService.updateByPrimaryKeySelective(ndl);
			//删除清单工作类别和工作类别关系
			workService.deleteWorkTypeByDetailListId(detailListId);
			workService.deleteWorkTypeRelationByDeatailListId(detailListId);
			workService.deleteDetailWorkByDetailListId(detailListId);
			//获取新增清单的工作类别
			List<WorkTypeDto> dtoList = JSONArray.parseArray(workTypeAndWork, WorkTypeDto.class);
			for (WorkTypeDto workTypeDto : dtoList) {
				//创建工作类别
				WorkType worktype = new WorkType();
				worktype.setId(StringUtils.genUUid());
				worktype.setDetailListId(ndl.getId());
				worktype.setWorkTypeName(workTypeDto.getWorkTypeName());
				worktype = workService.insertWorkType(worktype);
				for (String workId : workTypeDto.getWorkIds()) {
					//创建类别与工作关系
					WorkTypeRelation wtr = new WorkTypeRelation();
					wtr.setId(StringUtils.genUUid());
					wtr.setWorkId(workId);
					wtr.setWorkTypeId(worktype.getId());
					workService.insertWorkTypeRelation(wtr);
				}
			}
			//获取无工作类别的清单工作
			List<String> noTypeWorkList = JSONArray.parseArray(noTypeWork, String.class);
			for (String workId : noTypeWorkList) {
				DetailWork work = new DetailWork();
				work.setId(StringUtils.genUUid());
				work.setDetailListId(ndl.getId());
				work.setWorkId(workId);
				workService.insertDetailWork(work);;
			}
			obDetailListService.deleteByDetailListId(detailListId);
			String obuserz[] = obUser.split(",");
			for (String u : obuserz) {
				DetailObServer ob = new DetailObServer();
				ob.setId(StringUtils.genUUid());
				ob.setDetailListId(ndl.getId());
				ob.setUserId(user.getPernr());
				ob.setObUserId(u);
				obDetailListService.insertSelective(ob);;
			}
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	
	@RequestMapping("/addUserDetailList")
	@ResponseBody
	public Object addDetailList(HttpServletRequest request,HttpServletResponse response,
			@Param("detailListName")String detailListName,
				@Param("workTypeAndWork")String workTypeAndWork,
					@Param("noTypeWork")String noTypeWork,
						@Param("obUser")String obUser) {
		try {
			//取得用户
			Zhr2001 user = (Zhr2001)request.getSession().getAttribute("userInfo");
			//创建清单
			DetailList ndl = new DetailList();
			ndl.setId(StringUtils.genUUid());
			ndl.setDetailListName(detailListName);
			ndl.setDetailListPerson(user.getPernr());
			ndl.setCreateTime(new Date());
			ndl = detailListService.insertDetailList(ndl);
			//获取新增清单的工作类别
			List<WorkTypeDto> dtoList = JSONArray.parseArray(workTypeAndWork, WorkTypeDto.class);
			for (WorkTypeDto workTypeDto : dtoList) {
				//创建工作类别
				WorkType worktype = new WorkType();
				worktype.setId(StringUtils.genUUid());
				worktype.setDetailListId(ndl.getId());
				worktype.setWorkTypeName(workTypeDto.getWorkTypeName());
				worktype = workService.insertWorkType(worktype);
				for (String workId : workTypeDto.getWorkIds()) {
					//创建类别与工作关系
					WorkTypeRelation wtr = new WorkTypeRelation();
					wtr.setId(StringUtils.genUUid());
					wtr.setWorkId(workId);
					wtr.setWorkTypeId(worktype.getId());
					workService.insertWorkTypeRelation(wtr);
				}
			}
			//获取无工作类别的清单工作
			List<String> noTypeWorkList = JSONArray.parseArray(noTypeWork, String.class);
			for (String workId : noTypeWorkList) {
				DetailWork work = new DetailWork();
				work.setId(StringUtils.genUUid());
				work.setDetailListId(ndl.getId());
				work.setWorkId(workId);
				workService.insertDetailWork(work);;
			}
			String obuserz[] = obUser.split(",");
			for (String u : obuserz) {
				DetailObServer ob = new DetailObServer();
				ob.setId(StringUtils.genUUid());
				ob.setDetailListId(ndl.getId());
				ob.setUserId(user.getPernr());
				ob.setObUserId(u);
				obDetailListService.insertSelective(ob);;
			}
			return JSON.toJSONString(Result.success());
		} catch (Exception e) {
			e.printStackTrace();
			return JSONUtils.toJSONString(Result.error(e.getMessage()));
		}
	}
	@RequestMapping("/exportDetailList")
	public String exportDetailList(HttpServletRequest request,HttpServletResponse response,String detailListId) throws IOException{
		DetailList dt = detailListService.selectDetailListById(detailListId);
		DetailListDto allWork = workService.selectWorkType(detailListId,new Work());
		WorkExportTemplate template = new WorkExportTemplate();
		template.setDense("公司机密⭐十年");
		template.setMettingName("商务、研发和信息化周会");
		template.setUpdateTime(DateUtils.getDateFormat());
		template.setCompanyName("董办");
		template.setDetailTypeStyle("楷体");
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("typeWorkList", allWork.getTypeWorkListDto());
		map.put("notypeWorkList", allWork.getNoTypeWorkList());
		map.put("detailList", dt);
		map.put("template", template);
		//提示：在调用工具类生成Word文档之前应当检查所有字段是否完整
        //否则Freemarker的模板殷勤在处理时可能会因为找不到值而报错，这里暂时忽略这个步骤
        File file = null;
        InputStream fin = null;
        ServletOutputStream out = null;
        try{
            //调用工具类WordGenerator的createDoc方法生成Word文档
            file = freemakerUtil.createDoc(map, "workDetail");
            fin = new FileInputStream(file);
            response.setCharacterEncoding("utf-8");
            response.setContentType("application/msword");
            response.addHeader("Content-Disposition", "attachment;filename=工作清单.doc");
            out = response.getOutputStream();
            byte[] buffer = new byte[1024];//缓冲区
            int bytesToRead = -1;
            // 通过循环将读入的Word文件的内容输出到浏览器中  
            while((bytesToRead = fin.read(buffer)) != -1) {  
                out.write(buffer, 0, bytesToRead);  
            }

        }catch(Exception ex){
            ex.printStackTrace();
        }
        finally{
            if(fin != null) fin.close();  
            if(out != null) out.close();  
            if(file != null) file.delete(); // 删除临时文件  
        }
        return null;
	}
}
