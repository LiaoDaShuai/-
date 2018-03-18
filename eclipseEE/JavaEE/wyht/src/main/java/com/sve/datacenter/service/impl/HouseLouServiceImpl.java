package com.sve.datacenter.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.datacenter.dao.HouseLouMapper;
import com.sve.datacenter.model.District;
import com.sve.datacenter.model.HouseFan;
import com.sve.datacenter.model.HouseLou;
import com.sve.datacenter.model.Unit;
import com.sve.datacenter.service.HouseLouService;

@Service
@Transactional
public class HouseLouServiceImpl implements HouseLouService{
	@Autowired
	private HouseLouMapper houseLouMapper;

	
	public HouseLou selectFandid(int hlid) {
		return houseLouMapper.selectFandid(hlid);
	}

	
	public List<HouseLou> selectDisid(int disid) {
		return houseLouMapper.selectDisid(disid);
	}

	
	public int deleteByPrimaryKey(Integer hlid) {
		return houseLouMapper.deleteByPrimaryKey(hlid);
	}

	
	public int insertSelective(HouseLou record) {
		return houseLouMapper.insertSelective(record);
	}

	
	public HouseLou selectByPrimaryKey(Integer hlid) {
		return houseLouMapper.selectByPrimaryKey(hlid);
	}

	
	public int updateByPrimaryKeySelective(HouseLou record) {
		return houseLouMapper.updateByPrimaryKeySelective(record);
	}

	
	public List<HouseLou> selectA() {
		return houseLouMapper.selectA();
	}

	
	public List<HouseLou> selectAll(HouseLou hl) {
		return houseLouMapper.selectAll(hl);
	}

	
	public List<District> selectByDis(int status) {
		return houseLouMapper.selectByDis(status);
	}

	
	public List<HouseLou> selectly(int disid) {
		return houseLouMapper.selectly(disid);
	}

	
	public List<Unit> selectut(Unit ut) {
		return houseLouMapper.selectut(ut);
	}

	
	public List<HouseFan> selecthf(HouseFan hf) {
		return houseLouMapper.selecthf(hf);
	}

	
	public int delete_selecthouse(int hlid) {
		return houseLouMapper.delete_selecthouse(hlid);
	}

	
	public int delete_unit(int hlid) {
		return houseLouMapper.delete_unit(hlid);
	}

	
	public int insert_unit(Unit u) {
		return houseLouMapper.insert_unit(u);
	}

	
	public int selecthfname(String floorname) {
		return houseLouMapper.selecthfname(floorname);
	}


	public int louyuCount() {
		return houseLouMapper.louyuCount();
	}

}