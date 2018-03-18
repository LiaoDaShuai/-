package com.sve.auto.service.impl;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.mgt.RealmSecurityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.auto.dao.PermissionMapper;
import com.sve.auto.model.Permission;
import com.sve.auto.service.PermissionService;
import com.sve.shiro.util.UserRealm;

@Service
@Transactional
public class PermissionServiceImpl implements PermissionService {
	@Autowired
	private PermissionMapper permissionMapper;

	public List<Permission> selectAll() {
		return permissionMapper.selectAll();
	}

	public int deleteByPrimaryKey(Integer permId) {
		return permissionMapper.deleteByPrimaryKey(permId);
	}

	public int insertSelective(Permission record) {
		RealmSecurityManager rsm = (RealmSecurityManager)SecurityUtils.getSecurityManager();
		UserRealm authRealm = (UserRealm)rsm.getRealms().iterator().next();
		authRealm.clearAuthz();
		return permissionMapper.insertSelective(record);
	}

	public Permission selectByPrimaryKey(Integer permId) {
		return permissionMapper.selectByPrimaryKey(permId);
	}

	public int updateByPrimaryKeySelective(Permission record) {
		return permissionMapper.updateByPrimaryKeySelective(record);
	}

}