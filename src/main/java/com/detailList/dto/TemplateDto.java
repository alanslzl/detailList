package com.detailList.dto;

import com.detailList.entity.WorkExportTemplate;
import com.detailList.utils.DateUtils;

public class TemplateDto {
	private String dense;
	private String denseFont;
	private String denseSize;
	private String denseColor;
	private String detailType;
	private String detailTypeFont;
	private String detailTypeSize;
	private String detailTypeColor;
	private String mettingName;
	private String mettingNameFont;
	private String mettingNameSize;
	private String mettingNameColor;
	private String companyName;
	private String companyFont;
	private String companySize;
	private String companyColor;
	private String workNameFont;
	private String workNameSize;
	private String workNameColor;
	private String workContentFont;
	private String workContentSize;
	private String workContentColor;
	private String workProgressFont;
	private String workProgressSize;
	private String workProgressColor;
	private String createUser;
	private String updateTime;
	private String relationWorkFont;
	private String relationWorkSize;
	private String relationWorkColor;
	private String nodeFont;
	private String nodeSize;
	private String nodeColor;
	public String getDense() {
		return dense;
	}
	public void setDense(String dense) {
		this.dense = dense;
	}
	public String getDenseFont() {
		return denseFont;
	}
	public void setDenseFont(String denseFont) {
		this.denseFont = denseFont;
	}
	public String getDenseSize() {
		return denseSize;
	}
	public void setDenseSize(String denseSize) {
		this.denseSize = denseSize;
	}
	public String getDenseColor() {
		return denseColor;
	}
	public void setDenseColor(String denseColor) {
		this.denseColor = denseColor;
	}
	public String getDetailType() {
		return detailType;
	}
	public void setDetailType(String detailType) {
		this.detailType = detailType;
	}
	public String getDetailTypeFont() {
		return detailTypeFont;
	}
	public void setDetailTypeFont(String detailTypeFont) {
		this.detailTypeFont = detailTypeFont;
	}
	public String getDetailTypeSize() {
		return detailTypeSize;
	}
	public void setDetailTypeSize(String detailTypeSize) {
		this.detailTypeSize = detailTypeSize;
	}
	public String getRelationWorkFont() {
		return relationWorkFont;
	}
	public void setRelationWorkFont(String relationWorkFont) {
		this.relationWorkFont = relationWorkFont;
	}
	public String getRelationWorkSize() {
		return relationWorkSize;
	}
	public void setRelationWorkSize(String relationWorkSize) {
		this.relationWorkSize = relationWorkSize;
	}
	public String getRelationWorkColor() {
		return relationWorkColor;
	}
	public void setRelationWorkColor(String relationWorkColor) {
		this.relationWorkColor = relationWorkColor;
	}
	public String getNodeFont() {
		return nodeFont;
	}
	public void setNodeFont(String nodeFont) {
		this.nodeFont = nodeFont;
	}
	public String getNodeSize() {
		return nodeSize;
	}
	public void setNodeSize(String nodeSize) {
		this.nodeSize = nodeSize;
	}
	public String getNodeColor() {
		return nodeColor;
	}
	public void setNodeColor(String nodeColor) {
		this.nodeColor = nodeColor;
	}
	public String getDetailTypeColor() {
		return detailTypeColor;
	}
	public void setDetailTypeColor(String detailTypeColor) {
		this.detailTypeColor = detailTypeColor;
	}
	public String getMettingName() {
		return mettingName;
	}
	public void setMettingName(String mettingName) {
		this.mettingName = mettingName;
	}
	public String getMettingNameFont() {
		return mettingNameFont;
	}
	public void setMettingNameFont(String mettingNameFont) {
		this.mettingNameFont = mettingNameFont;
	}
	public String getMettingNameSize() {
		return mettingNameSize;
	}
	public void setMettingNameSize(String mettingNameSize) {
		this.mettingNameSize = mettingNameSize;
	}
	public String getMettingNameColor() {
		return mettingNameColor;
	}
	public void setMettingNameColor(String mettingNameColor) {
		this.mettingNameColor = mettingNameColor;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyFont() {
		return companyFont;
	}
	public void setCompanyFont(String companyFont) {
		this.companyFont = companyFont;
	}
	public String getCompanySize() {
		return companySize;
	}
	public void setCompanySize(String companySize) {
		this.companySize = companySize;
	}
	public String getCompanyColor() {
		return companyColor;
	}
	public void setCompanyColor(String companyColor) {
		this.companyColor = companyColor;
	}
	public String getWorkNameFont() {
		return workNameFont;
	}
	public void setWorkNameFont(String workNameFont) {
		this.workNameFont = workNameFont;
	}
	public String getWorkNameSize() {
		return workNameSize;
	}
	public void setWorkNameSize(String workNameSize) {
		this.workNameSize = workNameSize;
	}
	public String getWorkNameColor() {
		return workNameColor;
	}
	public void setWorkNameColor(String workNameColor) {
		this.workNameColor = workNameColor;
	}
	public String getWorkContentFont() {
		return workContentFont;
	}
	public void setWorkContentFont(String workContentFont) {
		this.workContentFont = workContentFont;
	}
	public String getWorkContentSize() {
		return workContentSize;
	}
	public void setWorkContentSize(String workContentSize) {
		this.workContentSize = workContentSize;
	}
	public String getWorkContentColor() {
		return workContentColor;
	}
	public void setWorkContentColor(String workContentColor) {
		this.workContentColor = workContentColor;
	}
	public String getWorkProgressFont() {
		return workProgressFont;
	}
	public void setWorkProgressFont(String workProgressFont) {
		this.workProgressFont = workProgressFont;
	}
	public String getWorkProgressSize() {
		return workProgressSize;
	}
	public void setWorkProgressSize(String workProgressSize) {
		this.workProgressSize = workProgressSize;
	}
	public String getWorkProgressColor() {
		return workProgressColor;
	}
	public void setWorkProgressColor(String workProgressColor) {
		this.workProgressColor = workProgressColor;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public static TemplateDto converDto(WorkExportTemplate template) {
		TemplateDto dto = new TemplateDto();
		String[] dsy = template.getDenseStyle().split("-");
		dto.setDense(template.getDense());
		dto.setDenseFont(dsy[0]);
		dto.setDenseSize(dsy[1]);
		dto.setDenseColor(dsy[2]);
		String dty[] = template.getDetailTypeStyle().split("-");
		dto.setDetailType(template.getDetailType());
		dto.setDetailTypeFont(dty[0]);
		dto.setDetailTypeSize(dty[1]);
		dto.setDetailTypeColor(dty[2]);
		String mety[] = template.getMettingNameStyle().split("-");
		dto.setMettingName(template.getMettingName());
		dto.setMettingNameFont(mety[0]);
		dto.setMettingNameSize(mety[1]);
		dto.setMettingNameColor(mety[2]);
		String cty[] = template.getCompanyStyle().split("-");
		dto.setCompanyName(template.getCompanyName());
		dto.setCompanyFont(cty[0]);
		dto.setCompanySize(cty[1]);
		dto.setCompanyColor(cty[2]);
		String[] wty = template.getWorkNameStyle().split("-");
		dto.setWorkNameFont(wty[0]);
		dto.setWorkNameSize(wty[1]);
		dto.setWorkNameColor(wty[2]);
		String[] wcty = template.getWorkContentStyle().split("-");
		dto.setWorkContentFont(wcty[0]);
		dto.setWorkContentSize(wcty[1]);
		dto.setWorkContentColor(wcty[2]);
		String[] wpty = template.getWorkProgressStyle().split("-");
		dto.setWorkProgressFont(wpty[0]);
		dto.setWorkProgressSize(wpty[1]);
		dto.setWorkProgressColor(wpty[2]);
		String[] rty = template.getRelationWorkStyle().split("-");
		dto.setRelationWorkFont(rty[0]);
		dto.setRelationWorkSize(rty[1]);
		dto.setRelationWorkColor(rty[2]);
		String[] nty = template.getNodeStyle().split("-");
		dto.setNodeFont(nty[0]);
		dto.setNodeSize(nty[1]);
		dto.setNodeColor(nty[2]);
		dto.setCreateUser(template.getCreateUser());
		dto.setUpdateTime(DateUtils.getDateFormat(template.getUpdateTime()));
		return dto;
	}
		
}
