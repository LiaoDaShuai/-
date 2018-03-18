package com.sve.staff.dao;

import java.util.List;

import com.sve.staff.model.Post;

public interface PostMapper {
	List<Post> SelectAll(Integer depid);
	
	Post selectDpostcount(Post record);
	
    int deleteByPrimaryKey(Integer postid);

    int insertSelective(Post record);

    Post selectByPrimaryKey(Integer postid);

    int updateByPrimaryKeySelective(Post record);

//	   对应的岗位数 
	int selectDpostcount(Integer depid);
//	 二级联动时候的职位对应的岗位    
	List<Post> selectPost(Integer depid);
	//验证
	 int yanzheng(String postName);
}