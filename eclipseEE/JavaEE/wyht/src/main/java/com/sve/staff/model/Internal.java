package com.sve.staff.model;

import java.util.Date;

import org.directwebremoting.annotations.DataTransferObject;
@DataTransferObject
public class Internal {
    private Integer interId;

    private String interContent;

    private Integer interDepId;

    private Integer interEmpId;

    private Date interYdate;

    private String interIntimg;

    private Integer interStatus;

    private Date interEnddate;
    
    private Department department;
   
    private Employee employee;
    
    private Internal internal;
    
    public Internal getInternal() {
		return internal;
	}

	public void setInternal(Internal internal) {
		this.internal = internal;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Integer getInterId() {
        return interId;
    }

    public void setInterId(Integer interId) {
        this.interId = interId;
    }

    public String getInterContent() {
        return interContent;
    }

    public void setInterContent(String interContent) {
        this.interContent = interContent == null ? null : interContent.trim();
    }

    public Integer getInterDepId() {
        return interDepId;
    }

    public void setInterDepId(Integer interDepId) {
        this.interDepId = interDepId;
    }

    public Integer getInterEmpId() {
        return interEmpId;
    }

    public void setInterEmpId(Integer interEmpId) {
        this.interEmpId = interEmpId;
    }

    public Date getInterYdate() {
        return interYdate;
    }

    public void setInterYdate(Date interYdate) {
        this.interYdate = interYdate;
    }

    public String getInterIntimg() {
        return interIntimg;
    }

    public void setInterIntimg(String interIntimg) {
        this.interIntimg = interIntimg == null ? null : interIntimg.trim();
    }

    public Integer getInterStatus() {
        return interStatus;
    }

    public void setInterStatus(Integer interStatus) {
        this.interStatus = interStatus;
    }

    public Date getInterEnddate() {
        return interEnddate;
    }

    public void setInterEnddate(Date interEnddate) {
        this.interEnddate = interEnddate;
    }
}