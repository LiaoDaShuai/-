package com.sve.toll.model;

import java.io.Serializable;
import java.util.List;

import org.directwebremoting.annotations.DataTransferObject;

import com.sve.datacenter.model.HouseFan;
import com.sve.datacenter.model.Owners;
import com.sve.datacenter.model.Vehicle;

@DataTransferObject
public class IndexModel implements Serializable{
	private List<Owners> os;//快速查询
	private List<HouseFan> hfs;//快速查询
	private List<Vehicle> vs;//快速查询
	private int disyjcount;//以添加小区
	private int wjtollcount;//未缴账单数
	private int yjtollcount;//已缴账单数
	private double totalsrcount;//总收入金额
	private double totalqfcount;//总欠费金额
	private int floorcount;//总楼宇数
	private int fancount;//总房屋数
	private int ownercount;//总住户数
	private int prakcount;//总车位数
	private int vehiccount;//总车辆数
	private int empcount;//总员工数
	private int anncount;//总公告条数
	private int storagecount;//快递已取数
	
	public List<Owners> getOs() {
		return os;
	}
	public List<HouseFan> getHfs() {
		return hfs;
	}
	public List<Vehicle> getVs() {
		return vs;
	}
	public void setOs(List<Owners> os) {
		this.os = os;
	}
	public void setHfs(List<HouseFan> hfs) {
		this.hfs = hfs;
	}
	public void setVs(List<Vehicle> vs) {
		this.vs = vs;
	}
	public int getDisyjcount() {
		return disyjcount;
	}
	public void setDisyjcount(int disyjcount) {
		this.disyjcount = disyjcount;
	}
	public int getWjtollcount() {
		return wjtollcount;
	}
	public void setWjtollcount(int wjtollcount) {
		this.wjtollcount = wjtollcount;
	}
	public int getYjtollcount() {
		return yjtollcount;
	}
	public void setYjtollcount(int yjtollcount) {
		this.yjtollcount = yjtollcount;
	}
	public double getTotalsrcount() {
		return totalsrcount;
	}
	public void setTotalsrcount(double totalsrcount) {
		this.totalsrcount = totalsrcount;
	}
	public double getTotalqfcount() {
		return totalqfcount;
	}
	public void setTotalqfcount(double totalqfcount) {
		this.totalqfcount = totalqfcount;
	}
	public int getFloorcount() {
		return floorcount;
	}
	public void setFloorcount(int floorcount) {
		this.floorcount = floorcount;
	}
	public int getFancount() {
		return fancount;
	}
	public void setFancount(int fancount) {
		this.fancount = fancount;
	}
	public int getOwnercount() {
		return ownercount;
	}
	public void setOwnercount(int ownercount) {
		this.ownercount = ownercount;
	}
	public int getPrakcount() {
		return prakcount;
	}
	public void setPrakcount(int prakcount) {
		this.prakcount = prakcount;
	}
	public int getVehiccount() {
		return vehiccount;
	}
	public void setVehiccount(int vehiccount) {
		this.vehiccount = vehiccount;
	}
	public int getEmpcount() {
		return empcount;
	}
	public void setEmpcount(int empcount) {
		this.empcount = empcount;
	}
	public int getAnncount() {
		return anncount;
	}
	public void setAnncount(int anncount) {
		this.anncount = anncount;
	}
	public int getStoragecount() {
		return storagecount;
	}
	public void setStoragecount(int storagecount) {
		this.storagecount = storagecount;
	}
	
}
