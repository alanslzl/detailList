package com.detailList.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Work implements Serializable {
    private String id;

    private String workName;

    private String jobRequire;

    private String mettingTypeId;

    private String workCompany;

    private Date finishTime;

    private String workLabel;

    private String workStatus;

    private String workLevel;

    private String inputCompany;

    private String supervisorStrategy;

    private String enclosure;

    private String mergeId;

    private String workProgress;

    private String workPublishPerson;
    
    private String liablePerson;
    
    private String supervisor;
    
    public List<WorkNode> nodeList;

    public List<WorkNode> getNodeList() {
		return nodeList;
	}

	public void setNodeList(List<WorkNode> nodeList) {
		this.nodeList = nodeList;
	}

	private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getWorkName() {
        return workName;
    }

    public void setWorkName(String workName) {
        this.workName = workName == null ? null : workName.trim();
    }

    public String getJobRequire() {
        return jobRequire;
    }

    public void setJobRequire(String jobRequire) {
        this.jobRequire = jobRequire == null ? null : jobRequire.trim();
    }

    public String getMettingTypeId() {
        return mettingTypeId;
    }

    public void setMettingTypeId(String mettingTypeId) {
        this.mettingTypeId = mettingTypeId == null ? null : mettingTypeId.trim();
    }

    public String getWorkCompany() {
        return workCompany;
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

	public void setWorkCompany(String workCompany) {
        this.workCompany = workCompany == null ? null : workCompany.trim();
    }

    public Date getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(Date finishTime) {
        this.finishTime = finishTime;
    }

    public String getWorkLabel() {
        return workLabel;
    }

    public void setWorkLabel(String workLabel) {
        this.workLabel = workLabel == null ? null : workLabel.trim();
    }

    public String getWorkStatus() {
        return workStatus;
    }

    public void setWorkStatus(String workStatus) {
        this.workStatus = workStatus == null ? null : workStatus.trim();
    }

    public String getWorkLevel() {
        return workLevel;
    }

    public void setWorkLevel(String workLevel) {
        this.workLevel = workLevel == null ? null : workLevel.trim();
    }

    public String getInputCompany() {
        return inputCompany;
    }

    public void setInputCompany(String inputCompany) {
        this.inputCompany = inputCompany == null ? null : inputCompany.trim();
    }

    public String getSupervisorStrategy() {
        return supervisorStrategy;
    }

    public void setSupervisorStrategy(String supervisorStrategy) {
        this.supervisorStrategy = supervisorStrategy == null ? null : supervisorStrategy.trim();
    }

    public String getEnclosure() {
        return enclosure;
    }

    public void setEnclosure(String enclosure) {
        this.enclosure = enclosure == null ? null : enclosure.trim();
    }

    public String getMergeId() {
        return mergeId;
    }

    public void setMergeId(String mergeId) {
        this.mergeId = mergeId == null ? null : mergeId.trim();
    }

    public String getWorkProgress() {
        return workProgress;
    }

    public void setWorkProgress(String workProgress) {
        this.workProgress = workProgress == null ? null : workProgress.trim();
    }

    public String getWorkPublishPerson() {
        return workPublishPerson;
    }

    public void setWorkPublishPerson(String workPublishPerson) {
        this.workPublishPerson = workPublishPerson == null ? null : workPublishPerson.trim();
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
        Work other = (Work) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getWorkName() == null ? other.getWorkName() == null : this.getWorkName().equals(other.getWorkName()))
            && (this.getJobRequire() == null ? other.getJobRequire() == null : this.getJobRequire().equals(other.getJobRequire()))
            && (this.getMettingTypeId() == null ? other.getMettingTypeId() == null : this.getMettingTypeId().equals(other.getMettingTypeId()))
            && (this.getWorkCompany() == null ? other.getWorkCompany() == null : this.getWorkCompany().equals(other.getWorkCompany()))
            && (this.getFinishTime() == null ? other.getFinishTime() == null : this.getFinishTime().equals(other.getFinishTime()))
            && (this.getWorkLabel() == null ? other.getWorkLabel() == null : this.getWorkLabel().equals(other.getWorkLabel()))
            && (this.getWorkStatus() == null ? other.getWorkStatus() == null : this.getWorkStatus().equals(other.getWorkStatus()))
            && (this.getWorkLevel() == null ? other.getWorkLevel() == null : this.getWorkLevel().equals(other.getWorkLevel()))
            && (this.getInputCompany() == null ? other.getInputCompany() == null : this.getInputCompany().equals(other.getInputCompany()))
            && (this.getSupervisorStrategy() == null ? other.getSupervisorStrategy() == null : this.getSupervisorStrategy().equals(other.getSupervisorStrategy()))
            && (this.getEnclosure() == null ? other.getEnclosure() == null : this.getEnclosure().equals(other.getEnclosure()))
            && (this.getMergeId() == null ? other.getMergeId() == null : this.getMergeId().equals(other.getMergeId()))
            && (this.getWorkProgress() == null ? other.getWorkProgress() == null : this.getWorkProgress().equals(other.getWorkProgress()))
            && (this.getWorkPublishPerson() == null ? other.getWorkPublishPerson() == null : this.getWorkPublishPerson().equals(other.getWorkPublishPerson()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getWorkName() == null) ? 0 : getWorkName().hashCode());
        result = prime * result + ((getJobRequire() == null) ? 0 : getJobRequire().hashCode());
        result = prime * result + ((getMettingTypeId() == null) ? 0 : getMettingTypeId().hashCode());
        result = prime * result + ((getWorkCompany() == null) ? 0 : getWorkCompany().hashCode());
        result = prime * result + ((getFinishTime() == null) ? 0 : getFinishTime().hashCode());
        result = prime * result + ((getWorkLabel() == null) ? 0 : getWorkLabel().hashCode());
        result = prime * result + ((getWorkStatus() == null) ? 0 : getWorkStatus().hashCode());
        result = prime * result + ((getWorkLevel() == null) ? 0 : getWorkLevel().hashCode());
        result = prime * result + ((getInputCompany() == null) ? 0 : getInputCompany().hashCode());
        result = prime * result + ((getSupervisorStrategy() == null) ? 0 : getSupervisorStrategy().hashCode());
        result = prime * result + ((getEnclosure() == null) ? 0 : getEnclosure().hashCode());
        result = prime * result + ((getMergeId() == null) ? 0 : getMergeId().hashCode());
        result = prime * result + ((getWorkProgress() == null) ? 0 : getWorkProgress().hashCode());
        result = prime * result + ((getWorkPublishPerson() == null) ? 0 : getWorkPublishPerson().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", workName=").append(workName);
        sb.append(", jobRequire=").append(jobRequire);
        sb.append(", mettingTypeId=").append(mettingTypeId);
        sb.append(", workCompany=").append(workCompany);
        sb.append(", finishTime=").append(finishTime);
        sb.append(", workLabel=").append(workLabel);
        sb.append(", workStatus=").append(workStatus);
        sb.append(", workLevel=").append(workLevel);
        sb.append(", inputCompany=").append(inputCompany);
        sb.append(", supervisorStrategy=").append(supervisorStrategy);
        sb.append(", enclosure=").append(enclosure);
        sb.append(", mergeId=").append(mergeId);
        sb.append(", workProgress=").append(workProgress);
        sb.append(", workPublishPerson=").append(workPublishPerson);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}