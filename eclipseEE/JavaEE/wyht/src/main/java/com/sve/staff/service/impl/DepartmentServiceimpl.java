package com.sve.staff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.staff.dao.DepartmentMapper;
import com.sve.staff.model.Department;
import com.sve.staff.service.DepartmentService;


@Service  
@Transactional
public class DepartmentServiceimpl implements DepartmentService
{
	@Autowired
	private DepartmentMapper departmentMapper;
	
	public List<Department> selectAll() {
		// TODO Auto-generated method stub
		return departmentMapper.selectAll();
	}

	public int deleteByPrimaryKey(Integer depid) {
		// TODO Auto-generated method stub
		return departmentMapper.deleteByPrimaryKey(depid);
	}

	public int insert(Department record) {
		// TODO Auto-generated method stub
		return departmentMapper.insert(record);
	}

	public int insertSelective(Department record) {
		// TODO Auto-generated method stub
		return departmentMapper.insertSelective(record);
	}

	public Department selectByPrimaryKey(Integer depid) {
		// TODO Auto-generated method stub
		return departmentMapper.selectByPrimaryKey(depid);
	}

	public int updateByPrimaryKeySelective(Department record) {
		// TODO Auto-generated method stub
		return departmentMapper.updateByPrimaryKey(record);
	}

	public int updateByPrimaryKey(Department record) {
		// TODO Auto-generated method stub
		return departmentMapper.updateByPrimaryKey(record);
	}

	public int yanzheng(String depName) {
		// TODO Auto-generated method stub
		return departmentMapper.yanzheng(depName);
	}

}
