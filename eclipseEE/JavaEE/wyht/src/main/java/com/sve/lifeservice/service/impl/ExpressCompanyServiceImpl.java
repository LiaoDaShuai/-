package com.sve.lifeservice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.lifeservice.dao.ExpressCompanyMapper;
import com.sve.lifeservice.model.ExpressCompany;
import com.sve.lifeservice.service.ExpressCompanyService;

@Service
@Transactional
public class ExpressCompanyServiceImpl implements ExpressCompanyService {

	@Autowired
	private ExpressCompanyMapper expressCompanyMapper;
	public ExpressCompanyMapper getExpressCompanyMapper() {
		return expressCompanyMapper;
	}

	public void setExpressCompanyMapper(ExpressCompanyMapper expressCompanyMapper) {
		this.expressCompanyMapper = expressCompanyMapper;
	}

	public int deleteByPrimaryKey(Integer expgsId) {
		return expressCompanyMapper.deleteByPrimaryKey(expgsId);
	}

	public int insertSelective(ExpressCompany record) {
		return expressCompanyMapper.insertSelective(record);
	}

	public ExpressCompany selectByPrimaryKey(Integer expgsId) {
		return expressCompanyMapper.selectByPrimaryKey(expgsId);
	}

	public int updateByPrimaryKeySelective(ExpressCompany record) {
		return expressCompanyMapper.updateByPrimaryKeySelective(record);
	}

	public List<ExpressCompany> selectA() {
		return expressCompanyMapper.selectA();
	}

	public List<ExpressCompany> selectAll(ExpressCompany keywords) {
		return expressCompanyMapper.selectAll(keywords);
	}

	public int selectECname(String expgsName) {
		return expressCompanyMapper.selectECname(expgsName);
	}

	public int delete_selectECompany(int expgsId) {
		return expressCompanyMapper.delete_selectECompany(expgsId);
	}

	public List<ExpressCompany> selectECAll() {
		return expressCompanyMapper.selectECAll();
	}

	public int updateEC(int expgsId) {
		return expressCompanyMapper.updateEC(expgsId);
	}

	public int updateEC2(int expgsId) {
		return expressCompanyMapper.updateEC2(expgsId);
	}

}
