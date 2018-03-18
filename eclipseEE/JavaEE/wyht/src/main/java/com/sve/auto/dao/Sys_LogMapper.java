package com.sve.auto.dao;

import com.sve.auto.model.Sys_Log;

public interface Sys_LogMapper {
    int deleteByPrimaryKey(Integer sysId);

    int insertSelective(Sys_Log record);

    Sys_Log selectByPrimaryKey(Integer sysId);

    int updateByPrimaryKeySelective(Sys_Log record);

}