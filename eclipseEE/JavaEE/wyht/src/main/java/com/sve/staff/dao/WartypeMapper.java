package com.sve.staff.dao;

import java.util.List;

import com.sve.staff.model.Wartype;

public interface WartypeMapper {
	List<Wartype> selectAll();
	
    int deleteByPrimaryKey(Integer wartypeId);

    int insert(Wartype record);

    int insertSelective(Wartype record);

    Wartype selectByPrimaryKey(Integer wartypeId);

    int updateByPrimaryKeySelective(Wartype record);

    int updateByPrimaryKey(Wartype record);
}