package com.sve.lifeservice.model;

import java.util.Date;

import org.directwebremoting.annotations.DataTransferObject;

import com.sve.datacenter.model.District;

@DataTransferObject
public class Storages {
	
	private int company;//快递公司(模糊查询用的)
	
	private String number;//查询手机后4位用的
	
	private String keywords;
	
	private Courier cer;
	
	private Express ex;
	
	private ExpressCompany epcy;
	
	private Integer storId;

    private Integer storNum;

    private String storReceiverphone;

    private String storReceivername;

    private Integer storCouId;

    private Integer storIssize;

    private Integer storExpId;

    private Integer storIsstatus;

    private Date storQjdate;
    
    private District district;
    
    private String storRemark;
    
    public int getCompany() {
		return company;
	}

	public void setCompany(int company) {
		this.company = company;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Courier getCer() {
		return cer;
	}

	public void setCer(Courier cer) {
		this.cer = cer;
	}
	
	public Express getEx() {
		return ex;
	}

	public void setEx(Express ex) {
		this.ex = ex;
	}

	public ExpressCompany getEpcy() {
		return epcy;
	}

	public void setEpcy(ExpressCompany epcy) {
		this.epcy = epcy;
	}

    public Integer getStorId() {
        return storId;
    }

    public void setStorId(Integer storId) {
        this.storId = storId;
    }

    public Integer getStorNum() {
        return storNum;
    }

    public void setStorNum(Integer storNum) {
        this.storNum = storNum;
    }

    public String getStorReceiverphone() {
        return storReceiverphone;
    }

    public void setStorReceiverphone(String storReceiverphone) {
        this.storReceiverphone = storReceiverphone == null ? null : storReceiverphone.trim();
    }

    public String getStorReceivername() {
        return storReceivername;
    }

    public void setStorReceivername(String storReceivername) {
        this.storReceivername = storReceivername == null ? null : storReceivername.trim();
    }

    public Integer getStorCouId() {
        return storCouId;
    }

    public void setStorCouId(Integer storCouId) {
        this.storCouId = storCouId;
    }

    public Integer getStorIssize() {
        return storIssize;
    }

    public void setStorIssize(Integer storIssize) {
        this.storIssize = storIssize;
    }

    public Integer getStorExpId() {
        return storExpId;
    }

    public void setStorExpId(Integer storExpId) {
        this.storExpId = storExpId;
    }

    public Integer getStorIsstatus() {
        return storIsstatus;
    }

    public void setStorIsstatus(Integer storIsstatus) {
        this.storIsstatus = storIsstatus;
    }

    public Date getStorQjdate() {
        return storQjdate;
    }

    public void setStorQjdate(Date storQjdate) {
        this.storQjdate = storQjdate;
    }

	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public String getStorRemark() {
		return storRemark;
	}

	public void setStorRemark(String storRemark) {
		this.storRemark = storRemark;
	}
	
}