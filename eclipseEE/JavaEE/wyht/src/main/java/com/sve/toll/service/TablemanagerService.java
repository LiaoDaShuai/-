package com.sve.toll.service;

import java.util.List;

import com.sve.toll.model.Tablemanager;


public interface TablemanagerService {
	List<Tablemanager> selectTabHouChargGaoji(Tablemanager tablemanager);
	
	int updateTabStatus(int tabid);
	
	List<Tablemanager> selectChargidEndnum(Tablemanager tablemanager);
	
	List<Tablemanager> selectTabHouCharg();
	
	int selectTongMonths(Tablemanager tablemanager);
	
	List<Tablemanager> selectAll();
	
	Tablemanager selectid(int tabid);
	
	int inserttab(Tablemanager tablemanager);
	
	int updatetab(Tablemanager tablemanager);
	
	int deletetab(int tabid);
}
