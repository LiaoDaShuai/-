package com.sve.staff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.staff.dao.TaskMapper;
import com.sve.staff.model.Task;
import com.sve.staff.service.TaskService;

@Service  
@Transactional  
public class TaskServiceimpl implements TaskService 
{
	@Autowired
	TaskMapper taskMapper;
	
	public List<Task> selectAll(Task task) {
		// TODO Auto-generated method stub
		return taskMapper.selectAll(task);
	}

	public int deleteByPrimaryKey(Integer taskId) {
		// TODO Auto-generated method stub
		return taskMapper.deleteByPrimaryKey(taskId);
	}

	public int insert(Task record) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertSelective(Task record) {
		// TODO Auto-generated method stub
		return taskMapper.insertSelective(record);
	}

	public Task selectByPrimaryKey(Integer taskId) {
		// TODO Auto-generated method stub
		return taskMapper.selectByPrimaryKey(taskId);
	}

	public int updateByPrimaryKeySelective(Task record) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateByPrimaryKey(Task record) {
		// TODO Auto-generated method stub
		return 0;
	}

}
