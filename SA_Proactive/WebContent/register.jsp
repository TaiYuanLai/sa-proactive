<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員註冊</title>
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
		if (session.getAttribute("memberAccount") == null) {
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
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-left navcolor">
				<li><a href="index.jsp">首頁</a></li>
				<li><a href="product.jsp">買零件</a></li>
				<li><a href="specialOffer.jsp">買優惠組合</a></li>
				<li><a href="customerlize1.jsp">客製化組裝</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right navcolor">
				<li class="active"><a href="register.jsp">註冊</a></li>
				<li><a href="login.jsp">登入</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>
	<div class="container_reg">
		<div class="login_div">

			<!-- BEGIN CONTACT FORM -->
			<form id="addForm" class="form-horizontal" role="form"
				action="AddMemberServlet" method="post">
				<img src="img/1.png" class="logo_reg" alt="Proactive">
				<div class="form-group form-group_reg">
					<label for="inputName3" class="col-sm-2 control-label label_log">Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control textbox_name textbox_log"
							id="memberName" name="memberName" placeholder="Name">
					</div>
				</div>
				<div class="form-group form-group_reg">
					<label for="inputEmail3" class="col-sm-2 control-label label_log">Email</label>
					<div class="col-sm-10">
						<input type="text" class="form-control textbox_email textbox_log"
							id="memberAccount" name="memberAccount" placeholder="Email">
					</div>
				</div>
				<div class="form-group form-group_reg">
					<label for="inputPassword3"
						class="col-sm-2 control-label label_log">Password</label>
					<div class="col-sm-10">
						<input type="password"
							class="form-control textbox_pwd textbox_log" id="memberPassword"
							name="memberPassword" placeholder="Password">
					</div>
				</div>
				<div class="form-group form-group_reg">
					<label for="inputPassword3"
						class="col-sm-2 control-label label_log">Confirm</label>
					<div class="col-sm-10">
						<input type="password"
							class="form-control textbox_check textbox_log"
							id="memberPassword2" name="memberPassword2"
							placeholder="Confirm Password">
					</div>
				</div>
				<div class="form-group form-group_reg">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default btn_reg">下一步</button>
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
			response.sendRedirect("index.jsp");
		}
	%>
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Script to Activate the Carousel -->
	<script>
		$('.carousel').carousel({
			interval : 5000
		//changes the speed
		})
	</script>

	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.js"></script>
	<script type="text/javascript" src="js/additional-methods.js"></script>
	<script type="text/javascript" src="js/messages_zh_TW.js"></script>

	<script type="text/javascript">
		$(function() {
			$("#addForm").validate({
				rules : {
					memberAccount : {
						required : true,
						email : true,
						remote : {
							url : "CheckAccountServlet",//回傳true就是通過檢查
							type : "post",
							cache : false,
							data : {
								memberAccount : function() {
									return $("#memberAccount").val();
								}
							}
						}
					},

					memberPassword : {
						required : true,
						minlength : 6
					},
					memberPassword2 : {
						required : true,
						minlength : 6,
						equalTo : $("#memberPassword")
					},
					memberName : "required"
				},

				messages : {

					memberAccount : {
						required : "請輸入帳號",
						remote : "帳號已被註冊"
					},
					memberPassword : {
						required : "請輸入",
						minlength : "長度不得小於6"
					},
					memberPassword2 : {
						required : "請確認密碼",
						minlength : "長度不得小於6",
						equalTo : "您兩次密碼輸入不同，請重新輸入"
					},
					memberName : "請輸入名稱"

				}

			});

		});
	</script>
</body>
</html>