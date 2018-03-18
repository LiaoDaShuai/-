package com.sve.datacenter.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.directwebremoting.annotations.DataTransferObject;
import org.springframework.format.annotation.DateTimeFormat;

@DataTransferObject
public class HouseFan implements Serializable{
	
	private String keywords;
	
	private District dis;
	
	private HouseLou hl;
	
	private Unit ut;
	
    private Integer fanid;

    private Integer disid;

    private Integer hlid;

    private Integer unitid;

    private Integer louceng;

    private String hnum;

    private Double zarea;

    private Double tarea;

    private Double garea;

    private Integer utype;

    private String hchaoxiang;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date startdate;

    private Integer cyear;

    private String fujian;

    private Integer isruzhu;

    private Integer tollcount;

    private String remark;

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

	public HouseLou getHl() {
		return hl;
	}

	public void setHl(HouseLou hl) {
		this.hl = hl;
	}

	public Unit getUt() {
		return ut;
	}

	public void setUt(Unit ut) {
		this.ut = ut;
	}

	public Integer getFanid() {
        return fanid;
    }

    public void setFanid(Integer fanid) {
        this.fanid = fanid;
    }

    public Integer getDisid() {
        return disid;
    }

    public void setDisid(Integer disid) {
        this.disid = disid;
    }

    public Integer getHlid() {
        return hlid;
    }

    public void setHlid(Integer hlid) {
        this.hlid = hlid;
    }

    public Integer getUnitid() {
        return unitid;
    }

    public void setUnitid(Integer unitid) {
        this.unitid = unitid;
    }

    public Integer getLouceng() {
        return louceng;
    }

    public void setLouceng(Integer louceng) {
        this.louceng = louceng;
    }

    public String getHnum() {
        return hnum;
    }

    public void setHnum(String hnum) {
        this.hnum = hnum == null ? null : hnum.trim();
    }

    public Double getZarea() {
        return zarea;
    }

    public void setZarea(Double zarea) {
        this.zarea = zarea;
    }

    public Double getTarea() {
        return tarea;
    }

    public void setTarea(Double tarea) {
        this.tarea = tarea;
    }

    public Double getGarea() {
        return garea;
    }

    public void setGarea(Double garea) {
        this.garea = garea;
    }

    public Integer getUtype() {
        return utype;
    }

    public void setUtype(Integer utype) {
        this.utype = utype;
    }

    public String getHchaoxiang() {
        return hchaoxiang;
    }

    public void setHchaoxiang(String hchaoxiang) {
        this.hchaoxiang = hchaoxiang == null ? null : hchaoxiang.trim();
    }

    public String getStartdates(){
    	if(startdate!=null&&!startdate.equals("")){
	    	SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
	    	return formatter.format(startdate);
    	}
    	return "";
    }
    
    public Date getStartdate(){
    	return startdate;
    }

    //ÐÞ¸Ä¹ý
    public void setStartdate(Date startdate) throws Exception {
        this.startdate = startdate;
    }

    public Integer getCyear() {
        return cyear;
    }

    public void setCyear(Integer cyear) {
        this.cyear = cyear;
    }

    public String getFujian() {
        return fujian;
    }

    public void setFujian(String fujian) {
        this.fujian = fujian == null ? null : fujian.trim();
    }

    public Integer getIsruzhu() {
        return isruzhu;
    }

    public void setIsruzhu(Integer isruzhu) {
        this.isruzhu = isruzhu;
    }

    public Integer getTollcount() {
        return tollcount;
    }

    public void setTollcount(Integer tollcount) {
        this.tollcount = tollcount;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}