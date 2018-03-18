package com.sve.auto.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class User {
    private Integer userId;

    private String userName;

    private String userPass;

    private String userSalt;
    
    private String userEmail;
    
    private String userPhone;

    private Integer userStatus;

    private Date createAt;

    private String yzm;
    
    private Integer userLevel;
    
    private Date lastAt;
    
    private List<Permission> permlist;
    
    public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public List<Permission> getPermlist() {
		return permlist;
	}

	public void setPermlist(List<Permission> permlist) {
		this.permlist = permlist;
	}

	public String getYzm() {
		return yzm;
	}

	public void setYzm(String yzm) {
		this.yzm = yzm;
	}

	public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public Integer getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(Integer userLevel) {
		this.userLevel = userLevel;
	}

	public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass == null ? null : userPass.trim();
    }

    public String getUserSalt() {
        return userSalt;
    }

    public void setUserSalt(String userSalt) {
        this.userSalt = userSalt == null ? null : userSalt.trim();
    }
    public String getCredentialsSalt() {  
        return this.userName + this.userSalt;  
    } 
    public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Integer getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(Integer userStatus) {
        this.userStatus = userStatus;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Date getLastAt() {
        return lastAt;
    }

    public void setLastAt(Date lastAt) {
        this.lastAt = lastAt;
    }
    
    public String getCreateats(){
    	SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	if(this.createAt!=null && !this.createAt.equals("")){
    		return simple.format(createAt);
    	}
    	return "";
    }
}