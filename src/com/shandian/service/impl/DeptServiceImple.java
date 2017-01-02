package com.shandian.service.impl;

import java.util.List;

import com.shandian.bean.Dept;
import com.shandian.dao.IDeptDao;
import com.shandian.service.IDeptService;

public class DeptServiceImple implements IDeptService {
	private IDeptDao deptDao;

	public void setDeptDao(IDeptDao deptDao) {
		this.deptDao = deptDao;
	}

	public List<Dept> getDeptAll() {
		// TODO Auto-generated method stub
		return deptDao.getDeptAll();
	}

	public void addDept(Dept dept) {
		// TODO Auto-generated method stub
		deptDao.addDept(dept);
	}

	public void deleteDept(int id) {
		// TODO Auto-generated method stub
		deptDao.deleteDept(id);
	}

	public Dept getDeptById(int id) {
		// TODO Auto-generated method stub
		return deptDao.getDeptById(id);
	}

	public void update(Dept dept) {
		// TODO Auto-generated method stub
		deptDao.update(dept);
	}

}
