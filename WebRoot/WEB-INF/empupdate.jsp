<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>修改内容</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x"
				action="${pageContext.request.contextPath}/emp_update.action">
				<div class="form-group">
					<input type="hidden" name="empno" value="${emp.empno}">
					<div class="label">
						<label> ENAME： </label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="${emp.ename}"
							name="ename" readonly="readonly" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label> JOB： </label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="${emp.job}" name="job"
							data-validate="required:请输入job" />
						<div class="tips"></div>
					</div>

				</div>

				<if condition="$iscid eq 1">
				<div class="form-group">
					<div class="label">
						<label> dept： </label>
					</div>
					<div class="field">
						<!-- 遍历所有部门 -->
						<!-- 这个可以获取你当前的部门value="#request.emp.dept.deptno"-->
						<s:select name="dept.deptno" list="#request.list"
							value="#request.emp.dept.deptno" listKey="deptno"
							listValue="dname" headerKey="-1" headerValue="--请选择--" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label> MGR ： </label>
					</div>
					<div class="field">
						<input name="mgr" type="text" value="${emp.mgr}"></input>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label> SAL： </label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="${emp.sal}" name="sal" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label> COMM： </label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="${emp.comm}"
							name="comm" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="clear"></div>

				<div class="field">
					<button class="button bg-main icon-check-square-o" type="submit">
						修改</button>
				</div>
		</div>
		</form>
	</div>
	</div>

</body>
</html>