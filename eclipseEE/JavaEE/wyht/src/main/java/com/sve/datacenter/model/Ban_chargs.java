package com.sve.datacenter.model;

import java.io.Serializable;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.directwebremoting.annotations.DataTransferObject;
import org.junit.Test;
import org.springframework.format.annotation.DateTimeFormat;

import com.sve.toll.model.Chargs;
import com.sve.toll.model.Priceproject;

@DataTransferObject
public class Ban_chargs implements Serializable{
    private Integer bcid;

    private Integer priceId;

    private Integer chargid;

    private Long price;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date startdate;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date enddate;

    private String remark;

    private Integer fan_id;

    private Integer park_id;

    private Integer vehic_id;
    
    private Priceproject prices;
    
    private Chargs chargs;
    
    
	public Integer getBcid() {
        return bcid;
    }

    public void setBcid(Integer bcid) {
        this.bcid = bcid;
    }
    

	public Integer getPriceId() {
		return priceId;
	}

	public void setPriceId(Integer priceId) {
		this.priceId = priceId;
	}

	public Integer getChargid() {
        return chargid;
    }

    public void setChargid(Integer chargid) {
        this.chargid = chargid;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public Integer getFan_id() {
		return fan_id;
	}

	public void setFan_id(Integer fan_id) {
		this.fan_id = fan_id;
	}

	public Integer getPark_id() {
		return park_id;
	}

	public void setPark_id(Integer park_id) {
		this.park_id = park_id;
	}
	
	public Integer getVehic_id() {
		return vehic_id;
	}

	public void setVehic_id(Integer vehic_id) {
		this.vehic_id = vehic_id;
	}

	public Priceproject getPrices() {
		return prices;
	}

	public void setPrices(Priceproject prices) {
		this.prices = prices;
	}

	public Chargs getChargs() {
		return chargs;
	}

	public void setChargs(Chargs chargs) {
		this.chargs = chargs;
	}

	public String getSimsdate(){
		if(this.startdate!=null){
			SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd");
			return simple.format(this.startdate);
		}
		return "";
	}
	public String getSimedate(){
		if(this.enddate!=null){
			SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd");
			return simple.format(this.enddate);
		}
		return "";
	}
	@Test
	public void test() throws ParseException{
		Calendar startdate=Calendar.getInstance();
		Calendar enddate=Calendar.getInstance();
		SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd");
		Date sdate=simple.parse("2017-10-31");
		Date edate=new Date();
		startdate.setTime(sdate);
		enddate.setTime(edate);
		int endyear=enddate.get(Calendar.YEAR)-startdate.get(Calendar.YEAR);
		int result=endyear*12+enddate.get(Calendar.MONTH)-startdate.get(Calendar.MONTH);
		System.out.println((result==0?1:Math.abs(result))%3);
	}
	
}