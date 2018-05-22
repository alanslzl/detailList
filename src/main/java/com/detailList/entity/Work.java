package com.detailList.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Work implements Serializable {
    private String id;

    private String workName;

    private String jobRequire;

    private String mettingTypeId;
    
    private String mettingName;

    private String workCompany;
    
    private String workCompanyName;

    private Date finishTime;

    private String workLabelId;
    
    private String labelName;

    private String workStatus;

    private String workLevel;

    private String inputCompany;
    
    private String inputCompanyName;

    private String supervisorStrategy;

    private String enclosure;

    private String mergeId;

    private String workProgress;

    private String workPublishPerson;
    
    private String workPublishPersonName;

    private Date mettingTime;
    
    private String supervisorId;
    
    private String supervisor;
    
    private String liablePersonId;
    
    private String liablePerson;
    
    private String supervisorUserId;
    
    private String relationId;
    
    private String liablePersonUserId;
    
    public List<WorkNode> nodeList;
    
    public List<Work> relationWork;
    
	private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getSupervisorId() {
		return supervisorId;
	}

	public void setSupervisorId(String supervisorId) {
		this.supervisorId = supervisorId;
	}

	public String getLiablePersonId() {
		return liablePersonId;
	}

	public void setLiablePersonId(String liablePersonId) {
		this.liablePersonId = liablePersonId;
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

    public List<Work> getRelationWork() {
		return relationWork;
	}

	public void setRelationWork(List<Work> relationWork) {
		this.relationWork = relationWork;
	}

	public String getSupervisor() {
		return supervisor;
	}

	public void setSupervisor(String supervisor) {
		this.supervisor = supervisor;
	}

	public String getLiablePerson() {
		return liablePerson;
	}

	public void setLiablePerson(String liablePerson) {
		this.liablePerson = liablePerson;
	}

	public void setWorkCompany(String workCompany) {
        this.workCompany = workCompany == null ? null : workCompany.trim();
    }

    public Date getFinishTime() {
        return finishTime;
    }

    public String getMettingName() {
		return mettingName;
	}

	public void setMettingName(String mettingName) {
		this.mettingName = mettingName;
	}

	public String getWorkCompanyName() {
		return workCompanyName;
	}

	public void setWorkCompanyName(String workCompanyName) {
		this.workCompanyName = workCompanyName;
	}

	public String getLabelName() {
		return labelName;
	}

	public void setLabelName(String labelName) {
		this.labelName = labelName;
	}

	public String getInputCompanyName() {
		return inputCompanyName;
	}

	public void setInputCompanyName(String inputCompanyName) {
		this.inputCompanyName = inputCompanyName;
	}

	public String getWorkPublishPersonName() {
		return workPublishPersonName;
	}

	public void setWorkPublishPersonName(String workPublishPersonName) {
		this.workPublishPersonName = workPublishPersonName;
	}

	public String getSupervisorUserId() {
		return supervisorUserId;
	}

	public void setSupervisorUserId(String supervisorUserId) {
		this.supervisorUserId = supervisorUserId;
	}

	public String getLiablePersonUserId() {
		return liablePersonUserId;
	}

	public void setLiablePersonUserId(String liablePersonUserId) {
		this.liablePersonUserId = liablePersonUserId;
	}

	public List<WorkNode> getNodeList() {
		return nodeList;
	}

	public String getRelationId() {
		return relationId;
	}

	public void setRelationId(String relationId) {
		this.relationId = relationId;
	}

	public void setNodeList(List<WorkNode> nodeList) {
		this.nodeList = nodeList;
	}

	public void setFinishTime(Date finishTime) {
        this.finishTime = finishTime;
    }

    public String getWorkLabelId() {
        return workLabelId;
    }

    public void setWorkLabelId(String workLabelId) {
        this.workLabelId = workLabelId == null ? null : workLabelId.trim();
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

    public Date getMettingTime() {
        return mettingTime;
    }

    public void setMettingTime(Date mettingTime) {
        this.mettingTime = mettingTime;
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
            && (this.getWorkLabelId() == null ? other.getWorkLabelId() == null : this.getWorkLabelId().equals(other.getWorkLabelId()))
            && (this.getWorkStatus() == null ? other.getWorkStatus() == null : this.getWorkStatus().equals(other.getWorkStatus()))
            && (this.getWorkLevel() == null ? other.getWorkLevel() == null : this.getWorkLevel().equals(other.getWorkLevel()))
            && (this.getInputCompany() == null ? other.getInputCompany() == null : this.getInputCompany().equals(other.getInputCompany()))
            && (this.getSupervisorStrategy() == null ? other.getSupervisorStrategy() == null : this.getSupervisorStrategy().equals(other.getSupervisorStrategy()))
            && (this.getEnclosure() == null ? other.getEnclosure() == null : this.getEnclosure().equals(other.getEnclosure()))
            && (this.getMergeId() == null ? other.getMergeId() == null : this.getMergeId().equals(other.getMergeId()))
            && (this.getWorkProgress() == null ? other.getWorkProgress() == null : this.getWorkProgress().equals(other.getWorkProgress()))
            && (this.getWorkPublishPerson() == null ? other.getWorkPublishPerson() == null : this.getWorkPublishPerson().equals(other.getWorkPublishPerson()))
            && (this.getMettingTime() == null ? other.getMettingTime() == null : this.getMettingTime().equals(other.getMettingTime()));
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
        result = prime * result + ((getWorkLabelId() == null) ? 0 : getWorkLabelId().hashCode());
        result = prime * result + ((getWorkStatus() == null) ? 0 : getWorkStatus().hashCode());
        result = prime * result + ((getWorkLevel() == null) ? 0 : getWorkLevel().hashCode());
        result = prime * result + ((getInputCompany() == null) ? 0 : getInputCompany().hashCode());
        result = prime * result + ((getSupervisorStrategy() == null) ? 0 : getSupervisorStrategy().hashCode());
        result = prime * result + ((getEnclosure() == null) ? 0 : getEnclosure().hashCode());
        result = prime * result + ((getMergeId() == null) ? 0 : getMergeId().hashCode());
        result = prime * result + ((getWorkProgress() == null) ? 0 : getWorkProgress().hashCode());
        result = prime * result + ((getWorkPublishPerson() == null) ? 0 : getWorkPublishPerson().hashCode());
        result = prime * result + ((getMettingTime() == null) ? 0 : getMettingTime().hashCode());
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
        sb.append(", workLabelId=").append(workLabelId);
        sb.append(", workStatus=").append(workStatus);
        sb.append(", workLevel=").append(workLevel);
        sb.append(", inputCompany=").append(inputCompany);
        sb.append(", supervisorStrategy=").append(supervisorStrategy);
        sb.append(", enclosure=").append(enclosure);
        sb.append(", mergeId=").append(mergeId);
        sb.append(", workProgress=").append(workProgress);
        sb.append(", workPublishPerson=").append(workPublishPerson);
        sb.append(", mettingTime=").append(mettingTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}