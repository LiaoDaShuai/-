package com.sve.toll.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.toll.dao.ChargsMapper;
import com.sve.toll.model.Chargs;
import com.sve.toll.service.ChargsService;

@Service
@Transactional
public class ChargsSerivceImpl implements ChargsService{
	@Autowired
	private ChargsMapper chargsMapper;
	
	public List<Chargs> selectTaskvehicid(int priceid) {
		return chargsMapper.selectTaskvehicid(priceid);
	}

	public List<Chargs> selectTaskparkid(int priceid) {
		return chargsMapper.selectTaskparkid(priceid);
	}

	public List<Chargs> selectTaskfanid(int priceid) {
		return chargsMapper.selectTaskfanid(priceid);
	}

	public List<Chargs> selectPidduiCharg(int priceid) {
		return chargsMapper.selectPidduiCharg(priceid);
	}

	public Chargs selectChargPrice(int chargid) {
		return chargsMapper.selectchargprice(chargid);
	}

	public List<Chargs> selectChargsProject(int proid) {
		return chargsMapper.selectProjectid(proid);
	}
	
	public int selectFormulaid(int formulaid) {
		return chargsMapper.selectFormulaid(formulaid);
	}

	public int InsertChargs(Chargs chargs) {
		return chargsMapper.insertSelective(chargs);
	}

	public Chargs SelectChargId(int chargid) {
		return chargsMapper.selectByPrimaryKey(chargid);
	}

	public int UpdateChargs(Chargs chargs) {
		return chargsMapper.updateByPrimaryKeySelective(chargs);
	}

	public int DeleteChargs(int chargid) {
		return chargsMapper.deleteByPrimaryKey(chargid);
	}

	public List<Chargs> selectProForid(int priceid) {
		return chargsMapper.selectProForid(priceid);
	}
	
}
