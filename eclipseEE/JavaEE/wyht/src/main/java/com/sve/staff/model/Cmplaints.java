package com.sve.staff.model;

import java.util.Date;

import org.directwebremoting.annotations.DataTransferObject;

import com.sve.datacenter.model.Owners;

@DataTransferObject
public class Cmplaints {
    private Integer cmpId;

    private Integer cmpOwnersOid;

    private Integer cmptypeId;

    private String cmpContent;

    private String cmpImg;

    private Date cmpData;

    private Integer cmpStatus;

    private String cmpHuifu;

    private Integer cmpEmp;
    
    private Cmptype cmptype;
    
    private Owners owners;
    
    private String hnum;

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

	public Cmptype getCmptype() {
		return cmptype;
	}

	public void setCmptype(Cmptype cmptype) {
		this.cmptype = cmptype;
	}

	public Integer getCmpId() {
        return cmpId;
    }

    public void setCmpId(Integer cmpId) {
        this.cmpId = cmpId;
    }

    public Integer getCmpOwnersOid() {
        return cmpOwnersOid;
    }

    public void setCmpOwnersOid(Integer cmpOwnersOid) {
        this.cmpOwnersOid = cmpOwnersOid;
    }

    public Integer getCmptypeId() {
        return cmptypeId;
    }

    public void setCmptypeId(Integer cmptypeId) {
        this.cmptypeId = cmptypeId;
    }

    public String getCmpContent() {
        return cmpContent;
    }

    public void setCmpContent(String cmpContent) {
        this.cmpContent = cmpContent == null ? null : cmpContent.trim();
    }

    public String getCmpImg() {
        return cmpImg;
    }

    public void setCmpImg(String cmpImg) {
        this.cmpImg = cmpImg == null ? null : cmpImg.trim();
    }

    public Date getCmpData() {
        return cmpData;
    }

    public void setCmpData(Date cmpData) {
        this.cmpData = cmpData;
    }

    public Integer getCmpStatus() {
        return cmpStatus;
    }

    public void setCmpStatus(Integer cmpStatus) {
        this.cmpStatus = cmpStatus;
    }

    public String getCmpHuifu() {
        return cmpHuifu;
    }

    public void setCmpHuifu(String cmpHuifu) {
        this.cmpHuifu = cmpHuifu == null ? null : cmpHuifu.trim();
    }

    public Integer getCmpEmp() {
        return cmpEmp;
    }

    public void setCmpEmp(Integer cmpEmp) {
        this.cmpEmp = cmpEmp;
    }
}