package com.detailList.entity;

import java.io.Serializable;
import java.util.Date;

public class Metting implements Serializable {
    private String id;

    private String mettingName;

    private Date mettingTime;
    
    private String insertUser;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getMettingName() {
        return mettingName;
    }

    public void setMettingName(String mettingName) {
        this.mettingName = mettingName == null ? null : mettingName.trim();
    }

    public Date getMettingTime() {
        return mettingTime;
    }

    public String getInsertUser() {
		return insertUser;
	}

	public void setInsertUser(String insertUser) {
		this.insertUser = insertUser;
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
        Metting other = (Metting) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getMettingName() == null ? other.getMettingName() == null : this.getMettingName().equals(other.getMettingName()))
            && (this.getMettingTime() == null ? other.getMettingTime() == null : this.getMettingTime().equals(other.getMettingTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getMettingName() == null) ? 0 : getMettingName().hashCode());
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
        sb.append(", mettingName=").append(mettingName);
        sb.append(", mettingTime=").append(mettingTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}