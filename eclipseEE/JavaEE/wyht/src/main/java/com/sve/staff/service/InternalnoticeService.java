package com.sve.staff.service;

import java.util.List;

import com.sve.staff.model.Internalnotice;

public interface InternalnoticeService {
	
	List<Internalnotice> selectAll(String mohu);
	
    int deleteByPrimaryKey(Integer intnotId);

    int insert(Internalnotice record);

    int insertSelective(Internalnotice record);

    Internalnotice selectByPrimaryKey(Integer intnotId);

    int updateByPrimaryKeySelective(Internalnotice record);

    int updateByPrimaryKey(Internalnotice record);
}
