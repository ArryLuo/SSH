package com.shandian.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.shandian.bean.Dept;
import com.shandian.dao.IDeptDao;

public class DeptDaoImpl extends HibernateDaoSupport implements IDeptDao {

	public List<Dept> getDeptAll() {
		// TODO Auto-generated method stub
		String hql = "from  Dept";
		List<Dept> list = getHibernateTemplate().find(hql);
		if (list != null) {
			return list;
		}
		return null;
	}

	public void addDept(Dept dept) {
		// TODO Auto-generated method stub
		getHibernateTemplate().save(dept);
	}

	public void deleteDept(int id) {
		// TODO Auto-generated method stub
		Dept dept = getDeptById(id);
		if (dept != null) {
			getHibernateTemplate().delete(dept);
			System.out.println("删除成功!");
		}
	}

	public Dept getDeptById(int id) {
		// TODO Auto-generated method stub
		Dept dept = getHibernateTemplate().get(Dept.class, id);
		if (dept != null) {
			return dept;
		}
		return null;
	}

	public void update(Dept dept) {
		// TODO Auto-generated method stub
		Dept dep = getDeptById(dept.getDeptno());
		dep.setDname(dept.getDname());
		dep.setLoc(dept.getLoc());
		// 实例改变但id不变
		getHibernateTemplate().merge(dep);
	}

}
