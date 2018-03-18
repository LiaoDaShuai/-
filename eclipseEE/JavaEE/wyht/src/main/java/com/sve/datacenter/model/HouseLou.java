package com.sve.datacenter.model;

import java.io.Serializable;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class HouseLou implements Serializable{
	
	private District dis;
	
    private Integer hlid;

    private Integer disid;

    private String floorname;

    private Integer units;

    private Integer cengcount;

    private String floortype;

    private String structure;

    private String orientation;

    private String remark;

    private Integer status;

    public District getDis() {
		return dis;
	}

	public void setDis(District dis) {
		this.dis = dis;
	}

	public Integer getHlid() {
        return hlid;
    }

    public void setHlid(Integer hlid) {
        this.hlid = hlid;
    }

    public Integer getDisid() {
        return disid;
    }

    public void setDisid(Integer disid) {
        this.disid = disid;
    }

    public String getFloorname() {
        return floorname;
    }

    public void setFloorname(String floorname) {
        this.floorname = floorname == null ? null : floorname.trim();
    }

    public Integer getUnits() {
        return units;
    }

    public void setUnits(Integer units) {
        this.units = units;
    }

    public Integer getCengcount() {
        return cengcount;
    }

    public void setCengcount(Integer cengcount) {
        this.cengcount = cengcount;
    }

    public String getFloortype() {
        return floortype;
    }

    public void setFloortype(String floortype) {
        this.floortype = floortype == null ? null : floortype.trim();
    }

    public String getStructure() {
        return structure;
    }

    public void setStructure(String structure) {
        this.structure = structure == null ? null : structure.trim();
    }

    public String getOrientation() {
        return orientation;
    }

    public void setOrientation(String orientation) {
        this.orientation = orientation == null ? null : orientation.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}