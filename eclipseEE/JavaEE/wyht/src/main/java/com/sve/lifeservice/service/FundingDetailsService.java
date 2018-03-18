package com.sve.lifeservice.service;

import java.util.List;

import com.sve.lifeservice.model.FundingDetails;

public interface FundingDetailsService {
	int deleteByPrimaryKey(Integer fundingId);

    int insertSelective(FundingDetails record);

    FundingDetails selectByPrimaryKey(Integer fundingId);

    int updateByPrimaryKeySelective(FundingDetails record);
    
    List<FundingDetails> selectA(FundingDetails fds);//查询资金明细表
    
    int deleteFd(int fundingCouId);//根据快递员编号删除资金明细表
}
