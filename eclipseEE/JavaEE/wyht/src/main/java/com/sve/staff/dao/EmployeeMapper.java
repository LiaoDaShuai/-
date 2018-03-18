package com.sve.staff.dao;

import java.util.List;

import com.sve.staff.model.Employee;

public interface EmployeeMapper {
	int employeeCount();//员工总数
	
	List<Employee> selectAll();
	
    int deleteByPrimaryKey(Integer empid);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Integer empid);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
    //查询部门对应的人数
    int selectDemployeecount(Integer depid);
    //查询岗位对应的人数
	int selectPostcount(Integer postid);
	//模糊查询
	List<Employee> mohu(Employee employee);
	//三级联动
	List<Employee> selectEmployee(int postid);
	//二级联动 部门->员工
	List<Employee> selectEmployeeDep(int depid);
}