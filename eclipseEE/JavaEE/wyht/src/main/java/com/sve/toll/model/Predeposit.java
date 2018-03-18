package com.sve.toll.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.directwebremoting.annotations.DataTransferObject;

import com.sve.datacenter.model.District;
import com.sve.datacenter.model.Owners;

@DataTransferObject
public class Predeposit implements Serializable{
    private Integer predId;

    private Integer predDisId;

    private Integer predOid;

    private Long predMoney;

    private Integer predType;

    private Date predDate;

    private String predRemark;

    //退款额外字段-退款人名
    private String predTuiname;
    
    //退款人电话
    private String predTuiphone;
    
    private String predTuiremark;
    
    private District district;
    
    private Owners owners;

    public Integer getPredId() {
        return predId;
    }

    public void setPredId(Integer predId) {
        this.predId = predId;
    }

    public Integer getPredDisId() {
        return predDisId;
    }

    public void setPredDisId(Integer predDisId) {
        this.predDisId = predDisId;
    }

    public Integer getPredOid() {
        return predOid;
    }

    public void setPredOid(Integer predOid) {
        this.predOid = predOid;
    }

    public Long getPredMoney() {
        return predMoney;
    }

    public void setPredMoney(Long predMoney) {
        this.predMoney = predMoney;
    }

    public Integer getPredType() {
        return predType;
    }

    public void setPredType(Integer predType) {
        this.predType = predType;
    }

    public Date getPredDate() {
        return predDate;
    }

    public void setPredDate(Date predDate) {
        this.predDate = predDate;
    }

    public String getPredRemark() {
        return predRemark;
    }

    public void setPredRemark(String predRemark) {
        this.predRemark = predRemark == null ? null : predRemark.trim();
    }

	public String getPredTuiname() {
		return predTuiname;
	}

	public void setPredTuiname(String predTuiname) {
		this.predTuiname = predTuiname;
	}

	public String getPredTuiphone() {
		return predTuiphone;
	}

	public void setPredTuiphone(String predTuiphone) {
		this.predTuiphone = predTuiphone;
	}

	public String getPredTuiremark() {
		return predTuiremark;
	}

	public void setPredTuiremark(String predTuiremark) {
		this.predTuiremark = predTuiremark;
	}

	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public Owners getOwners() {
		return owners;
	}

	public void setOwners(Owners owners) {
		this.owners = owners;
	}
    public String getDates(){
    	if(this.predDate!=null){
    		SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    		return simple.format(this.predDate);
    	}
    	return "";
    }
}