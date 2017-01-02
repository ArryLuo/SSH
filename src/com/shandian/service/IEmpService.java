package com.shandian.service;

import java.util.List;

import com.shandian.bean.Dept;
import com.shandian.bean.Emp;

public interface IEmpService {

	// 查询员工所有
	// 查询所有的员工
	List<Emp> getAll();

	// 添加员工
	void add(Emp emp);

	// 删除员工
	boolean deleteEmp(int id);

	// 通过id获取员工对象
	Emp getByIdEmp(int id);

	// 真正的修改
	public void update(Emp emp);
}
