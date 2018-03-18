package com.sve.toll.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.toll.dao.TablemanagerMapper;
import com.sve.toll.model.Tablemanager;
import com.sve.toll.service.TablemanagerService;

@Service
@Transactional
public class TablemanagerServiceImpl implements TablemanagerService{

	@Autowired
	private TablemanagerMapper tablemanagerMapper;
	
	
	public List<Tablemanager> selectTabHouChargGaoji(Tablemanager tablemanager) {
		return tablemanagerMapper.selectTabHouChargGaoji(tablemanager);
	}

	
	public int selectTongMonths(Tablemanager tablemanager) {
		return tablemanagerMapper.selectTongMonths(tablemanager);
	}

	
	public int updateTabStatus(int tabid) {
		return tablemanagerMapper.updateTabStatus(tabid);
	}

	public List<Tablemanager> selectChargidEndnum(Tablemanager tablemanager) {
		return tablemanagerMapper.selectChargidEndnum(tablemanager);
	}

	public List<Tablemanager> selectTabHouCharg() {
		return tablemanagerMapper.selectTabHouCharg();
	}

	public List<Tablemanager> selectAll() {
		return tablemanagerMapper.selectAll();
	}

	public Tablemanager selectid(int tabid) {
		return tablemanagerMapper.selectByPrimaryKey(tabid);
	}

	public int inserttab(Tablemanager tablemanager) {
		return tablemanagerMapper.insertSelective(tablemanager);
	}

	public int updatetab(Tablemanager tablemanager) {
		return tablemanagerMapper.updateByPrimaryKeySelective(tablemanager);
	}

	public int deletetab(int tabid) {
		return tablemanagerMapper.deleteByPrimaryKey(tabid);
	}
	
}
