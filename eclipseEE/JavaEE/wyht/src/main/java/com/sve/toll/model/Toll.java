package com.sve.toll.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.directwebremoting.annotations.DataTransferObject;
import org.springframework.format.annotation.DateTimeFormat;

import com.sve.datacenter.model.District;
import com.sve.datacenter.model.HouseFan;
import com.sve.datacenter.model.Owners;
import com.sve.datacenter.model.ParkingSpace;
import com.sve.datacenter.model.Vehicle;

@DataTransferObject
public class Toll implements Serializable{
	private Integer tollid;

    private Integer ztype;

    private Integer disid;
    
    private static Integer unpaino=1000;

    private Integer oid;

    private Integer fanId;

    private Integer parkId;

    private Integer vehicleId;

    private Integer priceid;

    private Integer chargid;

    private double priceing;

    private Integer count;

    private double subtotal;

    private Long youfei;

    private Long zhina;

    private Long yuck;
    @DateTimeFormat(pattern="yyyy-MM-dd") 
    private Date sdate;
    @DateTimeFormat(pattern="yyyy-MM-dd") 
    private Date edate;

    private Integer bcId;

    private Integer tabId;

    private Integer temId;

    private Integer istongzhi;
    
    private Integer uanpaid;
    
    private Integer uanpaid2;

    private Integer status;

    private String remark;
    
    private Integer pricetype;
     
    private String keyword;//关键字
    
    private Integer unpaidtype;//缴费方式
    
	private Priceproject priceproject;

	private District district;

	private List<Owners> ownerlist;
	
	private Owners owner;

	private Chargs chargs;

	private HouseFan housefan;
	
	private Tablemanager tablemanager;
	
	private ParkingSpace parkingspace;
	
	private Vehicle vehiclemanager;
	
	private Temporary temporary;
	
	private Unpaidbills unpaidbills;

	public Owners getOwner() {
		return owner;
	}

	public void setOwner(Owners owner) {
		this.owner = owner;
	}

	public Integer getTollid() {
		return tollid;
	}

	public void setTollid(Integer tollid) {
		this.tollid = tollid;
	}

	public Integer getZtype() {
		return ztype;
	}

	public void setZtype(Integer ztype) {
		this.ztype = ztype;
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
	 public String getUnpaino() {
	    	String no=""+unpaino;//生成编码
	    	for(int i=0;i<(6-unpaino.toString().length());i++){
	    		no="0"+no;
	    	}
	    	unpaino++;
			return no;
	}
	public Integer getFanId() {
		return fanId;
	}

	public void setFanId(Integer fanId) {
		this.fanId = fanId;
	}

	public Integer getParkId() {
		return parkId;
	}

	public void setParkId(Integer parkId) {
		this.parkId = parkId;
	}

	public Integer getVehicleId() {
		return vehicleId;
	}

	public void setVehicleId(Integer vehicleId) {
		this.vehicleId = vehicleId;
	}

	public Integer getPriceid() {
		return priceid;
	}

	public void setPriceid(Integer priceid) {
		this.priceid = priceid;
	}

	public Integer getChargid() {
		return chargid;
	}

	public void setChargid(Integer chargid) {
		this.chargid = chargid;
	}


	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public double getPriceing() {
		return priceing;
	}

	public void setPriceing(double priceing) {
		this.priceing = priceing;
	}

	public double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}

	public Long getYoufei() {
		return youfei;
	}

	public void setYoufei(Long youfei) {
		this.youfei = youfei;
	}

	public Long getZhina() {
		return zhina;
	}

	public void setZhina(Long zhina) {
		this.zhina = zhina;
	}

	public Long getYuck() {
		return yuck;
	}

	public void setYuck(Long yuck) {
		this.yuck = yuck;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public Integer getBcId() {
		return bcId;
	}

	public void setBcId(Integer bcId) {
		this.bcId = bcId;
	}

	public Integer getTabId() {
		return tabId;
	}

	public void setTabId(Integer tabId) {
		this.tabId = tabId;
	}

	public Integer getTemId() {
		return temId;
	}

	public void setTemId(Integer temId) {
		this.temId = temId;
	}

	public Integer getIstongzhi() {
		return istongzhi;
	}

	public void setIstongzhi(Integer istongzhi) {
		this.istongzhi = istongzhi;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getUanpaid2() {
		return uanpaid2;
	}

	public void setUanpaid2(Integer uanpaid2) {
		this.uanpaid2 = uanpaid2;
	}

	public Integer getUanpaid() {
		return uanpaid;
	}

	public void setUanpaid(Integer uanpaid) {
		this.uanpaid = uanpaid;
	}


	public Integer getPricetype() {
		return pricetype;
	}

	public void setPricetype(Integer pricetype) {
		this.pricetype = pricetype;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Tablemanager getTablemanager() {
		return tablemanager;
	}

	public void setTablemanager(Tablemanager tablemanager) {
		this.tablemanager = tablemanager;
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

	public List<Owners> getOwnerlist() {
		return ownerlist;
	}

	public void setOwnerlist(List<Owners> ownerlist) {
		this.ownerlist = ownerlist;
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

	public ParkingSpace getParkingspace() {
		return parkingspace;
	}

	public void setParkingspace(ParkingSpace parkingspace) {
		this.parkingspace = parkingspace;
	}

	public Vehicle getVehiclemanager() {
		return vehiclemanager;
	}

	public void setVehiclemanager(Vehicle vehiclemanager) {
		this.vehiclemanager = vehiclemanager;
	}

	public Temporary getTemporary() {
		return temporary;
	}

	public void setTemporary(Temporary temporary) {
		this.temporary = temporary;
	}

	public Unpaidbills getUnpaidbills() {
		return unpaidbills;
	}

	public void setUnpaidbills(Unpaidbills unpaidbills) {
		this.unpaidbills = unpaidbills;
	}

	public Integer getUnpaidtype() {
		return unpaidtype;
	}

	public void setUnpaidtype(Integer unpaidtype) {
		this.unpaidtype = unpaidtype;
	}

	public String getNowdate() {
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		return simple.format(new Date());
	}

	public String getSimsdate() {
		if(this.sdate!=null){
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		return simple.format(this.sdate);
		}return "";
	}
	
	public String getSimedate() {
		if (this.edate != null) {
			SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
			return simple.format(this.edate);
		}
		return "";
	}
}