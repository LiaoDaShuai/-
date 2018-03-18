package com.sve.lifeservice.dao;

import java.util.List;

import com.sve.lifeservice.model.Express;

public interface ExpressMapper {
    int deleteByPrimaryKey(Integer expId);

    int insertSelective(Express record);

    Express selectByPrimaryKey(Integer expId);

    int updateByPrimaryKeySelective(Express record);

    List<Express> selectA();//����ѯȫ��
    
    List<Express> selectAll(Express ex);//ģ����ѯȫ��
    
    int selectExpAddress(String address);//��ѯȡ�����ַ�Ƿ��Ѵ���
    
    int selectExpServicePhone(String phone);//��ѯ����绰�Ƿ��Ѵ���
    
}