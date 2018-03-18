package com.sve.lifeservice.dao;

import java.util.List;

import com.sve.lifeservice.model.Express;

public interface ExpressMapper {
    int deleteByPrimaryKey(Integer expId);

    int insertSelective(Express record);

    Express selectByPrimaryKey(Integer expId);

    int updateByPrimaryKeySelective(Express record);

    List<Express> selectA();//单查询全部
    
    List<Express> selectAll(Express ex);//模糊查询全部
    
    int selectExpAddress(String address);//查询取件点地址是否已存在
    
    int selectExpServicePhone(String phone);//查询服务电话是否已存在
    
}