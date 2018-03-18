package com.sve.lifeservice.service;

import java.util.List;

import com.sve.lifeservice.model.FundingDetails;

public interface FundingDetailsService {
	int deleteByPrimaryKey(Integer fundingId);

    int insertSelective(FundingDetails record);

    FundingDetails selectByPrimaryKey(Integer fundingId);

    int updateByPrimaryKeySelective(FundingDetails record);
    
    List<FundingDetails> selectA(FundingDetails fds);//��ѯ�ʽ���ϸ��
    
    int deleteFd(int fundingCouId);//���ݿ��Ա���ɾ���ʽ���ϸ��
}
