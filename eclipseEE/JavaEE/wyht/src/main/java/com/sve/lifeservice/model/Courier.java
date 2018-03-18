package com.sve.lifeservice.model;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class Courier {
	
	private String keywords;
	
	private ExpressCompany epcy;
	
    private Integer couId;

    private String couName;

    private String couPhone;

    private Integer couExpgsId;

    private Double couBalance;

    private Double couCostsmall;

    private Double couCostbig;

    private String couRemark;

    public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public ExpressCompany getEpcy() {
		return epcy;
	}

	public void setEpcy(ExpressCompany epcy) {
		this.epcy = epcy;
	}
	
	public Integer getCouId() {
        return couId;
    }

	public void setCouId(Integer couId) {
        this.couId = couId;
    }

    public String getCouName() {
        return couName;
    }

    public void setCouName(String couName) {
        this.couName = couName == null ? null : couName.trim();
    }

    public String getCouPhone() {
        return couPhone;
    }

    public void setCouPhone(String couPhone) {
        this.couPhone = couPhone == null ? null : couPhone.trim();
    }

    public Integer getCouExpgsId() {
        return couExpgsId;
    }

    public void setCouExpgsId(Integer couExpgsId) {
        this.couExpgsId = couExpgsId;
    }

    public Double getCouBalance() {
        return couBalance;
    }

    public void setCouBalance(Double couBalance) {
        this.couBalance = couBalance;
    }

    public Double getCouCostsmall() {
        return couCostsmall;
    }

    public void setCouCostsmall(Double couCostsmall) {
        this.couCostsmall = couCostsmall;
    }

    public Double getCouCostbig() {
        return couCostbig;
    }

    public void setCouCostbig(Double couCostbig) {
        this.couCostbig = couCostbig;
    }

    public String getCouRemark() {
        return couRemark;
    }

    public void setCouRemark(String couRemark) {
        this.couRemark = couRemark == null ? null : couRemark.trim();
    }
}