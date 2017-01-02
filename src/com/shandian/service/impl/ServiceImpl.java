package com.shandian.service.impl;

import java.util.List;

import com.shandian.bean.Dept;
import com.shandian.bean.Emp;
import com.shandian.bean.Users;
import com.shandian.dao.IDeptDao;
import com.shandian.dao.IEmpDao;
import com.shandian.dao.IUserInfoDAO;
import com.shandian.service.IService;

public class ServiceImpl implements IService {
	private IUserInfoDAO dao;

	public void setDao(IUserInfoDAO dao) {
		this.dao = dao;
	}

	public Users login(Users users) {
		// TODO Auto-generated method stub
		return dao.login(users);
	}


}
