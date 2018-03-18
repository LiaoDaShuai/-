package com.sve.lifeservice.model;

import java.sql.Time;
import java.util.Date;

import org.directwebremoting.annotations.DataTransferObject;
import org.springframework.format.annotation.DateTimeFormat;

import com.sve.datacenter.model.District;

@DataTransferObject
public class Express {
	
	private String keywords;
	
	private District dis;
	
    private Integer expId;

    private String expAddress;

    private Integer expDisid;

    private String expServicephone;

    private Integer expIsvalis;

    private Time expSdate;

    private Time expEdate;

    private Integer expIssms;

    private Integer expIsweixin;

    
    public District getDis() {
		return dis;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public void setDis(District dis) {
		this.dis = dis;
	}
	
	public Integer getExpId() {
        return expId;
    }

	public void setExpId(Integer expId) {
        this.expId = expId;
    }

    public String getExpAddress() {
        return expAddress;
    }

    public void setExpAddress(String expAddress) {
        this.expAddress = expAddress == null ? null : expAddress.trim();
    }

    public Integer getExpDisid() {
        return expDisid;
    }

    public void setExpDisid(Integer expDisid) {
        this.expDisid = expDisid;
    }

    public String getExpServicephone() {
        return expServicephone;
    }

    public void setExpServicephone(String expServicephone) {
        this.expServicephone = expServicephone == null ? null : expServicephone.trim();
    }

    public Integer getExpIsvalis() {
        return expIsvalis;
    }

    public void setExpIsvalis(Integer expIsvalis) {
        this.expIsvalis = expIsvalis;
    }

    public Date getExpSdate() {
        return expSdate;
    }

    public void setExpSdate(Time expSdate) {
        this.expSdate = expSdate;
    }

    public Date getExpEdate() {
        return expEdate;
    }

    public void setExpEdate(Time expEdate) {
        this.expEdate = expEdate;
    }

    public Integer getExpIssms() {
        return expIssms;
    }

    public void setExpIssms(Integer expIssms) {
        this.expIssms = expIssms;
    }

    public Integer getExpIsweixin() {
        return expIsweixin;
    }

    public void setExpIsweixin(Integer expIsweixin) {
        this.expIsweixin = expIsweixin;
    }
}