package com.sve.toll.dao;

import java.util.List;

import com.sve.toll.model.Formula;

public interface FormulaMapper {
	
	int selectFormulaname(String formulaname);//查询公式名是否已存在
	
	int selectFormulaName(Formula formula);//排除本身查询公式名是否已存在
	
	List<Formula> selectGaoJiAll(Formula formula);
	 
	List<Formula> selectAll();
	
    int deleteByPrimaryKey(Integer formulaid);

    int insert(Formula record);

    int insertSelective(Formula record);

    Formula selectByPrimaryKey(Integer formulaid);

    int updateByPrimaryKeySelective(Formula record);

    int updateByPrimaryKey(Formula record);
}