package com.detailList.dto;

import java.util.List;

import com.detailList.entity.Work;

public class DetailListDto {
	
	private List<DetailListTypeDto> typeWorkListDto;
	
	private List<Work> noTypeWorkList;

	public List<DetailListTypeDto> getTypeWorkListDto() {
		return typeWorkListDto;
	}

	public void setTypeWorkListDto(List<DetailListTypeDto> typeWorkListDto) {
		this.typeWorkListDto = typeWorkListDto;
	}

	public List<Work> getNoTypeWorkList() {
		return noTypeWorkList;
	}

	public void setNoTypeWorkList(List<Work> noTypeWorkList) {
		this.noTypeWorkList = noTypeWorkList;
	}
	
	
}
