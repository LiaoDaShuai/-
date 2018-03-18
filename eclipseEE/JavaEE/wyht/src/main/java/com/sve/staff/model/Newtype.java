package com.sve.staff.model;

public class Newtype {
    private Integer newTypeId;

    private String newTypeName;

    private String newTypeRemark;

    public Integer getNewTypeId() {
        return newTypeId;
    }

    public void setNewTypeId(Integer newTypeId) {
        this.newTypeId = newTypeId;
    }

    public String getNewTypeName() {
        return newTypeName;
    }

    public void setNewTypeName(String newTypeName) {
        this.newTypeName = newTypeName == null ? null : newTypeName.trim();
    }

    public String getNewTypeRemark() {
        return newTypeRemark;
    }

    public void setNewTypeRemark(String newTypeRemark) {
        this.newTypeRemark = newTypeRemark == null ? null : newTypeRemark.trim();
    }
}