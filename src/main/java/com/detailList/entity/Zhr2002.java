package com.detailList.entity;

import java.io.Serializable;

public class Zhr2002 implements Serializable {
    private Integer id;

    private String orgeh;

    private String stext;

    private String objid;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrgeh() {
        return orgeh;
    }

    public void setOrgeh(String orgeh) {
        this.orgeh = orgeh == null ? null : orgeh.trim();
    }

    public String getStext() {
        return stext;
    }

    public void setStext(String stext) {
        this.stext = stext == null ? null : stext.trim();
    }

    public String getObjid() {
        return objid;
    }

    public void setObjid(String objid) {
        this.objid = objid == null ? null : objid.trim();
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
        Zhr2002 other = (Zhr2002) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getOrgeh() == null ? other.getOrgeh() == null : this.getOrgeh().equals(other.getOrgeh()))
            && (this.getStext() == null ? other.getStext() == null : this.getStext().equals(other.getStext()))
            && (this.getObjid() == null ? other.getObjid() == null : this.getObjid().equals(other.getObjid()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getOrgeh() == null) ? 0 : getOrgeh().hashCode());
        result = prime * result + ((getStext() == null) ? 0 : getStext().hashCode());
        result = prime * result + ((getObjid() == null) ? 0 : getObjid().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", orgeh=").append(orgeh);
        sb.append(", stext=").append(stext);
        sb.append(", objid=").append(objid);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}