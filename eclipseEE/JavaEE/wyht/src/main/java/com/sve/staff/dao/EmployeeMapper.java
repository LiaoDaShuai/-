package com.sve.staff.dao;

import java.util.List;

import com.sve.staff.model.Employee;

public interface EmployeeMapper {
	int employeeCount();//Ա������
	
	List<Employee> selectAll();
	
    int deleteByPrimaryKey(Integer empid);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Integer empid);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
    //��ѯ���Ŷ�Ӧ������
    int selectDemployeecount(Integer depid);
    //��ѯ��λ��Ӧ������
	int selectPostcount(Integer postid);
	//ģ����ѯ
	List<Employee> mohu(Employee employee);
	//��������
	List<Employee> selectEmployee(int postid);
	//�������� ����->Ա��
	List<Employee> selectEmployeeDep(int depid);
}