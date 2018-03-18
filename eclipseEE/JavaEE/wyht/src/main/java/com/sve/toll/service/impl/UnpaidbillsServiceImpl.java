package com.sve.toll.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.toll.dao.UnpaidbillsMapper;
import com.sve.toll.model.Toll;
import com.sve.toll.model.Unpaidbills;
import com.sve.toll.service.UnpaidbillsService;

@Service
@Transactional
public class UnpaidbillsServiceImpl implements UnpaidbillsService{
	
	@Autowired
	private UnpaidbillsMapper unpaidbillsMapper;
	
	public List<Unpaidbills> selectTuiQt(int oid) {
		return unpaidbillsMapper.selectTuiQt(oid);
	}

	public List<Unpaidbills> selectUnpaidDisReport(Toll toll) {
		return unpaidbillsMapper.selectUnpaidDisReport(toll);
	}

	public List<Unpaidbills> selectUnpaidReport(Toll toll) {
		return unpaidbillsMapper.selectUnpaidReport(toll);
	}

	public Unpaidbills selectDayinunpaid(Integer unpaid) {
		return unpaidbillsMapper.selectDayinunpaid(unpaid);
	}

	public List<Unpaidbills> selectGaojiAll(Toll toll) {
		return unpaidbillsMapper.selectGaojiAll(toll);
	}

	public int NoupdateUnpaid(Integer unpaid) {
		return unpaidbillsMapper.NoupdateUnpaid(unpaid);
	}

	
	public List<Unpaidbills> selectDelAll(Toll toll) {
		return unpaidbillsMapper.selectDelAll(toll);
	}

	
	public Unpaidbills selectYiTuiUnpaids(Integer unpaid) {
		return unpaidbillsMapper.selectYiTuiUnpaids(unpaid);
	}

	
	public Unpaidbills selectTuiUnpaids(Integer unpaid) {
		return unpaidbillsMapper.selectTuiUnpaids(unpaid);
	}

	
	public int Upunpidstatus(Integer unpaid) {
		return unpaidbillsMapper.Upunpidstatus(unpaid);
	}

	
	public List<Unpaidbills> selectUnpidTollAll(Toll toll) {
		return unpaidbillsMapper.selectUnpidTollAll(toll);
	}

	
	public Unpaidbills selectUnpaids(Integer unpaid) {
		return unpaidbillsMapper.selectUnpaids(unpaid);
	}

	
	public int dropUnpaid(Integer unpaid) {
		return unpaidbillsMapper.dropUnpaid(unpaid);
	}

	public List<Unpaidbills> selectAll() {
		return unpaidbillsMapper.selectAll();
	}

	public int deleteByPrimaryKey(Integer unpaid) {
		return unpaidbillsMapper.deleteByPrimaryKey(unpaid);
	}

	public int insertSelective(Unpaidbills record) {
		return unpaidbillsMapper.insertSelective(record);
	}

	public Unpaidbills selectByPrimaryKey(Integer unpaid) {
		return unpaidbillsMapper.selectByPrimaryKey(unpaid);
	}

	public int updateByPrimaryKeySelective(Unpaidbills record) {
		return unpaidbillsMapper.updateByPrimaryKeySelective(record);
	}
	
}
