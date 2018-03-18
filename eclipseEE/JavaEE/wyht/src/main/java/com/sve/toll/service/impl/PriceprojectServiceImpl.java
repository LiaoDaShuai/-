package com.sve.toll.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.toll.dao.PriceprojectMapper;
import com.sve.toll.model.Priceproject;
import com.sve.toll.service.PriceprojectService;

@Service
@Transactional
public class PriceprojectServiceImpl implements PriceprojectService{

	@Autowired
	private PriceprojectMapper priceprojectMapper;
	
	public int selectProname(Priceproject pro) {
		return priceprojectMapper.selectProname(pro);
	}
	public List<Priceproject> selectPriceZhouAll() {
		return priceprojectMapper.selectPriceZhouAll();
	}
	public List<Priceproject> selectPriceGaoAll(Priceproject priceproject) {
		return priceprojectMapper.selectPriceGaoAll(priceproject);
	}
	public int selectPrname(String pricename) {
		return priceprojectMapper.selectPrname(pricename);
	}
	public List<Priceproject> selectPriceTypeAll() {
		return priceprojectMapper.selectPriceTypeAll();
	}
	public List<Priceproject> SelectpriceAll() {
		return priceprojectMapper.selectPriceAll();
	}
	public List<Priceproject> SelectPriceChargAll() {
		return priceprojectMapper.selectPrice_ChargAll();
	}

	public Priceproject SelectPriceChargId(int pid) {
		return priceprojectMapper.selectPrice_ChargId(pid);
	}

	public Priceproject Selectpriceid(int priceid) {
		return priceprojectMapper.selectByPrimaryKey(priceid);
	}

	public int Insertprice(Priceproject price) {
		return priceprojectMapper.insertSelective(price);
	}

	public int Updateprice(Priceproject price) {
		return priceprojectMapper.updateByPrimaryKeySelective(price);
	}

	public int Deleteprice(int priceid) {
		return priceprojectMapper.deleteByPrimaryKey(priceid);
	}
}
