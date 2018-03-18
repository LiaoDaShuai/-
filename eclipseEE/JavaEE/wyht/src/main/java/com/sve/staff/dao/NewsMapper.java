package com.sve.staff.dao;

import java.util.List;

import com.sve.staff.model.News;

public interface NewsMapper {
	List<News> selectNewMohu(String keyword);
	
	List<News> selectNewAll();
	
    int deleteByPrimaryKey(Integer newsId);

    int insertSelective(News record);
    
    List<News> selectNewTypeId(Integer newsTypeId);

    News selectByPrimaryKey(Integer newsId);

    int updateByPrimaryKeySelective(News record);

}