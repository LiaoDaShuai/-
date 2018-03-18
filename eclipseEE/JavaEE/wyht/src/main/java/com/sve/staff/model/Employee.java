package com.sve.staff.model;

import java.util.Date;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class Employee {
    private Integer empId;

    private Integer empDepId;

    private Integer empPostId;

    private String empName;
    
    private String empPhone;
    
    private String empEmail;
    
    private String empPhoto;

    public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getEmpPhoto() {
		return empPhoto;
	}

	public void setEmpPhoto(String empPhoto) {
		this.empPhoto = empPhoto;
	}
	private Integer empCounts;

    private Date empDate;

    private String empRemark;

    private Integer empStatus;

    private String empPass;
    
    private String mohu;
    
    private String depmohu;
    //一对多     员工表对部门表
    private Department deparement;
    
    public Department getDeparement() {
		return deparement;
	}

	public void setDeparement(Department deparement) {
		this.deparement = deparement;
	}
	//一对多     员工表对岗位表
	private Post post;
	
	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public Integer getEmpDepId() {
        return empDepId;
    }

    public void setEmpDepId(Integer empDepId) {
        this.empDepId = empDepId;
    }

    public Integer getEmpPostId() {
        return empPostId;
    }

    public void setEmpPostId(Integer empPostId) {
        this.empPostId = empPostId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getEmpPhone() {
        return empPhone;
    }

    public void setEmpPhone(String empPhone) {
        this.empPhone = empPhone == null ? null : empPhone.trim();
    }

    public Integer getEmpCounts() {
        return empCounts;
    }

    public void setEmpCounts(Integer empCounts) {
        this.empCounts = empCounts;
    }

    public Date getEmpDate() {
        return empDate;
    }

    public void setEmpDate(Date empDate) {
        this.empDate = empDate;
    }

    public String getEmpRemark() {
        return empRemark;
    }

    public String getMohu() {
		return mohu;
	}

	public void setMohu(String mohu) {
		this.mohu = mohu;
	}

	public String getDepmohu() {
		return depmohu;
	}

	public void setDepmohu(String depmohu) {
		this.depmohu = depmohu;
	}

	public void setEmpRemark(String empRemark) {
        this.empRemark = empRemark == null ? null : empRemark.trim();
    }

    public Integer getEmpStatus() {
        return empStatus;
    }

    public void setEmpStatus(Integer empStatus) {
        this.empStatus = empStatus;
    }

    public String getEmpPass() {
        return empPass;
    }

    public void setEmpPass(String empPass) {
        this.empPass = empPass == null ? null : empPass.trim();
    }
}