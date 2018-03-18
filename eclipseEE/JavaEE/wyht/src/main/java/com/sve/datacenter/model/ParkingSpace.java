package com.sve.datacenter.model;

import java.io.Serializable;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class ParkingSpace implements Serializable{
	
	private District dis;
	
    private Integer parkid;

    private String pnum;

    private Integer disid;

    private Double carea;

    private Integer status;

    private Integer tollcount;

    private String remark;

    public District getDis() {
		return dis;
	}

	public void setDis(District dis) {
		this.dis = dis;
	}

	public Integer getParkid() {
        return parkid;
    }

    public void setParkid(Integer parkid) {
        this.parkid = parkid;
    }

    public String getPnum() {
        return pnum;
    }

    public void setPnum(String pnum) {
        this.pnum = pnum == null ? null : pnum.trim();
    }

    public Integer getDisid() {
        return disid;
    }

    public void setDisid(Integer disid) {
        this.disid = disid;
    }

    public Double getCarea() {
        return carea;
    }

    public void setCarea(Double carea) {
        this.carea = carea;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getTollcount() {
        return tollcount;
    }

    public void setTollcount(Integer tollcount) {
        this.tollcount = tollcount;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}