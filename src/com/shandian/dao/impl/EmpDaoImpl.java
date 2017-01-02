package com.shandian.dao.impl;

import java.util.Date;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.shandian.bean.Dept;
import com.shandian.bean.Emp;
import com.shandian.dao.IEmpDao;

public class EmpDaoImpl extends HibernateDaoSupport implements IEmpDao {

	public List<Emp> getAll() {
		// TODO Auto-generated method stub
		// 查询员工和部门
		String hql = "from Emp";
		List<Emp> list = getHibernateTemplate().find(hql);
		if (list != null) {
			return list;
		}
		return null;
	}

	// 添加员工
	public void add(Emp emp) {
		// TODO Auto-generated method stub
		Dept dept = getHibernateTemplate().get(Dept.class,
				emp.getDept().getDeptno());
		System.out.println(dept);
		emp.setDept(dept);
		//
		Date date = new Date();
		emp.setHiredate(date);
		System.out.println(emp.toString());
		getHibernateTemplate().save(emp);
	}

	public boolean deleteEmp(int id) {
		// TODO Auto-generated method stub
		Emp emp = getByIdEmp(id);
		if (emp != null) {
			// 删除员工的同时需要在部门中移除该员工,不然会抛出deleted object would be re-saved by
			// cascade (remove deleted object from asso错误
			Dept dept = getHibernateTemplate().get(Dept.class,
					emp.getDept().getDeptno());
			dept.getEmps().remove(emp);
			getHibernateTemplate().delete(emp);
			return true;
		}
		return false;
	}

	public Emp getByIdEmp(int id) {
		// TODO Auto-generated method stub
		Emp emp = getHibernateTemplate().get(Emp.class, id);
		if (emp != null) {
			return emp;
		}
		return null;
	}

	public void update(Emp emp) {
		// TODO Auto-generated method stub
		Emp ep = getByIdEmp(emp.getEmpno());
		if (ep != null) {
			ep.setComm(emp.getComm());
			Dept dept = getHibernateTemplate().get(Dept.class,
					emp.getDept().getDeptno());
			System.out.println("部门的id:"+emp.getDept().getDeptno());
			ep.setDept(dept);
			ep.setEname(emp.getEname());
			ep.setJob(emp.getJob());
			ep.setMgr(emp.getMgr());
			ep.setSal(emp.getSal());
			// 改变原有的实例，但该实例的id保持不变
			getHibernateTemplate().merge(ep);
		}
	}

}
