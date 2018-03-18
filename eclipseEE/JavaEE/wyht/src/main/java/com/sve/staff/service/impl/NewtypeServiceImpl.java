package com.sve.staff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.staff.dao.NewtypeMapper;
import com.sve.staff.model.Newtype;
import com.sve.staff.service.NewtypeService;

@Service
@Transactional
public class NewtypeServiceImpl implements NewtypeService{

	@Autowired
	private NewtypeMapper newtypeMapper;

	public List<Newtype> selectNtAll() {
		return newtypeMapper.selectNtAll();
	}

	public int deleteByPrimaryKey(Integer newTypeId) {
		return newtypeMapper.deleteByPrimaryKey(newTypeId);
	}

	public int insertSelective(Newtype record) {
		return newtypeMapper.insertSelective(record);
	}

	public Newtype selectByPrimaryKey(Integer newTypeId) {
		return newtypeMapper.selectByPrimaryKey(newTypeId);
	}

	public int updateByPrimaryKeySelective(Newtype record) {
		return newtypeMapper.updateByPrimaryKeySelective(record);
	}
	
	
}
