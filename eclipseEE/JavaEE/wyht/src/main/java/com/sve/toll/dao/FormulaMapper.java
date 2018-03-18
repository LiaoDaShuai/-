package com.sve.toll.dao;

import java.util.List;

import com.sve.toll.model.Formula;

public interface FormulaMapper {
	
	int selectFormulaname(String formulaname);//��ѯ��ʽ���Ƿ��Ѵ���
	
	int selectFormulaName(Formula formula);//�ų������ѯ��ʽ���Ƿ��Ѵ���
	
	List<Formula> selectGaoJiAll(Formula formula);
	 
	List<Formula> selectAll();
	
    int deleteByPrimaryKey(Integer formulaid);

    int insert(Formula record);

    int insertSelective(Formula record);

    Formula selectByPrimaryKey(Integer formulaid);

    int updateByPrimaryKeySelective(Formula record);

    int updateByPrimaryKey(Formula record);
}