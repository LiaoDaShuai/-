package com.sve.staff.service;

import java.util.List;

import com.sve.staff.model.Task;

public interface TaskService {
	
	List<Task> selectAll(Task task);
	
    int deleteByPrimaryKey(Integer taskId);

    int insert(Task record);

    int insertSelective(Task record);

    Task selectByPrimaryKey(Integer taskId);

    int updateByPrimaryKeySelective(Task record);

    int updateByPrimaryKey(Task record);
}
