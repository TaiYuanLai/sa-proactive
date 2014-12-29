<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="database.*"%>
<%@ page import="bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>PROACTIVE電腦客製組裝</title>
<link rel="shortcut icon" href="img/logo3.jpg">

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/modern-business.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/style.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<!-- Navigation -->
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
				<li class="active"><a href="index.jsp">首頁</a></li>
				<li><a href="product.jsp">買零件</a></li>
				<li><a href="specialOffer.jsp">買優惠組合</a></li>
				<li><a href="customerlize1.jsp">客製化組裝</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right navcolor">

				<%
					if (session.getAttribute("memberAccount") == null) {
				%>
				<li><a href="register.jsp">註冊</a></li>
				<li><a href="login.jsp">登入</a></li>
				<%
					} else {
				%>
				
				<li><a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>購物車</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=session.getAttribute("memberName")%><b class="caret"></b></a>
                       <ul class="dropdown-menu">
                           <li>
                               <a href="modiPassword.jsp">修改密碼</a>
                           </li>
                           <li>
                                <a href="order.jsp">訂單查詢</a>
                           </li>
                           <li>
                               <a href="LogoutServlet">登出</a>
                           </li>
                       </ul>
				</li>
				<%
					}
				%>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<header>
	<div class="jumbotron headerbg">
		<div class="container">
			<h2>想要花一樣的經費,卻擁有比品牌電腦更高檔的配備嗎?</h2>
			<br> <br>
			<p>
				<a class="btn btn-primary btn-lg headerbtn" href="customerlize1.jsp" role="button">組裝我的電腦</a>
			</p>
		</div>
	</div>
	</header>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					熱銷資訊 <small>各配備最熱銷型號前三名</small>
				</h1>
			</div>
		</div>
		<!-- /.row -->

		<!-- 中央處理器 cpu -->
		<div class="row">
			<div class="col-sm-6 col-md-3">
				<a href="##" class="btn btn-primary btn-lg btn-circle">CPU</a>
			</div>

			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="img/cpu.jpg" alt="">
					<div class="caption">
						<h3>NO.1</h3>
						<p>Intel Pentium G3258 處理器</p>
						<p>
							<a href="#" class="btn btn-success" role="button">放入購物車</a> 
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="img/cpu.jpg" alt="">
					<div class="caption">
						<h3>NO.2</h3>
						<p>Intel Pentium G3258 處理器</p>
						<p>
							<a href="#" class="btn btn-success" role="button">放入購物車</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="img/cpu.jpg" alt="">
					<div class="caption">
						<h3>NO.3</h3>
						<p>Intel Pentium G3258 處理器</p>
						<p>
							<a href="#" class="btn btn-success" role="button">放入購物車</a> 
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- 主機板 MD -->
		<div class="row">
			<div class="col-sm-6 col-md-3">
				<a href="##" class="btn btn-primary btn-lg btn-circle">MD</a>
			</div>

			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="img/md.jpg" alt="">
					<div class="caption">
						<h3>NO.1</h3>
						<p>華碩 H97M-E 主機板</p>
						<p>
							<a href="#" class="btn btn-success" role="button">放入購物車</a> 
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="img/md.jpg" alt="">
					<div class="caption">
						<h3>NO.2</h3>
						<p>華碩 H97M-E 主機板</p>
						<p>
							<a href="#" class="btn btn-success" role="button">放入購物車</a> 
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="img/md.jpg" alt="">
					<div class="caption">
						<h3>NO.3</h3>
						<p>華碩 H97M-E 主機板</p>
						<p>
							<a href="#" class="btn btn-success" role="button">放入購物車</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- 硬碟/SSD HD -->
		<!-- 記憶體 RAM -->
		<!-- 顯示/繪圖卡 VGA -->
		<!-- 電源共應器 -->
		<!-- 電腦機殼 -->
		<!-- DVD燒錄器 -->
		<!-- CPU散熱風扇 -->
		<!-- 液晶螢幕 -->
		<!-- 鍵盤 -->
		<!-- 滑鼠 -->
		<!-- 喇叭 -->
		<!-- 作業系統 -->
		<!-- 網路卡 -->
		<!-- I/O卡 -->

		<!-- Footer -->
		<hr>
		<footer>
		<div class="row">
			<div class="col-lg-12">
				<p class="text-right">Copyright &copy; 2014 PROACTIVE</p>
			</div>
		</div>
		</footer>
	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.js"></script>
	<script src="js/bootstrap.min.js"></script>

	
	<script>
	$('.dropdown-toggle').dropdown()
	</script>

</body>

</html>
