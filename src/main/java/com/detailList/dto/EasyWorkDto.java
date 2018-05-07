package com.detailList.dto;

public class EasyWorkDto {
	private String detailListId;
	private String workType;
	private String workName;
	private String liablePerson;
	private String supervisor;
	private String supervisorStrategy;
	public String getWorkType() {
		return workType;
	}
	public void setWorkType(String workType) {
		this.workType = workType;
	}
	public String getWorkName() {
		return workName;
	}
	public void setWorkName(String workName) {
		this.workName = workName;
	}
	public String getSupervisorStrategy() {
		return supervisorStrategy;
	}
	public void setSupervisorStrategy(String supervisorStrategy) {
		this.supervisorStrategy = supervisorStrategy;
	}
	public String getDetailListId() {
		return detailListId;
	}
	public void setDetailListId(String detailListId) {
		this.detailListId = detailListId;
	}
	public String getLiablePerson() {
		return liablePerson;
	}
	public void setLiablePerson(String liablePerson) {
		this.liablePerson = liablePerson;
	}
	public String getSupervisor() {
		return supervisor;
	}
	public void setSupervisor(String supervisor) {
		this.supervisor = supervisor;
	}
	
}
