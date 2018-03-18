package com.sve.staff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.staff.dao.CmptypeMapper;
import com.sve.staff.model.Cmptype;
import com.sve.staff.service.CmptypeService;

@Service
@Transactional
public class CmptypeServiceimpl implements CmptypeService {

	@Autowired
	private CmptypeMapper cmptypeMapper;
	
	public List<Cmptype> selectAll() {
		// TODO Auto-generated method stub
		return cmptypeMapper.selectAll();
	}

	public int deleteByPrimaryKey(Integer cmptypeId) {
		// TODO Auto-generated method stub
		return cmptypeMapper.deleteByPrimaryKey(cmptypeId);
	}

	public int insert(Cmptype record) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertSelective(Cmptype record) {
		// TODO Auto-generated method stub
		return cmptypeMapper.insertSelective(record);
	}

	public Cmptype selectByPrimaryKey(Integer cmptypeId) {
		// TODO Auto-generated method stub
		return cmptypeMapper.selectByPrimaryKey(cmptypeId);
	}

	public int updateByPrimaryKeySelective(Cmptype record) {
		// TODO Auto-generated method stub
		return cmptypeMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Cmptype record) {
		// TODO Auto-generated method stub
		return 0;
	}

}
