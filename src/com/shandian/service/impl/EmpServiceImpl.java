package com.shandian.service.impl;

import java.util.List;

import com.shandian.bean.Emp;
import com.shandian.dao.IEmpDao;
import com.shandian.service.IEmpService;

public class EmpServiceImpl implements IEmpService {
	private IEmpDao empDao;

	public void setEmpDao(IEmpDao empDao) {
		this.empDao = empDao;
	}

	public List<Emp> getAll() {
		// TODO Auto-generated method stub
		return empDao.getAll();
	}

	public void add(Emp emp) {
		// TODO Auto-generated method stub
		empDao.add(emp);
	}

	public boolean deleteEmp(int id) {
		// TODO Auto-generated method stub

		return empDao.deleteEmp(id);
	}

	public Emp getByIdEmp(int id) {
		// TODO Auto-generated method stub
		return empDao.getByIdEmp(id);
	}

	public void update(Emp emp) {
		// TODO Auto-generated method stub
		empDao.update(emp);
	}

}
