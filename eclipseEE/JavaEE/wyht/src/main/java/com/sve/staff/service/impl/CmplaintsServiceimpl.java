package com.sve.staff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.staff.dao.CmplaintsMapper;
import com.sve.staff.model.Cmplaints;
import com.sve.staff.service.CmplaintsService;

@Service
@Transactional
public class CmplaintsServiceimpl implements CmplaintsService {

	@Autowired
	private CmplaintsMapper cmplaintsMapper;
	
	public List<Cmplaints> selectAll(Cmplaints cmp) {
		// TODO Auto-generated method stub
		return cmplaintsMapper.selectAll(cmp);
	}

	public int deleteByPrimaryKey(Integer cid) {
		// TODO Auto-generated method stub
		return cmplaintsMapper.deleteByPrimaryKey(cid);
	}

	public int insert(Cmplaints record) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertSelective(Cmplaints record) {
		// TODO Auto-generated method stub
		return cmplaintsMapper.insertSelective(record);
	}

	public Cmplaints selectByPrimaryKey(Integer cid) {
		// TODO Auto-generated method stub
		return cmplaintsMapper.selectByPrimaryKey(cid);
	}

	public int updateByPrimaryKeySelective(Cmplaints record) {
		// TODO Auto-generated method stub
		return cmplaintsMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Cmplaints record) {
		// TODO Auto-generated method stub
		return 0;
	}

}
