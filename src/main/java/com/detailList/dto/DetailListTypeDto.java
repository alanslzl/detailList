package com.detailList.dto;

import java.util.List;

import com.detailList.entity.Work;

public class DetailListTypeDto {
	private String workTypeId;
	
	private String workTypeName;
	
	private List<Work> list;

	public String getWorkTypeName() {
		return workTypeName;
	}

	public void setWorkTypeName(String workTypeName) {
		this.workTypeName = workTypeName;
	}

	public List<Work> getList() {
		return list;
	}

	public void setList(List<Work> list) {
		this.list = list;
	}

	public String getWorkTypeId() {
		return workTypeId;
	}

	public void setWorkTypeId(String workTypeId) {
		this.workTypeId = workTypeId;
	}

}
