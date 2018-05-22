package com.detailList.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSON;
import com.detailList.dto.NodeDto;
import com.detailList.entity.Zhr2002;
import com.detailList.service.OrgService;

@RestController
@RequestMapping("/org")
public class OrgController {

	@Autowired
	private OrgService orgService;

	/**
	 * 获取tree的数据
	 * 
	 * @return
	 */
	@RequestMapping("/getSysOrganizeIdJSON")
	@ResponseBody
	public String getSysOrganizeIdJSON() {
		NodeDto node = getSysOrganizeByParentIdJSON();
		return JSON.toJSONString(node);
	}

	/**
	 * 机构的JSON拼接
	 * 
	 * @param id
	 * @return
	 */
	private NodeDto getSysOrganizeByParentIdJSON() {
		List<NodeDto> nodes = new ArrayList<NodeDto>();
		Zhr2002 record = new Zhr2002();
		List<Zhr2002> list = orgService.selectOrg(record);
		for (Zhr2002 sysOrganize : list) {
			NodeDto node = new NodeDto();
			node.setNodeId(sysOrganize.getOrgeh());
			node.setPid(sysOrganize.getObjid());
			node.setNid(sysOrganize.getOrgeh());
			node.setText(sysOrganize.getStext());
			nodes.add(node);
		}
		NodeDto tree = new NodeDto();//重要插件，创建一个树模型
		NodeDto mt = tree.createTree(nodes);
		return mt;
	}
}
