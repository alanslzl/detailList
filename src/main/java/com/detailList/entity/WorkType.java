package com.detailList.entity;

import java.io.Serializable;

public class WorkType implements Serializable {
    private String id;

    private String detailListId;

    private String workTypeName;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getDetailListId() {
        return detailListId;
    }

    public void setDetailListId(String detailListId) {
        this.detailListId = detailListId == null ? null : detailListId.trim();
    }

    public String getWorkTypeName() {
        return workTypeName;
    }

    public void setWorkTypeName(String workTypeName) {
        this.workTypeName = workTypeName == null ? null : workTypeName.trim();
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
        WorkType other = (WorkType) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getDetailListId() == null ? other.getDetailListId() == null : this.getDetailListId().equals(other.getDetailListId()))
            && (this.getWorkTypeName() == null ? other.getWorkTypeName() == null : this.getWorkTypeName().equals(other.getWorkTypeName()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getDetailListId() == null) ? 0 : getDetailListId().hashCode());
        result = prime * result + ((getWorkTypeName() == null) ? 0 : getWorkTypeName().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", detailListId=").append(detailListId);
        sb.append(", workTypeName=").append(workTypeName);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}