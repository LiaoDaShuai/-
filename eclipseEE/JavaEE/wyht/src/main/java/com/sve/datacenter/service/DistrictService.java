package com.sve.datacenter.service;

import java.util.List;

import com.sve.datacenter.model.District;

public interface DistrictService {
	//已添加的小区
	int disCount();
	
	District selectFandid(Integer disid);
	
	List<District> selectYiAll(); //用于无条件查
	
    int deleteByPrimaryKey(Integer disid);

    int insertSelective(District record);

    District selectByPrimaryKey(Integer disid);

    int updateByPrimaryKeySelective(District record);

    List<District> selectAll(District dis);
    
    int update_status(District di);
    
    int selectdname(String dname);
}
