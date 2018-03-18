package com.sve.auto.service;

import java.util.List;

import com.sve.auto.model.Permission;

public interface PermissionService {
	List<Permission> selectAll();
	
    int deleteByPrimaryKey(Integer permId);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(Integer permId);

    int updateByPrimaryKeySelective(Permission record);

}