package com.sve.datacenter.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.datacenter.dao.Ban_chargsMapper;
import com.sve.datacenter.model.Ban_chargs;
import com.sve.datacenter.service.Ban_chargsService;

@Service
@Transactional
public class Ban_chargsServiceImpl implements Ban_chargsService{
	@Autowired
	private Ban_chargsMapper ban_chargsMapper;

	public int selectisBc(Ban_chargs bc) {
		return ban_chargsMapper.selectisBc(bc);
	}

	public List<Ban_chargs> selectBcAll() {
		return ban_chargsMapper.selectBcAll();
	}

	public List<Ban_chargs> selectBcPriceid(Ban_chargs bc) {
		return ban_chargsMapper.selectBcPriceid(bc);
	}

	public int deleteByPrimaryKey(Integer bcid) {
		return ban_chargsMapper.deleteByPrimaryKey(bcid);
	}

	public int insertSelective(Ban_chargs record) {
		return ban_chargsMapper.insertSelective(record);
	}

	public Ban_chargs selectByPrimaryKey(Integer bcid) {
		return ban_chargsMapper.selectByPrimaryKey(bcid);
	}

	public int updateByPrimaryKeySelective(Ban_chargs record) {
		return ban_chargsMapper.updateByPrimaryKeySelective(record);
	}
	
	
}
