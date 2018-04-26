package com.detailList.entity;

import java.io.Serializable;
import java.util.Date;

public class WorkNode implements Serializable {
    private String id;

    private String workId;

    private String nodeName;

    private String nodeContent;

    private Date finishTime;

    private String nodeLiable;

    private String nodeReasonChange;

    private String nodeKnotApply;

    private String nodeStatus;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getWorkId() {
        return workId;
    }

    public void setWorkId(String workId) {
        this.workId = workId == null ? null : workId.trim();
    }

    public String getNodeName() {
        return nodeName;
    }

    public void setNodeName(String nodeName) {
        this.nodeName = nodeName == null ? null : nodeName.trim();
    }

    public String getNodeContent() {
        return nodeContent;
    }

    public void setNodeContent(String nodeContent) {
        this.nodeContent = nodeContent == null ? null : nodeContent.trim();
    }

    public Date getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(Date finishTime) {
        this.finishTime = finishTime;
    }

    public String getNodeLiable() {
        return nodeLiable;
    }

    public void setNodeLiable(String nodeLiable) {
        this.nodeLiable = nodeLiable == null ? null : nodeLiable.trim();
    }

    public String getNodeReasonChange() {
        return nodeReasonChange;
    }

    public void setNodeReasonChange(String nodeReasonChange) {
        this.nodeReasonChange = nodeReasonChange == null ? null : nodeReasonChange.trim();
    }

    public String getNodeKnotApply() {
        return nodeKnotApply;
    }

    public void setNodeKnotApply(String nodeKnotApply) {
        this.nodeKnotApply = nodeKnotApply == null ? null : nodeKnotApply.trim();
    }

    public String getNodeStatus() {
        return nodeStatus;
    }

    public void setNodeStatus(String nodeStatus) {
        this.nodeStatus = nodeStatus == null ? null : nodeStatus.trim();
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
        WorkNode other = (WorkNode) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getWorkId() == null ? other.getWorkId() == null : this.getWorkId().equals(other.getWorkId()))
            && (this.getNodeName() == null ? other.getNodeName() == null : this.getNodeName().equals(other.getNodeName()))
            && (this.getNodeContent() == null ? other.getNodeContent() == null : this.getNodeContent().equals(other.getNodeContent()))
            && (this.getFinishTime() == null ? other.getFinishTime() == null : this.getFinishTime().equals(other.getFinishTime()))
            && (this.getNodeLiable() == null ? other.getNodeLiable() == null : this.getNodeLiable().equals(other.getNodeLiable()))
            && (this.getNodeReasonChange() == null ? other.getNodeReasonChange() == null : this.getNodeReasonChange().equals(other.getNodeReasonChange()))
            && (this.getNodeKnotApply() == null ? other.getNodeKnotApply() == null : this.getNodeKnotApply().equals(other.getNodeKnotApply()))
            && (this.getNodeStatus() == null ? other.getNodeStatus() == null : this.getNodeStatus().equals(other.getNodeStatus()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getWorkId() == null) ? 0 : getWorkId().hashCode());
        result = prime * result + ((getNodeName() == null) ? 0 : getNodeName().hashCode());
        result = prime * result + ((getNodeContent() == null) ? 0 : getNodeContent().hashCode());
        result = prime * result + ((getFinishTime() == null) ? 0 : getFinishTime().hashCode());
        result = prime * result + ((getNodeLiable() == null) ? 0 : getNodeLiable().hashCode());
        result = prime * result + ((getNodeReasonChange() == null) ? 0 : getNodeReasonChange().hashCode());
        result = prime * result + ((getNodeKnotApply() == null) ? 0 : getNodeKnotApply().hashCode());
        result = prime * result + ((getNodeStatus() == null) ? 0 : getNodeStatus().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", workId=").append(workId);
        sb.append(", nodeName=").append(nodeName);
        sb.append(", nodeContent=").append(nodeContent);
        sb.append(", finishTime=").append(finishTime);
        sb.append(", nodeLiable=").append(nodeLiable);
        sb.append(", nodeReasonChange=").append(nodeReasonChange);
        sb.append(", nodeKnotApply=").append(nodeKnotApply);
        sb.append(", nodeStatus=").append(nodeStatus);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}