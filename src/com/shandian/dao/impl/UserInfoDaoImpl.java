package com.shandian.dao.impl;

import java.util.List;

import org.apache.taglibs.standard.lang.jstl.Literal;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.shandian.bean.Users;
import com.shandian.dao.IUserInfoDAO;

public class UserInfoDaoImpl extends HibernateDaoSupport implements
		IUserInfoDAO {
	// 登录
	public Users login(Users users) {
		// TODO Auto-generated method stub
		String hql = "FROM Users u where u.UName=? and u.pwd=?";
		List<Users> list = getHibernateTemplate().find(hql,
				new Object[] { users.getUName(), users.getPwd() });
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

}
