package com.sve.lifeservice.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.directwebremoting.annotations.DataTransferObject;
import org.springframework.format.annotation.DateTimeFormat;

import com.sve.datacenter.model.District;

@DataTransferObject
public class Announce implements Serializable{
	private Integer annId;//公告编号
	private String annAnnouncer;//发布者
	private String annName;//公告名称
	private String annContext;//公告内容
	private Integer annZhiding;//是否置顶(0默认不置顶，1位置顶)
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date annZhidingend;//置顶结束时间
	private Integer annCount;//浏览次数
	private Date annDate;//发布时间
	private List<District> district;
	public Integer getAnnId() {
		return annId;
	}
	public void setAnnId(Integer annId) {
		this.annId = annId;
	}
	public String getAnnAnnouncer() {
		return annAnnouncer;
	}
	public void setAnnAnnouncer(String annAnnouncer) {
		this.annAnnouncer = annAnnouncer;
	}
	public String getAnnName() {
		return annName;
	}
	public void setAnnName(String annName) {
		this.annName = annName;
	}
	public String getAnnContext() {
		return annContext;
	}
	public void setAnnContext(String annContext) {
		this.annContext = annContext;
	}
	public Integer getAnnZhiding() {
		return annZhiding;
	}
	public void setAnnZhiding(Integer annZhiding) {
		this.annZhiding = annZhiding;
	}
	public Date getAnnZhidingend() {
		return annZhidingend;
	}
	public void setAnnZhidingend(Date annZhidingend) {
		this.annZhidingend = annZhidingend;
	}
	public Date getAnnDate() {
		return annDate;
	}
	public void setAnnDate(Date annDate) {
		this.annDate = annDate;
	}
	
	public List<District> getDistrict() {
		return district;
	}
	public void setDistrict(List<District> district) {
		this.district = district;
	}
	
	public Integer getAnnCount() {
		return annCount;
	}
	public void setAnnCount(Integer annCount) {
		this.annCount = annCount;
	}
	public String getZhidingDate(){
		if(this.annZhidingend!=null){
			SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return simple.format(this.annZhidingend);
		}
		return "";
	}
	public String getAdddate(){
		if(this.annDate!=null){
			SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return simple.format(this.annDate);
		}
		return "";
	}
	public String getAddyear(){
		if(this.annDate!=null){
			SimpleDateFormat simple=new SimpleDateFormat("yyyy");
			return simple.format(this.annDate);
		}
		return "";
	}
}
