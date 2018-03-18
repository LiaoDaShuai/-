package com.sve.datacenter.dao;

import java.util.List;

import com.sve.datacenter.model.District;

public interface DistrictMapper {
	//已添加的小区
	int disCount();
	
	District selectFandid(Integer disid);
	
	List<District> selectYiAll(); //用于无条件查
	
    int deleteByPrimaryKey(Integer disid);

    int insertSelective(District record);

    District selectByPrimaryKey(Integer disid);

    int updateByPrimaryKeySelective(District record);
    // 查询全部
    List<District> selectAll(District dis);
    // 修改小区状态 -->
    int update_status(District di);
    //查询小区名称是否存在 -->
    int selectdname(String dname);
}