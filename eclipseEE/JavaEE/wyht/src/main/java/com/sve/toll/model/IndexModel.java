package com.sve.toll.model;

import java.io.Serializable;
import java.util.List;

import org.directwebremoting.annotations.DataTransferObject;

import com.sve.datacenter.model.HouseFan;
import com.sve.datacenter.model.Owners;
import com.sve.datacenter.model.Vehicle;

@DataTransferObject
public class IndexModel implements Serializable{
	private List<Owners> os;//���ٲ�ѯ
	private List<HouseFan> hfs;//���ٲ�ѯ
	private List<Vehicle> vs;//���ٲ�ѯ
	private int disyjcount;//�����С��
	private int wjtollcount;//δ���˵���
	private int yjtollcount;//�ѽ��˵���
	private double totalsrcount;//��������
	private double totalqfcount;//��Ƿ�ѽ��
	private int floorcount;//��¥����
	private int fancount;//�ܷ�����
	private int ownercount;//��ס����
	private int prakcount;//�ܳ�λ��
	private int vehiccount;//�ܳ�����
	private int empcount;//��Ա����
	private int anncount;//�ܹ�������
	private int storagecount;//�����ȡ��
	
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
