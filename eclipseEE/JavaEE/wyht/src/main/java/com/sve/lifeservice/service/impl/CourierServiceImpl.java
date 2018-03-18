package com.sve.lifeservice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.lifeservice.dao.CourierMapper;
import com.sve.lifeservice.model.Courier;
import com.sve.lifeservice.service.CourierService;

@Service
@Transactional
public class CourierServiceImpl implements CourierService {

	@Autowired
	private CourierMapper courierMapper;
	public CourierMapper getCourierMapper() {
		return courierMapper;
	}

	public void setCourierMapper(CourierMapper courierMapper) {
		this.courierMapper = courierMapper;
	}

	public int deleteByPrimaryKey(Integer couId) {
		return courierMapper.deleteByPrimaryKey(couId);
	}

	public int insertSelective(Courier record) {
		return courierMapper.insertSelective(record);
	}

	public Courier selectByPrimaryKey(Integer couId) {
		return courierMapper.selectByPrimaryKey(couId);
	}

	public int updateByPrimaryKeySelective(Courier record) {
		return courierMapper.updateByPrimaryKeySelective(record);
	}

	public List<Courier> selectA() {
		return courierMapper.selectA();
	}

	public List<Courier> selectAll(Courier cer) {
		return courierMapper.selectAll(cer);
	}

	public int selectCourierName(String couName) {
		return courierMapper.selectCourierName(couName);
	}

	public int selectCourierPhone(String couPhone) {
		return courierMapper.selectCourierPhone(couPhone);
	}

	public int updateBalance(Courier cer) {
		return courierMapper.updateBalance(cer);
	}

	public int updateBalance2(Courier cer) {
		return courierMapper.updateBalance2(cer);
	}

}
