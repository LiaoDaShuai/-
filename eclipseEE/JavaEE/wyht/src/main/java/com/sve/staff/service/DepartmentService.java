package com.sve.staff.service;

import java.util.List;

import com.sve.staff.model.Department;

public interface DepartmentService {	
	List<Department> selectAll();
	
    int deleteByPrimaryKey(Integer depid);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(Integer depid);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);

    int yanzheng(String depName);
}
