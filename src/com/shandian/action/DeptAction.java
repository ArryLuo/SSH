package com.shandian.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shandian.bean.Dept;
import com.shandian.service.IDeptService;
import com.shandian.service.IService;

public class DeptAction extends ActionSupport implements ModelDriven<Dept> {
	private Dept dept = new Dept();
	private IDeptService deptService;

	public void setDeptService(IDeptService deptService) {
		this.deptService = deptService;
	}

	public Dept getModel() {
		// TODO Auto-generated method stub
		return dept;
	}

	// 查询所有的部门
	public String queryAll() {
		List<Dept> list = deptService.getDeptAll();
		ActionContext.getContext().put("list", list);
		return "toquery";
	}

	// 进入添加页面
	public String addUI() {

		return "adduid";
	}

	// 真正的添加
	public String add() {
		deptService.addDept(dept);
		return "query";
	}

	// 删除
	public String delete() {
		deptService.deleteDept(dept.getDeptno());
		return "query";
	}

	// 进入修改页面
	public String updateUI() {
		Dept dep = deptService.getDeptById(dept.getDeptno());
		ActionContext.getContext().put("dept", dep);
		return "updateui";
	}

	// 修改dept
	public String update() {
		deptService.update(dept);
		return "query";
	}
}
