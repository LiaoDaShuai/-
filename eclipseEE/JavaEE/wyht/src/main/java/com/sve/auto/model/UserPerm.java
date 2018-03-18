package com.sve.auto.model;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class UserPerm {
    private Integer upId;

    private Integer upUserId;

    private Integer upPermId;

    public Integer getUpId() {
        return upId;
    }

    public void setUpId(Integer upId) {
        this.upId = upId;
    }

    public Integer getUpUserId() {
        return upUserId;
    }

    public void setUpUserId(Integer upUserId) {
        this.upUserId = upUserId;
    }

    public Integer getUpPermId() {
        return upPermId;
    }

    public void setUpPermId(Integer upPermId) {
        this.upPermId = upPermId;
    }
}