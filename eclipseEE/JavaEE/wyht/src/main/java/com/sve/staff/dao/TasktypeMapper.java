package com.sve.staff.dao;

import java.util.List;

import com.sve.staff.model.Tasktype;

public interface TasktypeMapper {
	List<Tasktype> selectAll();
	
    int deleteByPrimaryKey(Integer tasktypeId);

    int insertSelective(Tasktype record);

    Tasktype selectByPrimaryKey(Integer tasktypeId);

    int updateByPrimaryKeySelective(Tasktype record);

}