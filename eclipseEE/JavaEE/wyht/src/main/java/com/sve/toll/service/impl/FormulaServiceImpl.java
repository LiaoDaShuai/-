package com.sve.toll.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.toll.dao.FormulaMapper;
import com.sve.toll.model.Formula;
import com.sve.toll.service.FormulaService;

@Service
@Transactional
public class FormulaServiceImpl implements FormulaService{

	@Autowired
	private FormulaMapper formulaMapper;
	
	public int selectFormulaname(String formulaname) {
		return formulaMapper.selectFormulaname(formulaname);
	}

	public int selectFormulaName(Formula formula) {
		return formulaMapper.selectFormulaName(formula);
	}

	public List<Formula> selectGaoJiAll(Formula formula) {
		return formulaMapper.selectGaoJiAll(formula);
	}

	public List<Formula> selectAll() {
		return formulaMapper.selectAll();
	}

	public Formula findid(int forid) {
		return formulaMapper.selectByPrimaryKey(forid);
	}

	public int insertfor(Formula formula) {
		return formulaMapper.insertSelective(formula);
	}

	public int updatefor(Formula formula) {
		return formulaMapper.updateByPrimaryKeySelective(formula);
	}

	public int deletefor(int forid) {
		return formulaMapper.deleteByPrimaryKey(forid);
	}
}
