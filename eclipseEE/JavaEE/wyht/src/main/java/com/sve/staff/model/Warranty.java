package com.sve.staff.model;

import java.util.Date;

import org.directwebremoting.annotations.DataTransferObject;

import com.sve.datacenter.model.Owners;
@DataTransferObject
public class Warranty {
	private Integer warHouseId;
	
    private Integer warId;

    private Integer cmpOwnersOid;

    private Integer wartypeId;

    private Integer warserviceId;

    private String warContent;

    private Date warDate;

    private Integer warStatus;

    private Date warChulidate;

    private Double warMaterial;

    private Double warUpkeep;

    private Integer warIspay;

    private Date warPaydate;
    
    private String warImg;
    
    private String hnum; 
    
    private Wartype wartype;
    
    private Owners owners;  
    
    private Employee emp;
    
	public Integer getWarHouseId() {
		return warHouseId;
	}

	public void setWarHouseId(Integer warHouseId) {
		this.warHouseId = warHouseId;
	}

	public Employee getEmp() {
		return emp;
	}

	public void setEmp(Employee emp) {
		this.emp = emp;
	}

	public String getHnum() {
		return hnum;
	}

	public void setHnum(String hnum) {
		this.hnum = hnum;
	}

	public Owners getOwners() {
		return owners;
	}

	public void setOwners(Owners owners) {
		this.owners = owners;
	}

	public Wartype getWartype() {
		return wartype;
	}

	public void setWartype(Wartype wartype) {
		this.wartype = wartype;
	}
	
	public String getWarImg() {
		return warImg;
	}

	public void setWarImg(String warImg) {
		this.warImg = warImg;
	}

	public Integer getWarId() {
        return warId;
    }

    public void setWarId(Integer warId) {
        this.warId = warId;
    }

    public Integer getCmpOwnersOid() {
        return cmpOwnersOid;
    }

    public void setCmpOwnersOid(Integer cmpOwnersOid) {
        this.cmpOwnersOid = cmpOwnersOid;
    }

    public Integer getWartypeId() {
        return wartypeId;
    }

    public void setWartypeId(Integer wartypeId) {
        this.wartypeId = wartypeId;
    }

    public Integer getWarserviceId() {
        return warserviceId;
    }

    public void setWarserviceId(Integer warserviceId) {
        this.warserviceId = warserviceId;
    }

    public String getWarContent() {
        return warContent;
    }

    public void setWarContent(String warContent) {
        this.warContent = warContent == null ? null : warContent.trim();
    }

    public Date getWarDate() {
        return warDate;
    }

    public void setWarDate(Date warDate) {
        this.warDate = warDate;
    }

    public Integer getWarStatus() {
        return warStatus;
    }

    public void setWarStatus(Integer warStatus) {
        this.warStatus = warStatus;
    }

    public Date getWarChulidate() {
        return warChulidate;
    }

    public void setWarChulidate(Date warChulidate) {
        this.warChulidate = warChulidate;
    }

    public Double getWarMaterial() {
        return warMaterial;
    }

    public void setWarMaterial(Double warMaterial) {
        this.warMaterial = warMaterial;
    }

    public Double getWarUpkeep() {
        return warUpkeep;
    }

    public void setWarUpkeep(Double warUpkeep) {
        this.warUpkeep = warUpkeep;
    }

    public Integer getWarIspay() {
        return warIspay;
    }

    public void setWarIspay(Integer warIspay) {
        this.warIspay = warIspay;
    }

    public Date getWarPaydate() {
        return warPaydate;
    }

    public void setWarPaydate(Date warPaydate) {
        this.warPaydate = warPaydate;
    }
}