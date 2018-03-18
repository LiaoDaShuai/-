package com.sve.auto.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.auto.dao.MenuMapper;
import com.sve.auto.model.Menu;
import com.sve.auto.service.MenuService;

@Service
@Transactional
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuMapper menuMapper;

	public List<Menu> selectAllMenuPerm() {
		return menuMapper.selectAllMenuPerm();
	}

	public List<Menu> selectMenuPermUsname(String userName) {
		return menuMapper.selectMenuPermUsname(userName);
	}

	public List<Menu> selectMenuPerm(String UserName) {
		return menuMapper.selectMenuPerm(UserName);
	}

	public int deleteByPrimaryKey(Integer menuId) {
		return menuMapper.deleteByPrimaryKey(menuId);
	}

	public int insertSelective(Menu record) {
		return menuMapper.insertSelective(record);
	}

	public Menu selectByPrimaryKey(Integer menuId) {
		return menuMapper.selectByPrimaryKey(menuId);
	}

	public int updateByPrimaryKeySelective(Menu record) {
		return menuMapper.updateByPrimaryKeySelective(record);
	}
	
}
