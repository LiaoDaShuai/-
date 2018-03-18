package com.sve.staff.service;

import java.util.List;

import com.sve.staff.model.Tasktype;

public interface TasktypeService {
		List<Tasktype> selectAll();
	 	
		int deleteByPrimaryKey(Integer tasktypeId);

	    int insertSelective(Tasktype record);

	    Tasktype selectByPrimaryKey(Integer tasktypeId);

	    int updateByPrimaryKeySelective(Tasktype record);

}
