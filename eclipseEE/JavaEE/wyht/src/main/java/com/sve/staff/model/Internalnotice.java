package com.sve.staff.model;

import java.util.Date;

import org.directwebremoting.annotations.DataTransferObject;
@DataTransferObject
public class Internalnotice {
	 	private Integer intnotId;

	    private Integer intnotEmpId;

	    private String intnotName;

	    private String intnotContext;

	    private Date intnotDate;
	    
	    private String mohu;
	    
	    private Employee employee;
	    
	    private Department department;
	    
	    public Department getDepartment() {
			return department;
		}

		public void setDepartment(Department department) {
			this.department = department;
		}

		public Integer getIntnotId() {
	        return intnotId;
	    }

	    public void setIntnotId(Integer intnotId) {
	        this.intnotId = intnotId;
	    }

	    public Integer getIntnotEmpId() {
	        return intnotEmpId;
	    }

	    public void setIntnotEmpId(Integer intnotEmpId) {
	        this.intnotEmpId = intnotEmpId;
	    }

	    public String getIntnotName() {
	        return intnotName;
	    }

	    public void setIntnotName(String intnotName) {
	        this.intnotName = intnotName == null ? null : intnotName.trim();
	    }

	    public String getIntnotContext() {
	        return intnotContext;
	    }

	    public void setIntnotContext(String intnotContext) {
	        this.intnotContext = intnotContext == null ? null : intnotContext.trim();
	    }

	    public Date getIntnotDate() {
	        return intnotDate;
	    }

	    public void setIntnotDate(Date intnotDate) {
	        this.intnotDate = intnotDate;
	    }

	    public String getMohu() {
			return mohu;
		}

		public void setMohu(String mohu) {
			this.mohu = mohu;
		}

		public Employee getEmployee() {
			return employee;
		}
	
		public void setEmployee(Employee employee) {
			this.employee = employee;
		}

	
}