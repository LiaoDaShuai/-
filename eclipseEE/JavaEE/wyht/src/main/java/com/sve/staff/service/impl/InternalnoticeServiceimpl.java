package com.sve.staff.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.staff.dao.InternalnoticeMapper;
import com.sve.staff.model.Internalnotice;
import com.sve.staff.service.InternalnoticeService;

@Service  
@Transactional  
public class InternalnoticeServiceimpl implements InternalnoticeService {

	@Autowired
	InternalnoticeMapper internalNoticeMapper;

	public List<Internalnotice> selectAll(@Param("mohu") String mohu) {
		// TODO Auto-generated method stub
		return internalNoticeMapper.selectAll(mohu);
	}

	public int deleteByPrimaryKey(Integer intnotId) {
		// TODO Auto-generated method stub
		return internalNoticeMapper.deleteByPrimaryKey(intnotId);
	}

	public int insert(Internalnotice record) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertSelective(Internalnotice record) {
		// TODO Auto-generated method stub
		return internalNoticeMapper.insertSelective(record);
	}

	public Internalnotice selectByPrimaryKey(Integer intnotId) {
		// TODO Auto-generated method stub
		return internalNoticeMapper.selectByPrimaryKey(intnotId);
	}

	public int updateByPrimaryKeySelective(Internalnotice record) {
		// TODO Auto-generated method stub
		return internalNoticeMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Internalnotice record) {
		// TODO Auto-generated method stub
		return 0;
	}
}
