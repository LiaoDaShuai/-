package com.sve.toll.service;

import com.sve.toll.model.Temporary;

public interface TemporaryService {
	Temporary selectByTem(Integer temid);
	
    int deleteByPrimaryKey(Integer temid);

    int insertSelective(Temporary record);

    Temporary selectByPrimaryKey(Integer temid);

    int updateByPrimaryKeySelective(Temporary record);

}
