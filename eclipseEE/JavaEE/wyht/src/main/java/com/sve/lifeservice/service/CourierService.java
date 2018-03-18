package com.sve.lifeservice.service;

import java.util.List;

import com.sve.lifeservice.model.Courier;

public interface CourierService {
	int deleteByPrimaryKey(Integer couId);

    int insertSelective(Courier record);

    Courier selectByPrimaryKey(Integer couId);

    int updateByPrimaryKeySelective(Courier record);

    List<Courier> selectA();//单查询全部
    
    List<Courier> selectAll(Courier cer);//模糊查询全部
    
    int selectCourierName(String couName);//查询快递员名称是否已存在
    
    int selectCourierPhone(String couPhone);//查询快递员手机号是否已存在
    
    int updateBalance(Courier cer);//充值
    
    int updateBalance2(Courier cer);//花费
}
