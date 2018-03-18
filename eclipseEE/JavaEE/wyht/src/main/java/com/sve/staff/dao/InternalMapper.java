package com.sve.staff.dao;

import java.util.List;

import com.sve.staff.model.Internal;

public interface InternalMapper {
	List<Internal> selectAll(Internal internal);
	
    int deleteByPrimaryKey(Integer interId);

    int insert(Internal record);

    int insertSelective(Internal record);

    Internal selectByPrimaryKey(Integer interId);

    int updateByPrimaryKeySelective(Internal record);

    int updateByPrimaryKey(Internal record);

}