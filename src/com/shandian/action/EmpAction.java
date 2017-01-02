package com.shandian.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shandian.bean.Dept;
import com.shandian.bean.Emp;
import com.shandian.service.IDeptService;
import com.shandian.service.IEmpService;
import com.shandian.service.IService;

public class EmpAction extends ActionSupport implements ModelDriven<Emp> {
	private Emp emp = new Emp();
	private IEmpService empService;
	private IDeptService deptService;

	public void setDeptService(IDeptService deptService) {
		this.deptService = deptService;
	}

	public void setEmpService(IEmpService empService) {
		this.empService = empService;
	}

	public Emp getModel() {
		// TODO Auto-generated method stub
		return emp;
	}

	public String queryAll() {
		List<Emp> list = empService.getAll();
		ActionContext.getContext().put("list", list);
		return "toquery";
	}

	// 进入添加页面
	public String addUI() {
		// 取出部门
		List<Dept> list = deptService.getDeptAll();
		ActionContext.getContext().put("list", list);
		return "addui";
	}

	// 真正的添加
	public String add() {
		// System.out.println(emp.getDept().getDeptno());
		empService.add(emp);
		return "query";
	}

	// 删除
	public String delete() {
		System.out.println("id:" + emp.getEmpno());
		boolean flg = empService.deleteEmp(emp.getEmpno());
		if (flg) {
			return "query";
		}
		System.out.println("失败");
		return "query";

	}

	// 进入修改页面
	public String updateUI() {
		Emp ep = empService.getByIdEmp(emp.getEmpno());
		ActionContext.getContext().put("emp", ep);
		// 取出部门
		List<Dept> list = deptService.getDeptAll();
		ActionContext.getContext().put("list", list);

		return "updateui";
	}

	// 真正的修改
	public String update() {
		empService.update(emp);
		return "query";
	}

}
