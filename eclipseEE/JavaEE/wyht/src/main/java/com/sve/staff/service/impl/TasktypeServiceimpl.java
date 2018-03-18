package com.sve.staff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.staff.dao.TasktypeMapper;
import com.sve.staff.model.Tasktype;
import com.sve.staff.service.TasktypeService;

@Service  
@Transactional 
public class TasktypeServiceimpl implements TasktypeService
{
	@Autowired
	TasktypeMapper tasktypeMapper;
	
	public int deleteByPrimaryKey(Integer tasktypeId) {
		// TODO Auto-generated method stub
		return 0;
	}


	public int insertSelective(Tasktype record) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Tasktype selectByPrimaryKey(Integer tasktypeId) {
		// TODO Auto-generated method stub
		return tasktypeMapper.selectByPrimaryKey(tasktypeId);
	}

	public int updateByPrimaryKeySelective(Tasktype record) {
		// TODO Auto-generated method stub
		return 0;
	}


	public List<Tasktype> selectAll() {
		// TODO Auto-generated method stub
		return tasktypeMapper.selectAll();
	}

}
