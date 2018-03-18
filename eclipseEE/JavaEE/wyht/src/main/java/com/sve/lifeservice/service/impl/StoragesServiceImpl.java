package com.sve.lifeservice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.lifeservice.dao.StoragesMapper;
import com.sve.lifeservice.model.Storages;

@Service
@Transactional
public class StoragesServiceImpl implements com.sve.lifeservice.service.StoragesService {

	@Autowired
	private StoragesMapper storagesMapper;
	public StoragesMapper getStoragesMapper() {
		return storagesMapper;
	}

	public void setStoragesMapper(StoragesMapper storagesMapper) {
		this.storagesMapper = storagesMapper;
	}

	public int deleteByPrimaryKey(Integer storId) {
		return storagesMapper.deleteByPrimaryKey(storId);
	}

	public int insertSelective(Storages record) {
		return storagesMapper.insertSelective(record);
	}

	public Storages selectByPrimaryKey(Integer storId) {
		return storagesMapper.selectByPrimaryKey(storId);
	}

	public int updateByPrimaryKeySelective(Storages record) {
		return storagesMapper.updateByPrimaryKeySelective(record);
	}

	public List<Storages> selectA(int storExpId) {
		return storagesMapper.selectA(storExpId);
	}

	public List<Storages> selectAll(Storages sto) {
		return storagesMapper.selectAll(sto);
	}

	public int delete_selectStorage(int expId) {
		return storagesMapper.delete_selectStorage(expId);
	}

	public int delete_Storage(int expId) {
		return storagesMapper.delete_Storage(expId);
	}

	public List<Storages> selectByPhone4(Storages sto) {
		return storagesMapper.selectByPhone4(sto);
	}

	public int updateStorage(int storId) {
		return storagesMapper.updateStorage(storId);
	}

	public int delete_selectStorage2(int couId) {
		return storagesMapper.delete_selectStorage2(couId);
	}

	public int delete_Storage2(int couId) {
		return storagesMapper.delete_Storage2(couId);
	}

	public int selectStorNum(String num) {
		return storagesMapper.selectStorNum(num);
	}

	public int storagesCount() {
		return storagesMapper.storagesCount();
	}

}
