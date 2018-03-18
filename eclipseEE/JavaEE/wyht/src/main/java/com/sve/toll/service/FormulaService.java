package com.sve.toll.service;

import java.util.List;

import com.sve.toll.model.Formula;

public interface FormulaService {
	
	int selectFormulaname(String formulaname);//��ѯ��ʽ���Ƿ��Ѵ���
	
	int selectFormulaName(Formula formula);//�ų������ѯ��ʽ���Ƿ��Ѵ���
	
	List<Formula> selectGaoJiAll(Formula formula);
	
	List<Formula> selectAll();
	
	Formula findid(int forid);
	
	int insertfor(Formula formula);
	
	int updatefor(Formula formula);
	
	int deletefor(int forid);
}
