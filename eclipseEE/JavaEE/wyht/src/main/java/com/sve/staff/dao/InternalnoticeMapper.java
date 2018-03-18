package com.sve.staff.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sve.staff.model.Internalnotice;

public interface InternalnoticeMapper {
		List<Internalnotice> selectAll(@Param("mohu") String mohu);
	
	    int deleteByPrimaryKey(Integer intnotId);

	    int insert(Internalnotice record);

	    int insertSelective(Internalnotice record);

	    Internalnotice selectByPrimaryKey(Integer intnotId);

	    int updateByPrimaryKeySelective(Internalnotice record);

	    int updateByPrimaryKey(Internalnotice record);
}