package com.shandian.dao;

import java.util.List;

import com.shandian.bean.Dept;

public interface IDeptDao {
	// 查询出所有的部门
	List<Dept> getDeptAll();

	// 添加部门
	void addDept(Dept dept);

	// 删除一个部门
	void deleteDept(int id);

	// 进入修改页面并获取当前的对象
	Dept getDeptById(int id);

	// 真正的修改
	public void update(Dept dept);
}
