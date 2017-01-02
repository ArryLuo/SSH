package com.shandian.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shandian.bean.Users;
import com.shandian.service.IService;

public class UserAction extends ActionSupport implements ModelDriven<Users> {
	private Users users = new Users();
	private IService service;

	public void setService(IService service) {
		this.service = service;
	}

	public Users getModel() {
		// TODO Auto-generated method stub
		return users;
	}

	// 登录
	public String login() {
		Users us = service.login(users);
		if (us != null) {
			return "index";

		}
		return "login";
	}

}
