package com.sve.staff.service;

import java.util.List;

import com.sve.staff.model.Cmptype;

public interface CmptypeService {
	List<Cmptype> selectAll();
	
    int deleteByPrimaryKey(Integer cmptypeId);

    int insert(Cmptype record);

    int insertSelective(Cmptype record);

    Cmptype selectByPrimaryKey(Integer cmptypeId);

    int updateByPrimaryKeySelective(Cmptype record);

    int updateByPrimaryKey(Cmptype record);
}
