package com.sve.staff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.staff.dao.NewsMapper;
import com.sve.staff.model.News;
import com.sve.staff.service.NewsService;

@Service
@Transactional
public class NewsServiceImpl implements NewsService{

	@Autowired
	private NewsMapper newsMapper;

	public List<News> selectNewMohu(String keyword) {
		return newsMapper.selectNewMohu(keyword);
	}

	public List<News> selectNewAll() {
		return newsMapper.selectNewAll();
	}

	public int deleteByPrimaryKey(Integer newsId) {
		return newsMapper.deleteByPrimaryKey(newsId);
	}

	public int insertSelective(News record) {
		return newsMapper.insertSelective(record);
	}

	public List<News> selectNewTypeId(Integer newsTypeId) {
		return newsMapper.selectNewTypeId(newsTypeId);
	}

	public News selectByPrimaryKey(Integer newsId) {
		return newsMapper.selectByPrimaryKey(newsId);
	}

	public int updateByPrimaryKeySelective(News record) {
		return newsMapper.updateByPrimaryKeySelective(record);
	}
	
	
}
