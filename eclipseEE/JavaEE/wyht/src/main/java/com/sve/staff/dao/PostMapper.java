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

//	   ��Ӧ�ĸ�λ�� 
	int selectDpostcount(Integer depid);
//	 ��������ʱ���ְλ��Ӧ�ĸ�λ    
	List<Post> selectPost(Integer depid);
	//��֤
	 int yanzheng(String postName);
}