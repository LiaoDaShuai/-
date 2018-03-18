package com.sve.lifeservice.model;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class FundingDetails {
	private int keywords;
	
	private Courier cer;
	
    private Integer fundingId;

    private Integer fundingCouId;

    private Double fundingPrice;

    private String fundingRemark;

    public int getKeywords() {
		return keywords;
	}

	public void setKeywords(int keywords) {
		this.keywords = keywords;
	}
    
    public Courier getCer() {
		return cer;
	}

	
	public void setCer(Courier cer) {
		this.cer = cer;
	}
    
    public Integer getFundingId() {
        return fundingId;
    }

	public void setFundingId(Integer fundingId) {
        this.fundingId = fundingId;
    }

    public Integer getFundingCouId() {
        return fundingCouId;
    }

    public void setFundingCouId(Integer fundingCouId) {
        this.fundingCouId = fundingCouId;
    }

    public Double getFundingPrice() {
        return fundingPrice;
    }

    public void setFundingPrice(Double fundingPrice) {
        this.fundingPrice = fundingPrice;
    }

    public String getFundingRemark() {
        return fundingRemark;
    }

    public void setFundingRemark(String fundingRemark) {
        this.fundingRemark = fundingRemark == null ? null : fundingRemark.trim();
    }
}