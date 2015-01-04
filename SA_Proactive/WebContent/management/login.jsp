<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>業者登入</title>
<link rel="stylesheet" href="css/jquery.validate.css" media="screen" />
<link rel="shortcut icon" href="img/logo3.jpg">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/modern-business.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">


</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top navchg"
		role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<img src="img/logo3.jpg" class="navlogo">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="login.jsp"> 
				<span>PROACTIVE</span>後台管理系統
			</a>
		</div>
		

	</div>
	<!-- /.container --> </nav>
	<%
		if (session.getAttribute("managerAccount") == null) {
	%>
	<div class="container_reg">
		<div class="login_div">

			<!-- BEGIN CONTACT FORM -->
			<form id="sendForm" class="form-horizontal" role="form"
				action="MLoginServlet" method="post">
				<img src="img/1.png" class="logo_manlog" alt="Proactive">
				<h3>
					<b>業者登入</b>
				</h3>
				<div class="form-group form-group_log">
					<label for="inputEmail3" class="col-sm-2 control-label label_log">帳號</label>
					<div class="col-sm-10">
						<input type="text" class="form-control textbox_name textbox_log"
							id="managerAccount" name="managerAccount" maxlength="55"
							placeholder="Account">
					</div>
				</div>
				<div class="form-group form-group_log">
					<label for="inputPassword3"
						class="col-sm-2 control-label label_log">密碼</label>
					<div class="col-sm-10">
						<input type="password"
							class="form-control textbox_pwd textbox_log" id="managerPassword"
							name="managerPassword" maxlength="20" placeholder="Password">
					</div>
				</div>
				<div class="form-group form-group_log">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default btn_log">登入</button>
					</div>
				</div>

			</form>
			<!-- END CONTACT FORM -->
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
		else {
			response.sendRedirect("manageProduct.jsp");
		}
	%>
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- validate -->
	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="js/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="js/jquery.validate.js"></script>
	<script type="text/javascript" src="js/additional-methods.js"></script>
	<script type="text/javascript" src="js/messages_zh_TW.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#sendForm").validate({
				rules : {
					managerAccount : "required",
					managerPassword : "required"
				},
				messages : {
					managerAccount : "請輸入帳號",
					managerPassword : "請輸入密碼"
				},
				submitHandler : function() {
					$.ajax({
						type : "post",
						url : "../MLoginServlet",
						data : $("#sendForm").serialize(),
						success : function(flag) {
							if (flag == "1")
								window.location.href = "login.jsp";
							else
								alert("帳號密碼錯誤。");
						}
					});
				}
			});
		});
	</script>
</body>
</html>