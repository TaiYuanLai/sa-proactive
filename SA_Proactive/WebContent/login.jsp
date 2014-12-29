<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員登入</title>
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
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-left navcolor">
				<li><a href="index.jsp">首頁</a></li>
				<li><a href="product.jsp">買零件</a></li>
				<li><a href="specialOffer.jsp">買優惠組合</a></li>
				<li><a href="customerlize1.jsp">客製化組裝</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right navcolor">
				<li><a href="register.jsp">註冊</a></li>
				<li class="active"><a href="login.jsp">登入</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>
	<div class="container_reg">
		<div class="login_div">

			<!-- BEGIN CONTACT FORM -->
			<form id="sendForm" class="form-horizontal" role="form" action="LoginServlet" method="post">
				<%
					String errorMsg = "";
					if (session.getAttribute("errorMsg") != null)
						errorMsg = (String) session.getAttribute("errorMsg");
				%>
				<img src="img/1.png" class="logo_log" alt="Proactive">
				<div class="form-group form-group_log">
					<label for="inputEmail3" class="col-sm-2 control-label label_log">Email</label>
					<div class="col-sm-10">
						<input type="text" class="form-control textbox_email textbox_log"
							id="memberAccount" name="memberAccount" maxlength="55"
							placeholder="Email">
					</div>
				</div>
				<div class="form-group form-group_log">
					<label for="inputPassword3"
						class="col-sm-2 control-label label_log">Password</label>
					<div class="col-sm-10">
						<input type="password"
							class="form-control textbox_pwd textbox_log" id="memberPassword"
							name="memberPassword" maxlength="20" placeholder="Password">
					</div>
				</div>
				<div class="form-group form-group_log">
					<div>
						<a href="http://localhost:8080/SA_Proactive/management/login.jsp" class="alert-link link_log">管理者登入</a> 
						<a href="" class="alert-link link_log">忘記密碼</a>
						<button type="submit" class="btn btn-default btn_log">登入</button>
					</div>
					<div id="response" style="color: red"><%=errorMsg%></div>
				</div>
				<%
					session.removeAttribute("errorMsg");
				%>
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
		$(function() {
			$("#sendForm").validate({
				rules : {
					memberAccount : "required",
					memberPassword : "required"
				},
				messages : {
					memberAccount : "請輸入帳號",
					memberPassword : "請輸入密碼"
				}
			});
		});
	</script>

</body>
</html>