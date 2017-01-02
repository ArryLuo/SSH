<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
<script type="text/javascript">
		function empdel(id){
			if(confirm('真的要删除吗?'+id)){
			location="${pageContext.request.contextPath}/emp_delete.action?empno="+id;
			}else{
			return false;
			}
		}
		function empupdate(id){
		location="${pageContext.request.contextPath}/emp_updateUI.action?empno="+id;
		}
			var page=1;
		function next(){
			alert(page);
			page+=1;
		}
		function up(){
			
			if(page==1){
				page=1;
				
			}
			page-=1;
				alert(page);
		}
</script>
</head>
<body>
	<form method="post" action="" id="listform">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder"> 内容列表</strong> <a href=""
					style="float:right; display:none;">添加字段</a>
			</div>
			<div class="padding border-bottom">
				<ul class="search" style="padding-left:10px;">
					<li><a class="button border-main icon-plus-square-o"
						href="${pageContext.request.contextPath}/emp_addUI.action">
							添加员工</a></li>
					<li>搜索：</li>
					<li>首页 <select name="s_ishome" class="input"
						onchange="changesearch()"
						style="width:60px; line-height:17px; display:inline-block">
							<option value="">选择</option>
							<option value="1">是</option>
							<option value="0">否</option>
					</select> &nbsp;&nbsp; 推荐 <select name="s_isvouch" class="input"
						onchange="changesearch()"
						style="width:60px; line-height:17px;display:inline-block">
							<option value="">选择</option>
							<option value="1">是</option>
							<option value="0">否</option>
					</select> &nbsp;&nbsp; 置顶 <select name="s_istop" class="input"
						onchange="changesearch()"
						style="width:60px; line-height:17px;display:inline-block">
							<option value="">选择</option>
							<option value="1">是</option>
							<option value="0">否</option>
					</select></li>
					<if condition="$iscid eq 1">
					<li><select name="cid" class="input"
						style="width:200px; line-height:17px;" onchange="changesearch()">
							<option value="">请选择分类</option>
							<option value="">产品分类</option>
							<option value="">产品分类</option>
							<option value="">产品分类</option>
							<option value="">产品分类</option>
					</select></li>
					</if>
					<li><input type="text" placeholder="请输入搜索关键字" name="keywords"
						class="input"
						style="width:250px; line-height:17px;display:inline-block" /> <a
						href="javascript:void(0)" class="button border-main icon-search"
						onclick="changesearch()"> 搜索</a>
					</li>
				</ul>
			</div>
			<table class="table table-hover text-center">
				<tr>
					<th width="100" style="text-align:left; padding-left:20px;">排序</th>
					<th width="10%">ENAME</th>
					<th>JOB</th>
					<th>MGR</th>
					<th>HIREDATE</th>
					<th>SAL</th>
					<th>COMM</th>
					<th>DEPTNO</th>
					<th width="310">操作</th>
				</tr>
				<volist name="list" id="vo"> <s:iterator status="s"
					value="#request.list" var="emp">
					<tr>
						<td style="text-align:left; padding-left:20px;"><input
							type="checkbox" name="id[]" value="" /> <s:property
								value="#s.index+1" /></td>
						<td>${emp.ename}</td>
						<td>${emp.job }</td>
						<td>${emp.mgr }</td>
						<td><font color="#00CC99">${emp.hiredate } </font>
						</td>
						<td>${emp.sal}</td>
						<td>${emp.comm}</td>
						<td>${emp.dept}</td>
						<td><div class="button-group">
								<a class="button border-main" href="javascript:void(0)"
									onclick="return empupdate(${emp.empno})"><span
									class="icon-edit"></span> 修改</a> <a class="button border-red"
									href="javascript:void(0)" onclick="return empdel(${emp.empno})"><span
									class="icon-trash-o"></span> 删除</a>
							</div>
						</td>
					</tr>
				</s:iterator>
				<tr>
					<td style="text-align:left; padding:19px 0;padding-left:20px;"><input
						type="checkbox" id="checkall" /> 全选</td>
					<td colspan="7" style="text-align:left;padding-left:20px;"><a
						href="javascript:void(0)" class="button border-red icon-trash-o"
						style="padding:5px 15px;" onclick="DelSelect()"> 删除</a> <a
						href="javascript:void(0)" style="padding:5px 15px; margin:0 10px;"
						class="button border-blue icon-edit" onclick="sorts()"> 排序</a> 操作：
						<select name="ishome"
						style="padding:5px 15px; border:1px solid #ddd;"
						onchange="changeishome(this)">
							<option value="">首页</option>
							<option value="1">是</option>
							<option value="0">否</option>
					</select> <select name="isvouch"
						style="padding:5px 15px; border:1px solid #ddd;"
						onchange="changeisvouch(this)">
							<option value="">推荐</option>
							<option value="1">是</option>
							<option value="0">否</option>
					</select> <select name="istop"
						style="padding:5px 15px; border:1px solid #ddd;"
						onchange="changeistop(this)">
							<option value="">置顶</option>
							<option value="1">是</option>
							<option value="0">否</option>
					</select> &nbsp;&nbsp;&nbsp; 移动到： <select name="movecid"
						style="padding:5px 15px; border:1px solid #ddd;"
						onchange="changecate(this)">
							<option value="">请选择分类</option>
							<option value="">产品分类</option>
							<option value="">产品分类</option>
							<option value="">产品分类</option>
							<option value="">产品分类</option>
					</select> <select name="copynum"
						style="padding:5px 15px; border:1px solid #ddd;"
						onchange="changecopy(this)">
							<option value="">请选择复制</option>
							<option value="5">复制5条</option>
							<option value="10">复制10条</option>
							<option value="15">复制15条</option>
							<option value="20">复制20条</option>
					</select>
					</td>
				</tr>
				<tr>
					<td colspan="8"><div class="pagelist">
							<a href="javascript:void(0)" onclick="up()">上一页</a> <span
								class="current">1</span><a href="">2</a><a href="">3</a><a
								href="javascript:void(0)" onclick="next()">下一页</a><a href="">尾页</a>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</form>
	<script type="text/javascript">
		//搜索
		function changesearch() {

		}

		//单个删除
		function del(id) {
			if (confirm("您确定要删除吗?")) {
				
			} else {
				return false;
			}
		}

		//全选
		$("#checkall").click(function() {
			$("input[name='id[]']").each(function() {
				if (this.checked) {
					this.checked = false;
				} else {
					this.checked = true;
				}
			});
		})

		//批量删除
		function DelSelect() {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {
				var t = confirm("您确认要删除选中的内容吗？");
				if (t == false)
					return false;
				$("#listform").submit();
			} else {
				alert("请选择您要删除的内容!");
				return false;
			}
		}

		//批量排序
		function sorts() {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {

				$("#listform").submit();
			} else {
				alert("请选择要操作的内容!");
				return false;
			}
		}

		//批量首页显示
		function changeishome(o) {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {

				$("#listform").submit();
			} else {
				alert("请选择要操作的内容!");

				return false;
			}
		}

		//批量推荐
		function changeisvouch(o) {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {

				$("#listform").submit();
			} else {
				alert("请选择要操作的内容!");

				return false;
			}
		}

		//批量置顶
		function changeistop(o) {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {

				$("#listform").submit();
			} else {
				alert("请选择要操作的内容!");

				return false;
			}
		}

		//批量移动
		function changecate(o) {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {

				$("#listform").submit();
			} else {
				alert("请选择要操作的内容!");

				return false;
			}
		}

		//批量复制
		function changecopy(o) {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {
				var i = 0;
				$("input[name='id[]']").each(function() {
					if (this.checked == true) {
						i++;
					}
				});
				if (i > 1) {
					alert("只能选择一条信息!");
					$(o).find("option:first").prop("selected", "selected");
				} else {

					$("#listform").submit();
				}
			} else {
				alert("请选择要复制的内容!");
				$(o).find("option:first").prop("selected", "selected");
				return false;
			}
			}
			}
			}
	</script>
</body>
</html>