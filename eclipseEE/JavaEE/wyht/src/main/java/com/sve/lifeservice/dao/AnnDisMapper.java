package com.sve.lifeservice.dao;

import com.sve.lifeservice.model.AnnDis;

public interface AnnDisMapper {
    int insert(AnnDis record);

    int insertSelective(AnnDis record);
    
    int deldis(AnnDis annDis);
}