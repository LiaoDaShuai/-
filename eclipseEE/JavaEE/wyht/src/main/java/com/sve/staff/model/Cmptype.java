package com.sve.staff.model;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class Cmptype {
    private Integer cmptypeId;

    private String cmptypeName;

    private String cmptypeRemark;

    public Integer getCmptypeId() {
        return cmptypeId;
    }

    public void setCmptypeId(Integer cmptypeId) {
        this.cmptypeId = cmptypeId;
    }

    public String getCmptypeName() {
        return cmptypeName;
    }

    public void setCmptypeName(String cmptypeName) {
        this.cmptypeName = cmptypeName == null ? null : cmptypeName.trim();
    }

    public String getCmptypeRemark() {
        return cmptypeRemark;
    }

    public void setCmptypeRemark(String cmptypeRemark) {
        this.cmptypeRemark = cmptypeRemark == null ? null : cmptypeRemark.trim();
    }
}