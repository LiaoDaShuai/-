package com.sve.staff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.staff.dao.WartypeMapper;
import com.sve.staff.model.Wartype;
import com.sve.staff.service.WartypeService;

@Service
@Transactional
public class WartypeServiceimpl implements WartypeService {

	@Autowired
	private WartypeMapper wartypeMapper;
	
	public List<Wartype> selectAll() {
		// TODO Auto-generated method stub
		return wartypeMapper.selectAll();
	}

	public int deleteByPrimaryKey(Integer wartypeId) {
		// TODO Auto-generated method stub
		return wartypeMapper.deleteByPrimaryKey(wartypeId);
	}

	public int insertSelective(Wartype record) {
		// TODO Auto-generated method stub
		return wartypeMapper.insertSelective(record);
	}

	public Wartype selectByPrimaryKey(Integer wartypeId) {
		// TODO Auto-generated method stub
		return wartypeMapper.selectByPrimaryKey(wartypeId);
	}

	public int updateByPrimaryKeySelective(Wartype record) {
		// TODO Auto-generated method stub
		return wartypeMapper.updateByPrimaryKeySelective(record);
	}

}
