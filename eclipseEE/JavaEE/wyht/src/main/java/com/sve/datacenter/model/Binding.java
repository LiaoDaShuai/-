package com.sve.datacenter.model;

import java.io.Serializable;
import java.util.List;

import org.directwebremoting.annotations.DataTransferObject;

import com.sve.toll.model.Chargs;
import com.sve.toll.model.Priceproject;
import com.sve.toll.model.Toll;

@DataTransferObject
public class Binding implements Serializable{
    private Integer ownerId;

    private Integer ownercard;

    private Integer houseId;

    private Integer parkId;

    private Integer vehicleId;

    private Integer internalId;
    
    private District dis;
    
    private Owners owner;

    private HouseFan house;
    
    private ParkingSpace park;
    
    private Vehicle vehic;
    
    public Integer getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Integer ownerId) {
        this.ownerId = ownerId;
    }

    public Integer getOwnercard() {
        return ownercard;
    }

    public void setOwnercard(Integer ownercard) {
        this.ownercard = ownercard;
    }

    public Integer getHouseId() {
        return houseId;
    }

    public void setHouseId(Integer houseId) {
        this.houseId = houseId;
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

    public Integer getInternalId() {
        return internalId;
    }

    public void setInternalId(Integer internalId) {
        this.internalId = internalId;
    }

	public District getDis() {
		return dis;
	}

	public void setDis(District dis) {
		this.dis = dis;
	}

	public Owners getOwner() {
		return owner;
	}

	public void setOwner(Owners owner) {
		this.owner = owner;
	}

	public HouseFan getHouse() {
		return house;
	}

	public void setHouse(HouseFan house) {
		this.house = house;
	}

	public ParkingSpace getPark() {
		return park;
	}

	public void setPark(ParkingSpace park) {
		this.park = park;
	}

	public Vehicle getVehic() {
		return vehic;
	}

	public void setVehic(Vehicle vehic) {
		this.vehic = vehic;
	}


}