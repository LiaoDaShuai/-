package com.sve.datacenter.model;

import java.io.Serializable;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class Unit implements Serializable{
	
	private District dis;
    
    private HouseLou hl;
    
    private Integer unitid;

    private String unitname;

    private Integer floorcount;

    private Integer disid;

    private Integer hlid;

    public District getDis() {
		return dis;
	}

	public void setDis(District dis) {
		this.dis = dis;
	}

	public HouseLou getHl() {
		return hl;
	}

	public void setHl(HouseLou hl) {
		this.hl = hl;
	}

	public Integer getUnitid() {
        return unitid;
    }

    public void setUnitid(Integer unitid) {
        this.unitid = unitid;
    }

    public String getUnitname() {
        return unitname;
    }

    public void setUnitname(String unitname) {
        this.unitname = unitname == null ? null : unitname.trim();
    }

    public Integer getFloorcount() {
        return floorcount;
    }

    public void setFloorcount(Integer floorcount) {
        this.floorcount = floorcount;
    }

    public Integer getDisid() {
        return disid;
    }

    public void setDisid(Integer disid) {
        this.disid = disid;
    }

    public Integer getHlid() {
        return hlid;
    }

    public void setHlid(Integer hlid) {
        this.hlid = hlid;
    }
}