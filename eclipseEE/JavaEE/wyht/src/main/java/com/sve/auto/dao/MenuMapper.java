package com.sve.auto.dao;

import java.util.List;

import com.sve.auto.model.Menu;

public interface MenuMapper {
	List<Menu> selectAllMenuPerm();

	List<Menu> selectMenuPermUsname(String userName);
	
	List<Menu> selectMenuPerm(String userName);
	
    int deleteByPrimaryKey(Integer menuId);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer menuId);

    int updateByPrimaryKeySelective(Menu record);

}