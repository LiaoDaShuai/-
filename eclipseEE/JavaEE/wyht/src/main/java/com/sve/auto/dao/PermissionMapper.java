package com.sve.auto.dao;

import java.util.List;

import com.sve.auto.model.Menu;
import com.sve.auto.model.Permission;

public interface PermissionMapper {
	
	List<Permission> selectAll();
	
    int deleteByPrimaryKey(Integer permId);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(Integer permId);

    int updateByPrimaryKeySelective(Permission record);

}