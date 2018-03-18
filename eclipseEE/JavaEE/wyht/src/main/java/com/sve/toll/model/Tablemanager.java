package com.sve.toll.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.directwebremoting.annotations.DataTransferObject;
import org.springframework.format.annotation.DateTimeFormat;

import com.sve.datacenter.model.District;
import com.sve.datacenter.model.HouseFan;

@DataTransferObject
public class Tablemanager implements Serializable{
    private Integer tabId;

    private Integer tabDisId;

    private Integer tabFanId;

    private Integer tabPriceId;

    private Integer tabChargId;
    
    @DateTimeFormat(pattern="yyyy-MM") 
    private Date tabMonths;

    private Integer tabStartnum;

    private Integer tabEndnum;

    private Integer tabBeilv;

    private Long tabGongtan;

    private Integer tabStatus;

    private Integer tabEquId;

    private String tabRemark;
    
    private String keywords;//¹Ø¼ü´Ê
    
    private Chargs chargs;
    
    private HouseFan housefan;
    
    private Priceproject priceproject;
    
    private District district;

	public Integer getTabId() {
		return tabId;
	}

	public void setTabId(Integer tabId) {
		this.tabId = tabId;
	}

	public Integer getTabDisId() {
		return tabDisId;
	}

	public void setTabDisId(Integer tabDisId) {
		this.tabDisId = tabDisId;
	}

	public Integer getTabFanId() {
		return tabFanId;
	}

	public void setTabFanId(Integer tabFanId) {
		this.tabFanId = tabFanId;
	}

	public Integer getTabPriceId() {
		return tabPriceId;
	}

	public void setTabPriceId(Integer tabPriceId) {
		this.tabPriceId = tabPriceId;
	}

	public Integer getTabChargId() {
		return tabChargId;
	}

	public void setTabChargId(Integer tabChargId) {
		this.tabChargId = tabChargId;
	}

	public Date getTabMonths() {
		return tabMonths;
	}

	public void setTabMonths(Date tabMonths) {
		this.tabMonths = tabMonths;
	}

	public Integer getTabStartnum() {
		return tabStartnum;
	}

	public void setTabStartnum(Integer tabStartnum) {
		this.tabStartnum = tabStartnum;
	}

	public Integer getTabEndnum() {
		return tabEndnum;
	}

	public void setTabEndnum(Integer tabEndnum) {
		this.tabEndnum = tabEndnum;
	}

	public Integer getTabBeilv() {
		return tabBeilv;
	}

	public void setTabBeilv(Integer tabBeilv) {
		this.tabBeilv = tabBeilv;
	}

	public Long getTabGongtan() {
		return tabGongtan;
	}

	public void setTabGongtan(Long tabGongtan) {
		this.tabGongtan = tabGongtan;
	}

	public Integer getTabStatus() {
		return tabStatus;
	}

	public void setTabStatus(Integer tabStatus) {
		this.tabStatus = tabStatus;
	}

	public Integer getTabEquId() {
		return tabEquId;
	}

	public void setTabEquId(Integer tabEquId) {
		this.tabEquId = tabEquId;
	}

	public String getTabRemark() {
		return tabRemark;
	}

	public void setTabRemark(String tabRemark) {
		this.tabRemark = tabRemark;
	}

	public Chargs getChargs() {
		return chargs;
	}

	public void setChargs(Chargs chargs) {
		this.chargs = chargs;
	}

	public HouseFan getHousefan() {
		return housefan;
	}

	public void setHousefan(HouseFan housefan) {
		this.housefan = housefan;
	}

	public Priceproject getPriceproject() {
		return priceproject;
	}

	public void setPriceproject(Priceproject priceproject) {
		this.priceproject = priceproject;
	}

	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}
	
    public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getDateType(){
		if(this.getTabMonths()!=null&&!this.getTabMonths().equals("")){
			SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM");
    		return simple.format(this.getTabMonths());
		}
    	return "";
	}
    
}