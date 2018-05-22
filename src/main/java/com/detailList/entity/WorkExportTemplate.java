package com.detailList.entity;

import java.io.Serializable;
import java.util.Date;

public class WorkExportTemplate implements Serializable {
    private String id;

    private String templateName;

    private String dense;

    private String denseStyle;

    private String detailType;

    private String detailTypeStyle;

    private String mettingName;

    private String mettingNameStyle;

    private String companyName;

    private String companyStyle;

    private String workNameStyle;

    private String workContentStyle;

    private String workProgressStyle;

    private String createUser;

    private Date updateTime;
    
    private String relationWorkStyle;
    
    private String nodeStyle;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName == null ? null : templateName.trim();
    }

    public String getDense() {
        return dense;
    }

    public void setDense(String dense) {
        this.dense = dense == null ? null : dense.trim();
    }

    public String getDenseStyle() {
        return denseStyle;
    }

    public void setDenseStyle(String denseStyle) {
        this.denseStyle = denseStyle == null ? null : denseStyle.trim();
    }

    public String getDetailType() {
        return detailType;
    }

    public void setDetailType(String detailType) {
        this.detailType = detailType == null ? null : detailType.trim();
    }

    public String getDetailTypeStyle() {
        return detailTypeStyle;
    }

    public void setDetailTypeStyle(String detailTypeStyle) {
        this.detailTypeStyle = detailTypeStyle == null ? null : detailTypeStyle.trim();
    }

    public String getMettingName() {
        return mettingName;
    }

    public void setMettingName(String mettingName) {
        this.mettingName = mettingName == null ? null : mettingName.trim();
    }

    public String getMettingNameStyle() {
        return mettingNameStyle;
    }

    public void setMettingNameStyle(String mettingNameStyle) {
        this.mettingNameStyle = mettingNameStyle == null ? null : mettingNameStyle.trim();
    }

    public String getRelationWorkStyle() {
		return relationWorkStyle;
	}

	public void setRelationWorkStyle(String relationWorkStyle) {
		this.relationWorkStyle = relationWorkStyle;
	}

	public String getNodeStyle() {
		return nodeStyle;
	}

	public void setNodeStyle(String nodeStyle) {
		this.nodeStyle = nodeStyle;
	}

	public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName == null ? null : companyName.trim();
    }

    public String getCompanyStyle() {
        return companyStyle;
    }

    public void setCompanyStyle(String companyStyle) {
        this.companyStyle = companyStyle == null ? null : companyStyle.trim();
    }

    public String getWorkNameStyle() {
        return workNameStyle;
    }

    public void setWorkNameStyle(String workNameStyle) {
        this.workNameStyle = workNameStyle == null ? null : workNameStyle.trim();
    }

    public String getWorkContentStyle() {
        return workContentStyle;
    }

    public void setWorkContentStyle(String workContentStyle) {
        this.workContentStyle = workContentStyle == null ? null : workContentStyle.trim();
    }

    public String getWorkProgressStyle() {
        return workProgressStyle;
    }

    public void setWorkProgressStyle(String workProgressStyle) {
        this.workProgressStyle = workProgressStyle == null ? null : workProgressStyle.trim();
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser == null ? null : createUser.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        WorkExportTemplate other = (WorkExportTemplate) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getTemplateName() == null ? other.getTemplateName() == null : this.getTemplateName().equals(other.getTemplateName()))
            && (this.getDense() == null ? other.getDense() == null : this.getDense().equals(other.getDense()))
            && (this.getDenseStyle() == null ? other.getDenseStyle() == null : this.getDenseStyle().equals(other.getDenseStyle()))
            && (this.getDetailType() == null ? other.getDetailType() == null : this.getDetailType().equals(other.getDetailType()))
            && (this.getDetailTypeStyle() == null ? other.getDetailTypeStyle() == null : this.getDetailTypeStyle().equals(other.getDetailTypeStyle()))
            && (this.getMettingName() == null ? other.getMettingName() == null : this.getMettingName().equals(other.getMettingName()))
            && (this.getMettingNameStyle() == null ? other.getMettingNameStyle() == null : this.getMettingNameStyle().equals(other.getMettingNameStyle()))
            && (this.getCompanyName() == null ? other.getCompanyName() == null : this.getCompanyName().equals(other.getCompanyName()))
            && (this.getCompanyStyle() == null ? other.getCompanyStyle() == null : this.getCompanyStyle().equals(other.getCompanyStyle()))
            && (this.getWorkNameStyle() == null ? other.getWorkNameStyle() == null : this.getWorkNameStyle().equals(other.getWorkNameStyle()))
            && (this.getWorkContentStyle() == null ? other.getWorkContentStyle() == null : this.getWorkContentStyle().equals(other.getWorkContentStyle()))
            && (this.getWorkProgressStyle() == null ? other.getWorkProgressStyle() == null : this.getWorkProgressStyle().equals(other.getWorkProgressStyle()))
            && (this.getCreateUser() == null ? other.getCreateUser() == null : this.getCreateUser().equals(other.getCreateUser()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getTemplateName() == null) ? 0 : getTemplateName().hashCode());
        result = prime * result + ((getDense() == null) ? 0 : getDense().hashCode());
        result = prime * result + ((getDenseStyle() == null) ? 0 : getDenseStyle().hashCode());
        result = prime * result + ((getDetailType() == null) ? 0 : getDetailType().hashCode());
        result = prime * result + ((getDetailTypeStyle() == null) ? 0 : getDetailTypeStyle().hashCode());
        result = prime * result + ((getMettingName() == null) ? 0 : getMettingName().hashCode());
        result = prime * result + ((getMettingNameStyle() == null) ? 0 : getMettingNameStyle().hashCode());
        result = prime * result + ((getCompanyName() == null) ? 0 : getCompanyName().hashCode());
        result = prime * result + ((getCompanyStyle() == null) ? 0 : getCompanyStyle().hashCode());
        result = prime * result + ((getWorkNameStyle() == null) ? 0 : getWorkNameStyle().hashCode());
        result = prime * result + ((getWorkContentStyle() == null) ? 0 : getWorkContentStyle().hashCode());
        result = prime * result + ((getWorkProgressStyle() == null) ? 0 : getWorkProgressStyle().hashCode());
        result = prime * result + ((getCreateUser() == null) ? 0 : getCreateUser().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", templateName=").append(templateName);
        sb.append(", dense=").append(dense);
        sb.append(", denseStyle=").append(denseStyle);
        sb.append(", detailType=").append(detailType);
        sb.append(", detailTypeStyle=").append(detailTypeStyle);
        sb.append(", mettingName=").append(mettingName);
        sb.append(", mettingNameStyle=").append(mettingNameStyle);
        sb.append(", companyName=").append(companyName);
        sb.append(", companyStyle=").append(companyStyle);
        sb.append(", workNameStyle=").append(workNameStyle);
        sb.append(", workContentStyle=").append(workContentStyle);
        sb.append(", workProgressStyle=").append(workProgressStyle);
        sb.append(", createUser=").append(createUser);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}