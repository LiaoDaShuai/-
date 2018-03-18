package com.sve.staff.model;


import org.directwebremoting.annotations.DataTransferObject;
@DataTransferObject
public class Tasktype {
    private Integer tasktypeId;

    private String tasktypeName;

    private String tasktypeRemark;

    public Integer getTasktypeId() {
        return tasktypeId;
    }

    public void setTasktypeId(Integer tasktypeId) {
        this.tasktypeId = tasktypeId;
    }

    public String getTasktypeName() {
        return tasktypeName;
    }

    public void setTasktypeName(String tasktypeName) {
        this.tasktypeName = tasktypeName == null ? null : tasktypeName.trim();
    }

    public String getTasktypeRemark() {
        return tasktypeRemark;
    }

    public void setTasktypeRemark(String tasktypeRemark) {
        this.tasktypeRemark = tasktypeRemark == null ? null : tasktypeRemark.trim();
    }
}