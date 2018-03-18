package com.sve.datacenter.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.directwebremoting.annotations.DataTransferObject;
@DataTransferObject
public class Owners implements Serializable{
    private Integer oid;

    private Integer disid;

    private Integer hlid;

    private Integer fanid;

    private Integer unitid;

	private District dis;
	
	private HouseLou hl;
	
	private Unit ut;
	
	private HouseFan hf;
    

    private String owername;

    private String sex;

    private String ownerphone;

    private String homephone;

    private String onum;

    private Integer status;

    private Date mdate;

    private String ophoto;

    private String qqnum;

    private String weixin;

    private String email;

    private String emergency;

    private String emergphone;

    private String nation;

    private String political;

    private String ishunyin;

    private String idcard;
    
    private Integer logincount;
    
	private String keywords;
	
	private String loginver;

    private String cardphoto;

    private String hujiaddress;

    private String temporarynum;

    private String livetype;

    private String petxinxi;

    private Integer cardid;

    private String remark;

    private String opass;

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
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

    public Integer getLogincount() {
		return logincount;
	}

	public void setLogincount(Integer logincount) {
		this.logincount = logincount;
	}

	public Integer getFanid() {
        return fanid;
    }

    public void setFanid(Integer fanid) {
        this.fanid = fanid;
    }

    public String getOwername() {
        return owername;
    }

    public void setOwername(String owername) {
        this.owername = owername == null ? null : owername.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getOwnerphone() {
        return ownerphone;
    }

    public void setOwnerphone(String ownerphone) {
        this.ownerphone = ownerphone == null ? null : ownerphone.trim();
    }

    public String getHomephone() {
        return homephone;
    }

    public void setHomephone(String homephone) {
        this.homephone = homephone == null ? null : homephone.trim();
    }

    public String getOnum() {
        return onum;
    }

    public void setOnum(String onum) {
        this.onum = onum == null ? null : onum.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getMdate() {
        return mdate;
    }

    public void setMdate(String mdate) throws Exception {
    	if(mdate!=null&&!mdate.equals("")){
    		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
            this.mdate = formatter.parse(mdate);
    	}
    }
    public String getMdates() {
    	if(mdate!=null&&!mdate.equals("")){
    		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
        	return formatter.format(mdate);
    	}
    	return "";
    }
    //获取当前时间
    public String getDate(){
    	Date date=new Date();
    	SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
        return formatter.format(date);
    }
    public String getOphoto() {
        return ophoto;
    }

    public void setOphoto(String ophoto) {
        this.ophoto = ophoto == null ? null : ophoto.trim();
    }

    public String getQqnum() {
        return qqnum;
    }

    public void setQqnum(String qqnum) {
        this.qqnum = qqnum == null ? null : qqnum.trim();
    }

    public String getWeixin() {
        return weixin;
    }

    public void setWeixin(String weixin) {
        this.weixin = weixin == null ? null : weixin.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getEmergency() {
        return emergency;
    }

    public void setEmergency(String emergency) {
        this.emergency = emergency == null ? null : emergency.trim();
    }

    public String getEmergphone() {
        return emergphone;
    }

    public void setEmergphone(String emergphone) {
        this.emergphone = emergphone == null ? null : emergphone.trim();
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation == null ? null : nation.trim();
    }

    public String getPolitical() {
        return political;
    }

    public void setPolitical(String political) {
        this.political = political == null ? null : political.trim();
    }

    public String getIshunyin() {
        return ishunyin;
    }

    public void setIshunyin(String ishunyin) {
        this.ishunyin = ishunyin == null ? null : ishunyin.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getCardphoto() {
        return cardphoto;
    }

    public void setCardphoto(String cardphoto) {
        this.cardphoto = cardphoto == null ? null : cardphoto.trim();
    }

    public String getHujiaddress() {
        return hujiaddress;
    }

    public void setHujiaddress(String hujiaddress) {
        this.hujiaddress = hujiaddress == null ? null : hujiaddress.trim();
    }

    public String getTemporarynum() {
        return temporarynum;
    }

    public void setTemporarynum(String temporarynum) {
        this.temporarynum = temporarynum == null ? null : temporarynum.trim();
    }

    public String getLivetype() {
        return livetype;
    }

    public void setLivetype(String livetype) {
        this.livetype = livetype == null ? null : livetype.trim();
    }

	public String getLoginver() {
		return loginver;
	}

	public void setLoginver(String loginver) {
		this.loginver = loginver;
	}

	public String getPetxinxi() {
        return petxinxi;
    }

    public void setPetxinxi(String petxinxi) {
        this.petxinxi = petxinxi == null ? null : petxinxi.trim();
    }

    public Integer getCardid() {
        return cardid;
    }

    public void setCardid(Integer cardid) {
        this.cardid = cardid;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public District getDis() {
		return dis;
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

	public HouseFan getHf() {
		return hf;
	}

	public void setHf(HouseFan hf) {
		this.hf = hf;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getOpass() {
        return opass;
    }

    public void setOpass(String opass) {
        this.opass = opass == null ? null : opass.trim();
    }
}