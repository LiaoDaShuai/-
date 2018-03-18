package com.sve.staff.service;

import java.util.List;

import com.sve.staff.model.News;

public interface NewsService {
	List<News> selectNewMohu(String keyword);
	
	List<News> selectNewAll();

	int deleteByPrimaryKey(Integer newsId);

    int insertSelective(News record);
    
    List<News> selectNewTypeId(Integer newsTypeId);

    News selectByPrimaryKey(Integer newsId);

    int updateByPrimaryKeySelective(News record);
}
