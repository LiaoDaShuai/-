package com.sve.staff.model;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class Wartype {
    private Integer wartypeId;

    private String wartypeName;

    private String wartypeRemark;

    public Integer getWartypeId() {
        return wartypeId;
    }

    public void setWartypeId(Integer wartypeId) {
        this.wartypeId = wartypeId;
    }

    public String getWartypeName() {
        return wartypeName;
    }

    public void setWartypeName(String wartypeName) {
        this.wartypeName = wartypeName == null ? null : wartypeName.trim();
    }

    public String getWartypeRemark() {
        return wartypeRemark;
    }

    public void setWartypeRemark(String wartypeRemark) {
        this.wartypeRemark = wartypeRemark == null ? null : wartypeRemark.trim();
    }
}