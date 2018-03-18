package com.sve.lifeservice.service;

import com.sve.lifeservice.model.AnnDis;

public interface AnnDisService {
	int insert(AnnDis record);

	int insertSelective(AnnDis record);

	int deldis(AnnDis annDis);
}
