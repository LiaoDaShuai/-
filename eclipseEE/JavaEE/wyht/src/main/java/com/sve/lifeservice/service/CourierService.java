package com.sve.lifeservice.service;

import java.util.List;

import com.sve.lifeservice.model.Courier;

public interface CourierService {
	int deleteByPrimaryKey(Integer couId);

    int insertSelective(Courier record);

    Courier selectByPrimaryKey(Integer couId);

    int updateByPrimaryKeySelective(Courier record);

    List<Courier> selectA();//����ѯȫ��
    
    List<Courier> selectAll(Courier cer);//ģ����ѯȫ��
    
    int selectCourierName(String couName);//��ѯ���Ա�����Ƿ��Ѵ���
    
    int selectCourierPhone(String couPhone);//��ѯ���Ա�ֻ����Ƿ��Ѵ���
    
    int updateBalance(Courier cer);//��ֵ
    
    int updateBalance2(Courier cer);//����
}
