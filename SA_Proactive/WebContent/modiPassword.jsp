<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="database.*"%>
<%@ page import="bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密碼</title>
<link rel="stylesheet" href="css/jquery.validate.css" media="screen" />
<link rel="shortcut icon" href="img/logo3.jpg">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/modern-business.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">


</head>
<body>
	<%
		if (session.getAttribute("memberAccount") != null) {
	%>
	<nav class="navbar navbar-inverse navbar-fixed-top navchg"
		role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<img src="img/logo3.jpg" class="navlogo">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp"> <span>PROACTIVE</span>
			</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-left navcolor">
				<li><a href="index.jsp">首頁</a></li>
				<li><a href="product.jsp">買零件</a></li>
				<li><a href="specialOffer.jsp">買優惠組合</a></li>
				<li><a href="customerlize1.jsp">客製化組裝</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right navcolor">
				<li><a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>購物車</a></li>
				<li class="dropdown active">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=session.getAttribute("memberName")%><b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="modiPassword.jsp">修改密碼</a></li>
						<li><a href="order.jsp">訂單查詢</a></li>
						<li><a href="LogoutServlet">登出</a></li>
					</ul>
					</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>
	<div class="container_reg">
		<div class="login_div">
			<form id="modiForm" class="form-horizontal" role="form">
				<img src="img/1.png" class="logo_log" alt="Proactive">
				<div class="form-group form-group_reg">
					<label for="inputName3" class="col-sm-2 control-label label_log">OldPwd</label>
					<div class="col-sm-10">
						<input type="password" class="form-control textbox_pwd textbox_log" id="oldPassword" name="oldPassword" placeholder="OldPwd" maxlength="20">
					</div>
				</div>
				<div class="form-group form-group_reg">
					<label for="inputEmail3" class="col-sm-2 control-label label_log">NewPwd</label>
					<div class="col-sm-10">
						<input type="password" class="form-control textbox_pwd textbox_log" id="password1" name="password1" placeholder="NewPwd" maxlength="20">
					</div>
				</div>
				<div class="form-group form-group_reg">
					<label for="inputPassword3"
						class="col-sm-2 control-label label_log">Confirm</label>
					<div class="col-sm-10">
						<input type="password" class="form-control textbox_check textbox_log" id="password2" name="password2" placeholder="Confirm" maxlength="20">
					</div>
				</div>
				<div class="form-group form-group_log">
					<div>
						<button type="submit" class="btn btn-default btn_log">修改</button>
					</div>
				</div>
			</form>
		</div>
		<div class="container">
			<footer class="footer_reg">
			<div class="row">
				<div class="col-lg-12">
					<p class="text-right">Copyright &copy; 2014 PROACTIVE</p>
				</div>
			</div>
			</footer>
		</div>
	</div>

	<%
		}//if
		else
			response.sendRedirect("login.jsp");
	%>

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- javascript -->
	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="js/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="js/jquery.validate.js"></script>
	<script type="text/javascript" src="js/additional-methods.js"></script>
	<script type="text/javascript" src="js/messages_zh_TW.js"></script>
	<script type="text/javascript">
	
	$(function(){
		$("#modiForm").validate({
     		rules:{
     			oldPassword:{
    				required:true
    			},
				password1:{
					required:true,
					minlength:6
				},
				password2:{
					required:true,
					minlength:6,
					equalTo:$("#password1")
				}
			},
			submitHandler:function(){
				$.ajax({
					type:"post",
					url:"ModiPasswordServlet",
					data:$("#modiForm").serialize(),
					success:function(flag){
						if(flag == "false"){
							alert("舊密碼輸入錯誤。");
						}
						else{
							alert("修改密碼成功。");
							window.location.href = "index.jsp";
						}
					}
				});
			}
    	}); 
	});
	
	
	
	
	
	
	
	</script>

</body>
</html>