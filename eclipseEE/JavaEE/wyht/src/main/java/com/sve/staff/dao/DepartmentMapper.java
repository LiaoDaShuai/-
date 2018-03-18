package com.sve.staff.dao;

import java.util.List;

import com.sve.staff.model.Department;


public interface DepartmentMapper {
	List<Department> selectAll();
	
    int deleteByPrimaryKey(Integer depid);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(Integer depid);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
    
    int yanzheng(String depName);
}