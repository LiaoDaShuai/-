package com.sve.toll.model;

import java.io.Serializable;
import java.util.List;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class Priceproject implements Serializable{
    private Integer priceid;

    private String pricename;

    private Integer pricetype;

    private Integer latetian;

    private Double latefee;

    private Integer noweek;

    private Integer sunhao;

    private Integer funs;

    private Long funcount;

    private String remark;

    private Integer status;
    
    private List<Chargs> chargslist;
    
    public List<Chargs> getChargslist() {
		return chargslist;
	}

	public void setChargslist(List<Chargs> chargslist) {
		this.chargslist = chargslist;
	}

	public Integer getPriceid() {
        return priceid;
    }

    public void setPriceid(Integer priceid) {
        this.priceid = priceid;
    }

    public String getPricename() {
        return pricename;
    }

    public void setPricename(String pricename) {
        this.pricename = pricename == null ? null : pricename.trim();
    }

    public Integer getPricetype() {
        return pricetype;
    }

    public void setPricetype(Integer pricetype) {
        this.pricetype = pricetype;
    }

    public Integer getLatetian() {
        return latetian;
    }

    public void setLatetian(Integer latetian) {
        this.latetian = latetian;
    }

    public Double getLatefee() {
        return latefee;
    }

    public void setLatefee(Double latefee) {
        this.latefee = latefee;
    }

    public Integer getNoweek() {
        return noweek;
    }

    public void setNoweek(Integer noweek) {
        this.noweek = noweek;
    }

    public Integer getSunhao() {
        return sunhao;
    }

    public void setSunhao(Integer sunhao) {
        this.sunhao = sunhao;
    }

    public Integer getFuns() {
        return funs;
    }

    public void setFuns(Integer funs) {
        this.funs = funs;
    }

    public Long getFuncount() {
        return funcount;
    }

    public void setFuncount(Long funcount) {
        this.funcount = funcount;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}