package com.sve.lifeservice.service;

import java.util.List;

import com.sve.lifeservice.model.ExpressCompany;

public interface ExpressCompanyService {
	int deleteByPrimaryKey(Integer expgsId);

    int insertSelective(ExpressCompany record);

    ExpressCompany selectByPrimaryKey(Integer expgsId);

    int updateByPrimaryKeySelective(ExpressCompany record);

    List<ExpressCompany> selectA();//单查询全部
    
    List<ExpressCompany> selectAll(ExpressCompany keywords);//模糊查询全部
    
    int selectECname(String expgsName);//判断快递公司名称是否已存在
    
    int delete_selectECompany(int expgsId);//根据快递公司编号查询快递员表是否有数据
    
    List<ExpressCompany> selectECAll();//查询全部快递公司(快递员人数不为0)
    
    int updateEC(int expgsId);//添加快递员的同时添加快递公司的快递员人数 
    
    int updateEC2(int expgsId);//删除快递员的同时减掉快递公司的快递员人数
}
