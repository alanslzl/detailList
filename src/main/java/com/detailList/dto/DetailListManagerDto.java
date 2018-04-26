package com.detailList.dto;

import com.detailList.entity.DetailList;

public class DetailListManagerDto {
	
	private DetailList detailList;
	
	private DetailListDto detailListDto;

	public DetailList getDetailList() {
		return detailList;
	}

	public void setDetailList(DetailList detailList) {
		this.detailList = detailList;
	}

	public DetailListDto getDetailListDto() {
		return detailListDto;
	}

	public void setDetailListDto(DetailListDto detailListDto) {
		this.detailListDto = detailListDto;
	}

}
