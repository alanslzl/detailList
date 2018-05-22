package com.detailList.entity;

import java.io.Serializable;
import java.util.Date;

public class WorkMsg implements Serializable {
    private String id;

    private String msgName;

    private Date msgTime;

    private String workId;

    private String msgContent;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getMsgName() {
        return msgName;
    }

    public void setMsgName(String msgName) {
        this.msgName = msgName == null ? null : msgName.trim();
    }

    public Date getMsgTime() {
        return msgTime;
    }

    public void setMsgTime(Date msgTime) {
        this.msgTime = msgTime;
    }

    public String getWorkId() {
        return workId;
    }

    public void setWorkId(String workId) {
        this.workId = workId == null ? null : workId.trim();
    }

    public String getMsgContent() {
        return msgContent;
    }

    public void setMsgContent(String msgContent) {
        this.msgContent = msgContent == null ? null : msgContent.trim();
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
        WorkMsg other = (WorkMsg) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getMsgName() == null ? other.getMsgName() == null : this.getMsgName().equals(other.getMsgName()))
            && (this.getMsgTime() == null ? other.getMsgTime() == null : this.getMsgTime().equals(other.getMsgTime()))
            && (this.getWorkId() == null ? other.getWorkId() == null : this.getWorkId().equals(other.getWorkId()))
            && (this.getMsgContent() == null ? other.getMsgContent() == null : this.getMsgContent().equals(other.getMsgContent()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getMsgName() == null) ? 0 : getMsgName().hashCode());
        result = prime * result + ((getMsgTime() == null) ? 0 : getMsgTime().hashCode());
        result = prime * result + ((getWorkId() == null) ? 0 : getWorkId().hashCode());
        result = prime * result + ((getMsgContent() == null) ? 0 : getMsgContent().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", msgName=").append(msgName);
        sb.append(", msgTime=").append(msgTime);
        sb.append(", workId=").append(workId);
        sb.append(", msgContent=").append(msgContent);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}