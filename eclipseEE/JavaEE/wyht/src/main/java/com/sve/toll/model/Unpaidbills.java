package com.sve.toll.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.directwebremoting.annotations.DataTransferObject;
import org.springframework.format.annotation.DateTimeFormat;

import com.sve.datacenter.model.District;
import com.sve.datacenter.model.HouseFan;
import com.sve.datacenter.model.HouseLou;
import com.sve.datacenter.model.Owners;

@DataTransferObject
public class Unpaidbills implements Serializable{
    private Integer unpaid;

    private static Integer unpaino=1000;
    
    private Long totalMoney;

    private Long totalZnj;

    private Long totalYc;

    private Long totalYh;

    private Long totalYjmoney;

    private Integer disid;

    private Integer oid;

    private String onames;

    private String ophone;

    private Integer status;

    private Integer means;

    private Integer isdrop;
    
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date undate;

    private String remark;
    
    private String keywords;
    
    private Owners owners;
    
    private District district;
    
    private HouseLou houselou;
    
    private HouseFan housefan;
    
    private Integer[] tolids;
    
    private Date[] datelist;
    
    private List<Toll> tolllist;

    public Integer getUnpaid() {
        return unpaid;
    }

    public void setUnpaid(Integer unpaid) {
        this.unpaid = unpaid;
    }

    public String getUnpaino() {
    	String no=""+unpaino;//Éú³É±àÂë
    	for(int i=0;i<(6-unpaino.toString().length());i++){
    		no="0"+no;
    	}
    	unpaino++;
		return no;
	}

	public Long getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(Long totalMoney) {
        this.totalMoney = totalMoney;
    }

	public Long getTotalZnj() {
        return totalZnj;
    }

    public void setTotalZnj(Long totalZnj) {
        this.totalZnj = totalZnj;
    }

    public Long getTotalYc() {
        return totalYc;
    }

    public void setTotalYc(Long totalYc) {
        this.totalYc = totalYc;
    }

    public Long getTotalYh() {
        return totalYh;
    }

    public void setTotalYh(Long totalYh) {
        this.totalYh = totalYh;
    }

    public Long getTotalYjmoney() {
        return totalYjmoney;
    }

    public void setTotalYjmoney(Long totalYjmoney) {
        this.totalYjmoney = totalYjmoney;
    }

    public Integer getDisid() {
        return disid;
    }

    public void setDisid(Integer disid) {
        this.disid = disid;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public String getOnames() {
        return onames;
    }

    public void setOnames(String onames) {
        this.onames = onames == null ? null : onames.trim();
    }

    public String getOphone() {
        return ophone;
    }

    public void setOphone(String ophone) {
        this.ophone = ophone == null ? null : ophone.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getMeans() {
        return means;
    }

    public void setMeans(Integer means) {
        this.means = means;
    }

    public Integer getIsdrop() {
        return isdrop;
    }

    public void setIsdrop(Integer isdrop) {
        this.isdrop = isdrop;
    }

    public Date getUndate() {
        return undate;
    }

    public void setUndate(Date undate) {
        this.undate = undate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Owners getOwners() {
		return owners;
	}

	public void setOwners(Owners owners) {
		this.owners = owners;
	}

	public Integer[] getTolids() {
		return tolids;
	}

	public void setTolids(Integer[] tolids) {
		this.tolids = tolids;
	}
    
	public List<Toll> getTolllist() {
		return tolllist;
	}

	public void setTolllist(List<Toll> tolllist) {
		this.tolllist = tolllist;
	}

	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public HouseFan getHousefan() {
		return housefan;
	}

	public void setHousefan(HouseFan housefan) {
		this.housefan = housefan;
	}

	public HouseLou getHouselou() {
		return houselou;
	}

	public void setHouselou(HouseLou houselou) {
		this.houselou = houselou;
	}

	public String getZfdate(){
		if(this.undate!=null&&!this.undate.equals("")){
			SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return simple.format(undate);
		}else{
			return "";
		}
	}
	
	public String getZfdates(){
		if(this.undate!=null&&!this.undate.equals("")){
			SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd");
			return simple.format(undate);
		}else{
			return "";
		}
	}
	
	public String getZfyms(){
		if(this.undate!=null&&!this.undate.equals("")){
			SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM");
			return simple.format(undate);
		}else{
			return "";
		}
	}
}