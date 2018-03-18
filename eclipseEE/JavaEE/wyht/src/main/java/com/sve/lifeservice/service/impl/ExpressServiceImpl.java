package com.sve.lifeservice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.lifeservice.dao.ExpressMapper;
import com.sve.lifeservice.model.Express;
import com.sve.lifeservice.service.ExpressService;

@Service
@Transactional
public class ExpressServiceImpl implements ExpressService {

	@Autowired
	private ExpressMapper expressMapper;
	
	public ExpressMapper getExpressMapper() {
		return expressMapper;
	}

	public void setExpressMapper(ExpressMapper expressMapper) {
		this.expressMapper = expressMapper;
	}

	public int deleteByPrimaryKey(Integer expId) {
		return expressMapper.deleteByPrimaryKey(expId);
	}

	public int insertSelective(Express record) {
		return expressMapper.insertSelective(record);
	}

	public Express selectByPrimaryKey(Integer expId) {
		return expressMapper.selectByPrimaryKey(expId);
	}

	public int updateByPrimaryKeySelective(Express record) {
		return expressMapper.updateByPrimaryKeySelective(record);
	}

	public List<Express> selectA() {
		return expressMapper.selectA();
	}

	public List<Express> selectAll(Express ex) {
		return expressMapper.selectAll(ex);
	}

	public int selectExpAddress(String address) {
		return expressMapper.selectExpAddress(address);
	}

	public int selectExpServicePhone(String phone) {
		return expressMapper.selectExpServicePhone(phone);
	}

}
