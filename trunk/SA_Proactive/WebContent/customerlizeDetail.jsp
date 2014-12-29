<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<div class="detailbg">
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
				<a class="navbar-brand" href="index.html"> <span>PROACTIVE</span>
				</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-left navcolor">
					<li><a href="index.jsp">首頁</a></li>
					<li class="active"><a href="product.jsp">買零件</a></li>
					<li><a href="specialOffer.jsp">買優惠組合</a></li>
					<li><a href="customerlize1.jsp">客製化組裝</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right navcolor">
					<li class="active"><a href="cart.jsp"><span
						class="glyphicon glyphicon-shopping-cart"></span>購物車</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><%=session.getAttribute("memberName")%><b
						class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="modiPassword.jsp">修改密碼</a></li>
						<li><a href="order.jsp">訂單查詢</a></li>
						<li><a href="LogoutServlet">登出</a></li>
					</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container --> </nav>



		<!-- Page Content -->
		<div class="container">
			<div class="detail">
				<div class="row">
					<div class="col-md-12 detailtitle">
						<h2>我的組合1</h2>

					</div>
				</div>
				<div class="row">
					<div class="col-md-6 detailimg">
						<img src="img/cusimg.jpg" alt="">
					</div>
					<div class="col-md-6 detailcontent">
						<P>組合明細</P>
						<table class="table table-hover cart_table">
							<tr>
								<td>中央處理器</td>
								<td>INTEL Core I3-4130</td>
							</tr>
							<tr>
								<td>主機板</td>
								<td>ASROCK 960GC-GS FX</td>
							</tr>
							<tr>
								<td>硬碟</td>
								<td>Seagate 1TB/SATAIII/64M影音監控/5900R/3年</td>
							</tr>
							<tr>
								<td>記憶體</td>
								<td>Transcend DDR400 1G PC用</td>
							</tr>
							<tr>
								<td>顯示/繪圖卡</td>
								<td>GIGABYTE GV-R545-1GI</td>
							</tr>
							<tr>
								<td>電源供應器</td>
								<td>COOLER MASTER 350W/12CM 電源供應器</td>
							</tr>
							<tr>
								<td>電腦機殼</td>
								<td>COOLER MASTER 693</td>
							</tr>
							<tr>
								<td>DVD燒錄器</td>
								<td>ASUS DRW-24D3ST</td>
							</tr>
							<tr>
								<td>CPU散熱風扇</td>
								<td>AOC usa CPT12-9525EA 超靜音風扇LGA775</td>
							</tr>
							<tr>
								<td>總價</td>
								<td>$16888</td>
							</tr>
						</table>
						<input class="detailbtn1" type="button" value="確定組裝" onclick="{ if(confirm('確定組裝?'))location.href='customerlize1.jsp'}"> 
						<input class="detailbtn2" type="button" value="返回組裝" onclick="location.href='customerlize1.jsp'">
					</div>
				</div>
			</div>
		</div>
		<!--end of Page Content -->

		<!-- Footer -->
		<div class="container">
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
	</div>

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<!-- Script to Activate the Carousel -->
	<script>
		
	</script>

</body>

</html>
