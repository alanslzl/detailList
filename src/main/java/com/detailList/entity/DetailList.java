package com.detailList.entity;

import java.io.Serializable;
import java.util.Date;

public class DetailList implements Serializable {
    private String id;

    private String detailListName;

    private String detailListPerson;

    private Date createTime;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getDetailListName() {
        return detailListName;
    }

    public void setDetailListName(String detailListName) {
        this.detailListName = detailListName == null ? null : detailListName.trim();
    }

    public String getDetailListPerson() {
        return detailListPerson;
    }

    public void setDetailListPerson(String detailListPerson) {
        this.detailListPerson = detailListPerson == null ? null : detailListPerson.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
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
        DetailList other = (DetailList) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getDetailListName() == null ? other.getDetailListName() == null : this.getDetailListName().equals(other.getDetailListName()))
            && (this.getDetailListPerson() == null ? other.getDetailListPerson() == null : this.getDetailListPerson().equals(other.getDetailListPerson()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getDetailListName() == null) ? 0 : getDetailListName().hashCode());
        result = prime * result + ((getDetailListPerson() == null) ? 0 : getDetailListPerson().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", detailListName=").append(detailListName);
        sb.append(", detailListPerson=").append(detailListPerson);
        sb.append(", createTime=").append(createTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}