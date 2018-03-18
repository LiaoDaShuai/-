package com.sve.toll.service;

import java.util.List;

import com.sve.toll.model.Formula;

public interface FormulaService {
	
	int selectFormulaname(String formulaname);//查询公式名是否已存在
	
	int selectFormulaName(Formula formula);//排除本身查询公式名是否已存在
	
	List<Formula> selectGaoJiAll(Formula formula);
	
	List<Formula> selectAll();
	
	Formula findid(int forid);
	
	int insertfor(Formula formula);
	
	int updatefor(Formula formula);
	
	int deletefor(int forid);
}
