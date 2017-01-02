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
			<strong><span class="icon-pencil-square-o"></span>增加内容</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x"
				action="${pageContext.request.contextPath}/dept_update.action">
				<div class="form-group">
					<input type="text" name="deptno" value="${dept.deptno}">
					<div class="label">
						<label> DNAME： </label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="${dept.dname}"
							name="dname" data-validate="required:请输入部门" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label> LOC： </label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="${dept.loc}"
							name="loc" data-validate="required:请输入职位" />
						<div class="tips"></div>
					</div>

				</div>

				<div class="clear"></div>

				<div class="field">
					<button class="button bg-main icon-check-square-o" type="submit">
						提交</button>
				</div>
		</div>
		</form>
	</div>
	</div>

</body>
</html>