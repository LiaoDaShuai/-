package com.sve.staff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.staff.dao.InternalMapper;
import com.sve.staff.model.Internal;
import com.sve.staff.service.InternalService;

@Service  
@Transactional 
public class InternalServiceimpl implements InternalService {

	@Autowired
	private InternalMapper internalMapper;
	
	public List<Internal> selectAll(Internal internal) {
		// TODO Auto-generated method stub
		return internalMapper.selectAll(internal);
	}

	public int deleteByPrimaryKey(Integer interId) {
		// TODO Auto-generated method stub
		return internalMapper.deleteByPrimaryKey(interId);
	}

	public int insert(Internal record) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertSelective(Internal record) {
		// TODO Auto-generated method stub
		return internalMapper.insertSelective(record);
	}

	public Internal selectByPrimaryKey(Integer interId) {
		// TODO Auto-generated method stub
		return internalMapper.selectByPrimaryKey(interId);
	}

	public int updateByPrimaryKeySelective(Internal record) {
		// TODO Auto-generated method stub
		return internalMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Internal record) {
		// TODO Auto-generated method stub
		return 0;
	}

}
