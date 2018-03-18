package com.sve.staff.dao;

import java.util.List;

import com.sve.staff.model.Cmplaints;

public interface CmplaintsMapper {
	List<Cmplaints> selectAll(Cmplaints cmp);
	
    int deleteByPrimaryKey(Integer cid);

    int insert(Cmplaints record);

    int insertSelective(Cmplaints record);

    Cmplaints selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Cmplaints record);

    int updateByPrimaryKey(Cmplaints record);
}