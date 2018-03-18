package com.sve.staff.model;

import java.util.Date;

import org.directwebremoting.annotations.DataTransferObject;
import org.springframework.format.annotation.DateTimeFormat;
@DataTransferObject
public class Task {
    private Integer taskId;

    private String taskName;

    private Integer taskTapeTid;

    private Integer taskFrequency;

    private Integer taskWcount;

    private Integer taskCompleted;

    private Integer taskDepId;

    private Integer taskEmpId;

    private Integer taskIspublic;

    private Integer taskStatus;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date taskStartdate;

    private Date taskEnddate;

    private String reskRemark;

    private Tasktype taskType;
    
    private Department department;
    
    private Employee employee;
    //用来模糊查询
    private Task taskMohu;
    
    public Task getTaskMohu() {
		return taskMohu;
	}

	public void setTaskMohu(Task taskMohu) {
		this.taskMohu = taskMohu;
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

	public Tasktype getTaskType() {
		return taskType;
	}

	public void setTaskType(Tasktype taskType) {
		this.taskType = taskType;
	}

	public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName == null ? null : taskName.trim();
    }

    public Integer getTaskTapeTid() {
        return taskTapeTid;
    }

    public void setTaskTapeTid(Integer taskTapeTid) {
        this.taskTapeTid = taskTapeTid;
    }

    public Integer getTaskFrequency() {
        return taskFrequency;
    }

    public void setTaskFrequency(Integer taskFrequency) {
        this.taskFrequency = taskFrequency;
    }

    public Integer getTaskWcount() {
        return taskWcount;
    }

    public void setTaskWcount(Integer taskWcount) {
        this.taskWcount = taskWcount;
    }

    public Integer getTaskCompleted() {
        return taskCompleted;
    }

    public void setTaskCompleted(Integer taskCompleted) {
        this.taskCompleted = taskCompleted;
    }

    public Integer getTaskDepId() {
        return taskDepId;
    }

    public void setTaskDepId(Integer taskDepId) {
        this.taskDepId = taskDepId;
    }

    public Integer getTaskEmpId() {
        return taskEmpId;
    }

    public void setTaskEmpId(Integer taskEmpId) {
        this.taskEmpId = taskEmpId;
    }

    public Integer getTaskIspublic() {
        return taskIspublic;
    }

    public void setTaskIspublic(Integer taskIspublic) {
        this.taskIspublic = taskIspublic;
    }

    public Integer getTaskStatus() {
        return taskStatus;
    }

    public void setTaskStatus(Integer taskStatus) {
        this.taskStatus = taskStatus;
    }

    public Date getTaskStartdate() {
        return taskStartdate;
    }

    public void setTaskStartdate(Date taskStartdate) {
        this.taskStartdate = taskStartdate;
    }

    public Date getTaskEnddate() {
        return taskEnddate;
    }

    public void setTaskEnddate(Date taskEnddate) {
        this.taskEnddate = taskEnddate;
    }

    public String getReskRemark() {
        return reskRemark;
    }

    public void setReskRemark(String reskRemark) {
        this.reskRemark = reskRemark == null ? null : reskRemark.trim();
    }
}