package com.sve.staff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.staff.dao.EmployeeMapper;
import com.sve.staff.model.Employee;
import com.sve.staff.service.EmployeeService;

@Service  
@Transactional 
public class EmployeeServiceimpl implements EmployeeService
{
	  
    @Autowired
	private EmployeeMapper employeeMapper;
	
	public int employeeCount() {
		return employeeMapper.employeeCount();
	}

	public List<Employee> selectAll() {
		return employeeMapper.selectAll();
	}

	public int deleteByPrimaryKey(Integer empid) {
		return employeeMapper.deleteByPrimaryKey(empid);
	}

	public int insert(Employee record) {
		return employeeMapper.insert(record);
	}

	public int insertSelective(Employee record) {
		return employeeMapper.insertSelective(record);
	}

	public Employee selectByPrimaryKey(Integer empid) {
		return employeeMapper.selectByPrimaryKey(empid);
	}

	public int updateByPrimaryKeySelective(Employee record) {
		return employeeMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Employee record) {
		return employeeMapper.updateByPrimaryKeySelective(record);
	}

	public int selectDemployeecount(Integer depid) {
		return employeeMapper.selectDemployeecount(depid);
	}

	public int selectPostcount(Integer postid) {
		return employeeMapper.selectPostcount(postid);
	}

	public List<Employee> mohu(Employee employee) {
		return employeeMapper.mohu(employee);
	}

	public List<Employee> selectEmployee(int postid) {
		return employeeMapper.selectEmployee(postid);
	}

	public List<Employee> selectEmployeeDep(int depid) {
		return employeeMapper.selectEmployeeDep(depid);
	}

	
	
}
