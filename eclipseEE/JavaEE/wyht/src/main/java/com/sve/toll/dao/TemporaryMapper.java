package com.sve.toll.dao;

import com.sve.toll.model.Temporary;

public interface TemporaryMapper {
	Temporary selectByTem(Integer temid);
	
    int deleteByPrimaryKey(Integer temid);

    int insertSelective(Temporary record);

    Temporary selectByPrimaryKey(Integer temid);

    int updateByPrimaryKeySelective(Temporary record);

}