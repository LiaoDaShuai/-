package com.sve.staff.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.directwebremoting.annotations.DataTransferObject;

import com.sve.datacenter.model.Owners;
@DataTransferObject
public class Message {
    private Integer mesId;

    private Integer mesOwerId;

    private String mesName;

    private String mesContext;
    
    private Integer mesStatus;

    private Date mesAdate;

    private Owners owners;
    
    private String mohu;
    
    public String getMohu() {
		return mohu;
	}

	public void setMohu(String mohu) {
		this.mohu = mohu;
	}

	public Owners getOwners() {
		return owners;
	}

	public void setOwners(Owners owners) {
		this.owners = owners;
	}

	public Integer getMesId() {
        return mesId;
    }

    public void setMesId(Integer mesId) {
        this.mesId = mesId;
    }

    public Integer getMesOwerId() {
        return mesOwerId;
    }

    public void setMesOwerId(Integer mesOwerId) {
        this.mesOwerId = mesOwerId;
    }

    public String getMesName() {
        return mesName;
    }

    public void setMesName(String mesName) {
        this.mesName = mesName == null ? null : mesName.trim();
    }

    public String getMesContext() {
        return mesContext;
    }

    public void setMesContext(String mesContext) {
        this.mesContext = mesContext == null ? null : mesContext.trim();
    }

    public Integer getMesStatus() {
		return mesStatus;
	}

	public void setMesStatus(Integer mesStatus) {
		this.mesStatus = mesStatus;
	}

	public Date getMesAdate() {
        return mesAdate;
    }

    public void setMesAdate(Date mesAdate) {
        this.mesAdate = mesAdate;
    }
    
    public String getMesAdd(){
    	SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd");
    	if(this.mesAdate!=null&&!this.mesAdate.equals("")){
    		return simple.format(this.getMesAdate());
    	}
    	return "";
    }
    public String getMesyear(){
    	SimpleDateFormat simple=new SimpleDateFormat("yyyy");
    	if(this.mesAdate!=null&&!this.mesAdate.equals("")){
    		return simple.format(this.getMesAdate());
    	}
    	return "";
    }
}