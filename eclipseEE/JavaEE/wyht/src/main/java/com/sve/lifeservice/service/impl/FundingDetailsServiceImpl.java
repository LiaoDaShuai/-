package com.sve.lifeservice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.lifeservice.dao.FundingDetailsMapper;
import com.sve.lifeservice.model.FundingDetails;
import com.sve.lifeservice.service.FundingDetailsService;

@Service
@Transactional
public class FundingDetailsServiceImpl implements FundingDetailsService {

	@Autowired
	private FundingDetailsMapper fundingDetailsMapper;
	public FundingDetailsMapper getFundingDetailsMapper() {
		return fundingDetailsMapper;
	}

	public void setFundingDetailsMapper(FundingDetailsMapper fundingDetailsMapper) {
		this.fundingDetailsMapper = fundingDetailsMapper;
	}

	public int deleteByPrimaryKey(Integer fundingId) {
		return fundingDetailsMapper.deleteByPrimaryKey(fundingId);
	}

	public int insertSelective(FundingDetails record) {
		return fundingDetailsMapper.insertSelective(record);
	}

	public FundingDetails selectByPrimaryKey(Integer fundingId) {
		return fundingDetailsMapper.selectByPrimaryKey(fundingId);
	}

	public int updateByPrimaryKeySelective(FundingDetails record) {
		return fundingDetailsMapper.updateByPrimaryKeySelective(record);
	}

	public List<FundingDetails> selectA(FundingDetails fds) {
		return fundingDetailsMapper.selectA(fds);
	}

	public int deleteFd(int fundingCouId) {
		return fundingDetailsMapper.deleteFd(fundingCouId);
	}

}
