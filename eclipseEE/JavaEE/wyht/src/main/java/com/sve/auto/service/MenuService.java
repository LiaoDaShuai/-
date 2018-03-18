package com.sve.auto.service;

import java.util.List;

import com.sve.auto.model.Menu;

public interface MenuService {
	List<Menu> selectAllMenuPerm();

	List<Menu> selectMenuPermUsname(String userName);
	
	List<Menu> selectMenuPerm(String UserName);
	
    int deleteByPrimaryKey(Integer menuId);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer menuId);

    int updateByPrimaryKeySelective(Menu record);

}
