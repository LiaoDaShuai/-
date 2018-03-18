package com.sve.toll.model;

import java.io.Serializable;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class Chargs implements Serializable{
    private Integer chargid;

    private Integer price_id;

    private String chargname;

    private Integer shouid;

    private Integer formula_id;

    private Long pricing;
    
    private Long fixedprice;

    private Integer priceunit;

    private Integer priceweek;

    private String remark;
    
    private Priceproject priceproject;

    public Priceproject getPriceproject() {
		return priceproject;
	}

	public void setPriceproject(Priceproject priceproject) {
		this.priceproject = priceproject;
	}

	public Long getFixedprice() {
		return fixedprice;
	}

	public void setFixedprice(Long fixedprice) {
		this.fixedprice = fixedprice;
	}

	public Integer getChargid() {
        return chargid;
    }

    public void setChargid(Integer chargid) {
        this.chargid = chargid;
    }


    public String getChargname() {
        return chargname;
    }

    public void setChargname(String chargname) {
        this.chargname = chargname == null ? null : chargname.trim();
    }

    public Integer getShouid() {
        return shouid;
    }

    public void setShouid(Integer shouid) {
        this.shouid = shouid;
    }

    public Integer getPrice_id() {
		return price_id;
	}

	public void setPrice_id(Integer price_id) {
		this.price_id = price_id;
	}

	public Integer getFormula_id() {
		return formula_id;
	}

	public void setFormula_id(Integer formula_id) {
		this.formula_id = formula_id;
	}

	public Long getPricing() {
        return pricing;
    }

    public void setPricing(Long pricing) {
        this.pricing = pricing;
    }

    public Integer getPriceunit() {
        return priceunit;
    }

    public void setPriceunit(Integer priceunit) {
        this.priceunit = priceunit;
    }

    public Integer getPriceweek() {
        return priceweek;
    }

    public void setPriceweek(Integer priceweek) {
        this.priceweek = priceweek ;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}