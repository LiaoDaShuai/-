package com.sve.lifeservice.dao;

import java.util.List;

import com.sve.lifeservice.model.Storages;

public interface StoragesMapper {
	//查询已取的快递总数
	int storagesCount();
	
    int deleteByPrimaryKey(Integer storId);

    int insertSelective(Storages record);

    Storages selectByPrimaryKey(Integer storId);

    int updateByPrimaryKeySelective(Storages record);

    List<Storages> selectA(int storExpId);//单查询全部
    
    List<Storages> selectAll(Storages sto);//模糊查询全部
    
    int delete_selectStorage(int expId);//根据快递编号查询入库表是否有数据
    
    int delete_Storage(int expId);//根据快递编号删除入库表
    
    int delete_selectStorage2(int couId);//根据快递员编号查询入库表是否有数据
    
    int delete_Storage2(int couId);//根据快递员编号删除入库表
    
    List<Storages> selectByPhone4(Storages sto);//根据手机后4位查询入库的快递信息
    
    int updateStorage(int storId);//修改快递状态
    
    int selectStorNum(String num);//查询快递单号是否已存在
}