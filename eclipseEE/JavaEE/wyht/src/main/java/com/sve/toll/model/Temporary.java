package com.sve.toll.model;

import java.io.Serializable;

import com.sve.datacenter.model.HouseFan;
import com.sve.datacenter.model.Owners;
import com.sve.datacenter.model.ParkingSpace;
import com.sve.datacenter.model.Vehicle;

public class Temporary implements Serializable{
    private Integer temid;

    private Integer fanId;

    private Integer parkId;

    private Integer vehicleId;

    private Integer owerId;

    private String chargname;
    
    private HouseFan housefan;
    
    private ParkingSpace parkingspace;
    
    private Vehicle vehiclemanager;
    
    private Owners owners;

    public Integer getTemid() {
        return temid;
    }

    public void setTemid(Integer temid) {
        this.temid = temid;
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

    public Integer getOwerId() {
        return owerId;
    }

    public void setOwerId(Integer owerId) {
        this.owerId = owerId;
    }

    public String getChargname() {
        return chargname;
    }

    public void setChargname(String chargname) {
        this.chargname = chargname == null ? null : chargname.trim();
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

	public Owners getOwners() {
		return owners;
	}

	public void setOwners(Owners owners) {
		this.owners = owners;
	}
    
}