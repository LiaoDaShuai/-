package com.sve.staff.service;

import java.util.List;

import com.sve.staff.model.Newtype;

public interface NewtypeService {
	List<Newtype> selectNtAll();
	
	int deleteByPrimaryKey(Integer newTypeId);

	int insertSelective(Newtype record);

	Newtype selectByPrimaryKey(Integer newTypeId);

	int updateByPrimaryKeySelective(Newtype record);
}
