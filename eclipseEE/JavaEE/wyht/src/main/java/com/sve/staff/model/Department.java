package com.sve.staff.model;

import java.util.List;

import org.directwebremoting.annotations.DataTransferObject;
@DataTransferObject
public class Department {
    private Integer depId;

    private String depName;

    private Integer depCount;

    private Integer depEmpCount;
    //一对多 多的一方。
    private List<Employee> employee;
    
    //一对多 部门对职位 一的一方
    private Post post;
    
	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public List<Employee> getEmployee() {
		return employee;
	}

	public void setEmployee(List<Employee> employee) {
		this.employee = employee;
	}

	public Integer getDepId() {
        return depId;
    }

    public void setDepId(Integer depId) {
        this.depId = depId;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName == null ? null : depName.trim();
    }

    public Integer getDepCount() {
        return depCount;
    }

    public void setDepCount(Integer depCount) {
        this.depCount = depCount;
    }

    public Integer getDepEmpCount() {
        return depEmpCount;
    }

    public void setDepEmpCount(Integer depEmpCount) {
        this.depEmpCount = depEmpCount;
    }
}