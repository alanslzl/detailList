package com.detailList.entity;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
    private String id;

    private String userno;

    private String userid;

    private String password;

    private String position;

    private String org;

    private String firstname;

    private String lastname;

    private String sex;

    private Date brithday;

    private String mobile;

    private String telephone;

    private String org1;

    private String org2;

    private String org3;

    private String org4;

    private String org5;

    private String org6;

    private String idcard;

    private Date resigndate;

    private String posty;

    private String posnc;

    private Date datum;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUserno() {
        return userno;
    }

    public void setUserno(String userno) {
        this.userno = userno == null ? null : userno.trim();
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position == null ? null : position.trim();
    }

    public String getOrg() {
        return org;
    }

    public void setOrg(String org) {
        this.org = org == null ? null : org.trim();
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname == null ? null : firstname.trim();
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname == null ? null : lastname.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Date getBrithday() {
        return brithday;
    }

    public void setBrithday(Date brithday) {
        this.brithday = brithday;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getOrg1() {
        return org1;
    }

    public void setOrg1(String org1) {
        this.org1 = org1 == null ? null : org1.trim();
    }

    public String getOrg2() {
        return org2;
    }

    public void setOrg2(String org2) {
        this.org2 = org2 == null ? null : org2.trim();
    }

    public String getOrg3() {
        return org3;
    }

    public void setOrg3(String org3) {
        this.org3 = org3 == null ? null : org3.trim();
    }

    public String getOrg4() {
        return org4;
    }

    public void setOrg4(String org4) {
        this.org4 = org4 == null ? null : org4.trim();
    }

    public String getOrg5() {
        return org5;
    }

    public void setOrg5(String org5) {
        this.org5 = org5 == null ? null : org5.trim();
    }

    public String getOrg6() {
        return org6;
    }

    public void setOrg6(String org6) {
        this.org6 = org6 == null ? null : org6.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public Date getResigndate() {
        return resigndate;
    }

    public void setResigndate(Date resigndate) {
        this.resigndate = resigndate;
    }

    public String getPosty() {
        return posty;
    }

    public void setPosty(String posty) {
        this.posty = posty == null ? null : posty.trim();
    }

    public String getPosnc() {
        return posnc;
    }

    public void setPosnc(String posnc) {
        this.posnc = posnc == null ? null : posnc.trim();
    }

    public Date getDatum() {
        return datum;
    }

    public void setDatum(Date datum) {
        this.datum = datum;
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
        User other = (User) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getUserno() == null ? other.getUserno() == null : this.getUserno().equals(other.getUserno()))
            && (this.getUserid() == null ? other.getUserid() == null : this.getUserid().equals(other.getUserid()))
            && (this.getPassword() == null ? other.getPassword() == null : this.getPassword().equals(other.getPassword()))
            && (this.getPosition() == null ? other.getPosition() == null : this.getPosition().equals(other.getPosition()))
            && (this.getOrg() == null ? other.getOrg() == null : this.getOrg().equals(other.getOrg()))
            && (this.getFirstname() == null ? other.getFirstname() == null : this.getFirstname().equals(other.getFirstname()))
            && (this.getLastname() == null ? other.getLastname() == null : this.getLastname().equals(other.getLastname()))
            && (this.getSex() == null ? other.getSex() == null : this.getSex().equals(other.getSex()))
            && (this.getBrithday() == null ? other.getBrithday() == null : this.getBrithday().equals(other.getBrithday()))
            && (this.getMobile() == null ? other.getMobile() == null : this.getMobile().equals(other.getMobile()))
            && (this.getTelephone() == null ? other.getTelephone() == null : this.getTelephone().equals(other.getTelephone()))
            && (this.getOrg1() == null ? other.getOrg1() == null : this.getOrg1().equals(other.getOrg1()))
            && (this.getOrg2() == null ? other.getOrg2() == null : this.getOrg2().equals(other.getOrg2()))
            && (this.getOrg3() == null ? other.getOrg3() == null : this.getOrg3().equals(other.getOrg3()))
            && (this.getOrg4() == null ? other.getOrg4() == null : this.getOrg4().equals(other.getOrg4()))
            && (this.getOrg5() == null ? other.getOrg5() == null : this.getOrg5().equals(other.getOrg5()))
            && (this.getOrg6() == null ? other.getOrg6() == null : this.getOrg6().equals(other.getOrg6()))
            && (this.getIdcard() == null ? other.getIdcard() == null : this.getIdcard().equals(other.getIdcard()))
            && (this.getResigndate() == null ? other.getResigndate() == null : this.getResigndate().equals(other.getResigndate()))
            && (this.getPosty() == null ? other.getPosty() == null : this.getPosty().equals(other.getPosty()))
            && (this.getPosnc() == null ? other.getPosnc() == null : this.getPosnc().equals(other.getPosnc()))
            && (this.getDatum() == null ? other.getDatum() == null : this.getDatum().equals(other.getDatum()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getUserno() == null) ? 0 : getUserno().hashCode());
        result = prime * result + ((getUserid() == null) ? 0 : getUserid().hashCode());
        result = prime * result + ((getPassword() == null) ? 0 : getPassword().hashCode());
        result = prime * result + ((getPosition() == null) ? 0 : getPosition().hashCode());
        result = prime * result + ((getOrg() == null) ? 0 : getOrg().hashCode());
        result = prime * result + ((getFirstname() == null) ? 0 : getFirstname().hashCode());
        result = prime * result + ((getLastname() == null) ? 0 : getLastname().hashCode());
        result = prime * result + ((getSex() == null) ? 0 : getSex().hashCode());
        result = prime * result + ((getBrithday() == null) ? 0 : getBrithday().hashCode());
        result = prime * result + ((getMobile() == null) ? 0 : getMobile().hashCode());
        result = prime * result + ((getTelephone() == null) ? 0 : getTelephone().hashCode());
        result = prime * result + ((getOrg1() == null) ? 0 : getOrg1().hashCode());
        result = prime * result + ((getOrg2() == null) ? 0 : getOrg2().hashCode());
        result = prime * result + ((getOrg3() == null) ? 0 : getOrg3().hashCode());
        result = prime * result + ((getOrg4() == null) ? 0 : getOrg4().hashCode());
        result = prime * result + ((getOrg5() == null) ? 0 : getOrg5().hashCode());
        result = prime * result + ((getOrg6() == null) ? 0 : getOrg6().hashCode());
        result = prime * result + ((getIdcard() == null) ? 0 : getIdcard().hashCode());
        result = prime * result + ((getResigndate() == null) ? 0 : getResigndate().hashCode());
        result = prime * result + ((getPosty() == null) ? 0 : getPosty().hashCode());
        result = prime * result + ((getPosnc() == null) ? 0 : getPosnc().hashCode());
        result = prime * result + ((getDatum() == null) ? 0 : getDatum().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", userno=").append(userno);
        sb.append(", userid=").append(userid);
        sb.append(", password=").append(password);
        sb.append(", position=").append(position);
        sb.append(", org=").append(org);
        sb.append(", firstname=").append(firstname);
        sb.append(", lastname=").append(lastname);
        sb.append(", sex=").append(sex);
        sb.append(", brithday=").append(brithday);
        sb.append(", mobile=").append(mobile);
        sb.append(", telephone=").append(telephone);
        sb.append(", org1=").append(org1);
        sb.append(", org2=").append(org2);
        sb.append(", org3=").append(org3);
        sb.append(", org4=").append(org4);
        sb.append(", org5=").append(org5);
        sb.append(", org6=").append(org6);
        sb.append(", idcard=").append(idcard);
        sb.append(", resigndate=").append(resigndate);
        sb.append(", posty=").append(posty);
        sb.append(", posnc=").append(posnc);
        sb.append(", datum=").append(datum);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}