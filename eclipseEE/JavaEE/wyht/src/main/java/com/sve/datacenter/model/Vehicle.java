package com.sve.datacenter.model;

import java.io.Serializable;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class Vehicle implements Serializable{
	
	private String keywords;
	
	private District dis;
	
	private ParkingSpace park;
	
    private Integer vehicid;

    private Integer disid;

    private Integer parkid;

    private String kanum;

    private String cname;

    private String cphone;

    private String carnum;

    private Double carpai;

    private Integer tollcount;

    private String carxing;

    private String carcolor;

    private String carqq;

    private String carweixin;

    private String caremail;

    private String homephone;

    private String carphoto;

    private String jiazhao;

    private String drivingphoto;

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

	public Integer getVehicid() {
        return vehicid;
    }

    public void setVehicid(Integer vehicid) {
        this.vehicid = vehicid;
    }

    public Integer getDisid() {
        return disid;
    }

    public void setDisid(Integer disid) {
        this.disid = disid;
    }

	public Integer getParkid() {
		return parkid;
	}

	public void setParkid(Integer parkid) {
		this.parkid = parkid;
	}

	public String getKanum() {
        return kanum;
    }

    public void setKanum(String kanum) {
        this.kanum = kanum == null ? null : kanum.trim();
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public String getCphone() {
        return cphone;
    }

    public void setCphone(String cphone) {
        this.cphone = cphone == null ? null : cphone.trim();
    }

    public String getCarnum() {
        return carnum;
    }

    public void setCarnum(String carnum) {
        this.carnum = carnum == null ? null : carnum.trim();
    }

    public Double getCarpai() {
        return carpai;
    }

    public void setCarpai(Double carpai) {
        this.carpai = carpai;
    }

    public Integer getTollcount() {
        return tollcount;
    }

    public void setTollcount(Integer tollcount) {
        this.tollcount = tollcount;
    }

    public String getCarxing() {
        return carxing;
    }

    public void setCarxing(String carxing) {
        this.carxing = carxing == null ? null : carxing.trim();
    }

    public String getCarcolor() {
        return carcolor;
    }

    public void setCarcolor(String carcolor) {
        this.carcolor = carcolor == null ? null : carcolor.trim();
    }

    public String getCarqq() {
        return carqq;
    }

    public void setCarqq(String carqq) {
        this.carqq = carqq == null ? null : carqq.trim();
    }

    public String getCarweixin() {
        return carweixin;
    }

    public void setCarweixin(String carweixin) {
        this.carweixin = carweixin == null ? null : carweixin.trim();
    }

    public String getCaremail() {
        return caremail;
    }

    public void setCaremail(String caremail) {
        this.caremail = caremail == null ? null : caremail.trim();
    }

    public String getHomephone() {
        return homephone;
    }

    public void setHomephone(String homephone) {
        this.homephone = homephone == null ? null : homephone.trim();
    }

    public String getCarphoto() {
        return carphoto;
    }

    public void setCarphoto(String carphoto) {
        this.carphoto = carphoto == null ? null : carphoto.trim();
    }

    public String getJiazhao() {
        return jiazhao;
    }

    public void setJiazhao(String jiazhao) {
        this.jiazhao = jiazhao == null ? null : jiazhao.trim();
    }

    public String getDrivingphoto() {
        return drivingphoto;
    }

    public void setDrivingphoto(String drivingphoto) {
        this.drivingphoto = drivingphoto == null ? null : drivingphoto.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public ParkingSpace getPark() {
		return park;
	}

	public void setPark(ParkingSpace park) {
		this.park = park;
	}
    
}