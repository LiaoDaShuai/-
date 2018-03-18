package com.sve.lifeservice.model;

import java.sql.Timestamp;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class ExpressCompany {
	
	private String keywords;
	
    private Integer expgsId;

    private String expgsName;

    private String expgsTjiaperson;

    private Timestamp expgsTjiadate;
    
    private Integer expgsCouriers;
    
    public Integer getExpgsCouriers() {
		return expgsCouriers;
	}

	public void setExpgsCouriers(Integer expgsCouriers) {
		this.expgsCouriers = expgsCouriers;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

    public Integer getExpgsId() {
        return expgsId;
    }

	public void setExpgsId(Integer expgsId) {
        this.expgsId = expgsId;
    }

    public String getExpgsName() {
        return expgsName;
    }

    public void setExpgsName(String expgsName) {
        this.expgsName = expgsName == null ? null : expgsName.trim();
    }

    public String getExpgsTjiaperson() {
        return expgsTjiaperson;
    }

    public void setExpgsTjiaperson(String expgsTjiaperson) {
        this.expgsTjiaperson = expgsTjiaperson == null ? null : expgsTjiaperson.trim();
    }

    public Timestamp getExpgsTjiadate() {
        return expgsTjiadate;
    }

    public void setExpgsTjiadate(Timestamp expgsTjiadate) {
        this.expgsTjiadate = expgsTjiadate;
    }
}