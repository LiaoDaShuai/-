package com.sve.toll.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.toll.dao.TollMapper;
import com.sve.toll.model.Toll;
import com.sve.toll.service.TollService;

@Service
@Transactional
public class TollServiceImpl implements TollService{

	@Autowired
	private TollMapper tollMapper;
	
	public List<Toll> selectShouyin(String keyword) {
		return tollMapper.selectShouyin(keyword);
	}

	public List<Toll> selectReprotPrice(int disid, int ztype) {
		return tollMapper.selectReprotPrice(disid, ztype);
	}

	public List<Toll> TollDisReportAll() {
		return tollMapper.TollDisReportAll();
	}

	public List<Toll> TollDisIdReportAll(int disid) {
		return tollMapper.TollDisIdReportAll(disid);
	}

	public int updateFPVandOwer(Toll toll) {
		return tollMapper.updateFPVandOwer(toll);
	}

	public List<Toll> selectWeiGaoAll(Toll toll) {
		return  tollMapper.selectWeiGaoAll(toll);
	}

	public Toll tollQFSumAndCount() {
		return tollMapper.tollQFSumAndCount();
	}

	
	public Toll tollSRSumAndCount() {
		return tollMapper.tollSRSumAndCount();
	}

	
	public Toll tollTFSumAndCount() {
		return tollMapper.tollTFSumAndCount();
	}

	
	public int tollupstatus(Integer tollid) {
		return tollMapper.tollupstatus(tollid);
	}

	
	public List<Toll> tollhistoryOid(Integer oid) {
		return tollMapper.tollhistoryOid(oid);
	}

	
	public List<Toll> tollhistoryfanid(Integer fanid) {
		return tollMapper.tollhistoryfanid(fanid);
	}

	
	public List<Toll> tollhistoryparkid(Integer parkid) {
		return tollMapper.tollhistoryparkid(parkid);
	}

	
	public List<Toll> tollhistoryvehicid(Integer vehicid) {
		return tollMapper.tollhistoryvehicid(vehicid);
	}

	public List<Toll> selectTollfanid(Integer fanid) {
		return tollMapper.selectTollfanid(fanid);
	}

	public List<Toll> selectYijiaoid(Integer unpaid) {
		return tollMapper.selectYijiaoid(unpaid);
	}

	public List<Toll> selectTollparkid(Integer parkid) {
		return tollMapper.selectTollparkid(parkid);
	}

	public List<Toll> selectTollvehicid(Integer vehicid) {
		return tollMapper.selectTollvehicid(vehicid);
	}

	public List<Toll> selectTollowerid(Integer owerid) {
		return tollMapper.selectTollowerid(owerid);
	}

	public Toll selectWeiTollid(int tollid) {
		return tollMapper.selectWeiTollid(tollid);
	}

	public List<Toll> selectYiAll() {
		return tollMapper.selectYiAll();
	}

	public int deleteByPrimaryKey(Integer tollid) {
		return tollMapper.deleteByPrimaryKey(tollid);
	}

	public int insertSelective(Toll record) {
		return tollMapper.insertSelective(record);
	}

	public int updateTollStatus(int uanpaid, int tollid) {
		return tollMapper.updateTollStatus(uanpaid, tollid);
	}

	public Toll selectByPrimaryKey(Integer tollid) {
		return tollMapper.selectByPrimaryKey(tollid);
	}

	public int updateByPrimaryKeySelective(Toll record) {
		return tollMapper.updateByPrimaryKeySelective(record);
	}

}
