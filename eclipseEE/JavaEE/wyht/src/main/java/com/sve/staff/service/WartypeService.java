package com.sve.staff.service;

import java.util.List;

import com.sve.staff.dao.WartypeMapper;
import com.sve.staff.model.Wartype;

public interface WartypeService {
	List<Wartype> selectAll();
	
    int deleteByPrimaryKey(Integer wartypeId);

    int insertSelective(Wartype record);

    Wartype selectByPrimaryKey(Integer wartypeId);

    int updateByPrimaryKeySelective(Wartype record);

}