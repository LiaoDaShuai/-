package com.sve.staff.service;

import java.util.List;

import com.sve.staff.model.Post;

public interface PostService {
	
	List<Post> selectAll(Integer depid);
	
    int deleteByPrimaryKey(Integer postid);

    int insertSelective(Post record);

    Post selectByPrimaryKey(Integer postid);

    int updateByPrimaryKeySelective(Post record);

	int selectDpostcount(Integer depid);
	//¶þ¼¶Á¬
	List<Post> selectPost(Integer depid);
	
	int yanzheng(String postName);
}
