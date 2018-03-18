package com.sve.staff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sve.staff.dao.PostMapper;
import com.sve.staff.model.Post;
import com.sve.staff.service.PostService;

@Service  
@Transactional  
public class PostServiceimpl implements PostService
{
	@Autowired
	PostMapper postMapper;
	
	public List<Post> selectAll(Integer depid) {
		return postMapper.SelectAll(depid);
	}

	public int deleteByPrimaryKey(Integer postid) {
		return postMapper.deleteByPrimaryKey(postid);
	}

	public int insertSelective(Post record) {
		return postMapper.insertSelective(record);
	}

	public Post selectByPrimaryKey(Integer postid) {
		return postMapper.selectByPrimaryKey(postid);
	}

	public int updateByPrimaryKeySelective(Post record) {
		return postMapper.updateByPrimaryKeySelective(record);
	}

	public int selectDpostcount(Integer depid) {
		return postMapper.selectDpostcount(depid);
	}

	public List<Post> selectPost(Integer depid) {
		return postMapper.selectPost(depid);
	}

	public int yanzheng(String postName) {
		return postMapper.yanzheng(postName);
	}

}
