package com.sve.datacenter.model;

import java.io.Serializable;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class District implements Serializable{
    private Integer disid;

    private String dname;

    private String prov;

    private String city;

    private String dist;

    private String address;

    private String customerp;

    private String fperson;

    private String fphone;

    private String logo;

    private String description;

    private Long zarea;

    private Long jarea;

    private Long garea;

    private Long larea;

    private Long carea;

    private Integer housecount;

    private Integer carcount;

    private Integer status;

    private String remark;

    public Integer getDisid() {
        return disid;
    }

    public void setDisid(Integer disid) {
        this.disid = disid;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname == null ? null : dname.trim();
    }

    public String getProv() {
        return prov;
    }

    public void setProv(String prov) {
        this.prov = prov == null ? null : prov.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getDist() {
        return dist;
    }

    public void setDist(String dist) {
        this.dist = dist == null ? null : dist.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getCustomerp() {
        return customerp;
    }

    public void setCustomerp(String customerp) {
        this.customerp = customerp == null ? null : customerp.trim();
    }

    public String getFperson() {
        return fperson;
    }

    public void setFperson(String fperson) {
        this.fperson = fperson == null ? null : fperson.trim();
    }

    public String getFphone() {
        return fphone;
    }

    public void setFphone(String fphone) {
        this.fphone = fphone == null ? null : fphone.trim();
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo == null ? null : logo.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Long getZarea() {
        return zarea;
    }

    public void setZarea(Long zarea) {
        this.zarea = zarea;
    }

    public Long getJarea() {
        return jarea;
    }

    public void setJarea(Long jarea) {
        this.jarea = jarea;
    }

    public Long getGarea() {
        return garea;
    }

    public void setGarea(Long garea) {
        this.garea = garea;
    }

    public Long getLarea() {
        return larea;
    }

    public void setLarea(Long larea) {
        this.larea = larea;
    }

    public Long getCarea() {
        return carea;
    }

    public void setCarea(Long carea) {
        this.carea = carea;
    }

    public Integer getHousecount() {
        return housecount;
    }

    public void setHousecount(Integer housecount) {
        this.housecount = housecount;
    }

    public Integer getCarcount() {
        return carcount;
    }

    public void setCarcount(Integer carcount) {
        this.carcount = carcount;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}