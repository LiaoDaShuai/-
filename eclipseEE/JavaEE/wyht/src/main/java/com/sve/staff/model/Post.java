package com.sve.staff.model;

import java.util.List;

import org.directwebremoting.annotations.DataTransferObject;
@DataTransferObject
public class Post {
	private Integer postId;

    private Integer postDepId;

    private String postName;

    private Integer postCount;
    //一对多里面的多   员工对岗位。
    private List<Employee> Employee;
    
    public List<Employee> getEmployee() {
		return Employee;
	}

	public void setEmployee(List<Employee> employee) {
		Employee = employee;
	}

	public Integer getPostId() {
        return postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public Integer getPostDepId() {
        return postDepId;
    }

    public void setPostDepId(Integer postDepId) {
        this.postDepId = postDepId;
    }

    public String getPostName() {
        return postName;
    }

    public void setPostName(String postName) {
        this.postName = postName == null ? null : postName.trim();
    }

    public Integer getPostCount() {
        return postCount;
    }

    public void setPostCount(Integer postCount) {
        this.postCount = postCount;
    }
}