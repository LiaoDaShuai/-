package com.sve.lifeservice.service;

import java.util.List;

import com.sve.lifeservice.model.ExpressCompany;

public interface ExpressCompanyService {
	int deleteByPrimaryKey(Integer expgsId);

    int insertSelective(ExpressCompany record);

    ExpressCompany selectByPrimaryKey(Integer expgsId);

    int updateByPrimaryKeySelective(ExpressCompany record);

    List<ExpressCompany> selectA();//����ѯȫ��
    
    List<ExpressCompany> selectAll(ExpressCompany keywords);//ģ����ѯȫ��
    
    int selectECname(String expgsName);//�жϿ�ݹ�˾�����Ƿ��Ѵ���
    
    int delete_selectECompany(int expgsId);//���ݿ�ݹ�˾��Ų�ѯ���Ա���Ƿ�������
    
    List<ExpressCompany> selectECAll();//��ѯȫ����ݹ�˾(���Ա������Ϊ0)
    
    int updateEC(int expgsId);//��ӿ��Ա��ͬʱ��ӿ�ݹ�˾�Ŀ��Ա���� 
    
    int updateEC2(int expgsId);//ɾ�����Ա��ͬʱ������ݹ�˾�Ŀ��Ա����
}
