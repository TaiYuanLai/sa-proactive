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
	<%
		if (session.getAttribute("memberAccount") != null) {
	%>

	<div class="cus_bg">

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
					<li><a href="index.jsp">首頁</a></li>
					<li><a href="product.jsp">買零件</a></li>
					<li><a href="specialOffer.jsp">買優惠組合</a></li>
					<li class="active"><a href="customerlize1.jsp">客製化組裝</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right navcolor">
					<li><a href="cart.jsp"><span
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

		<div class="container productslogan">
			<h2>
				想要花一樣的經費,卻擁有比品牌電腦更高檔的配備嗎?
				<h2>組一台自己的電腦吧!</h2>
		</div>


		<!-- Page Content -->
		<div class="container cus_content">

			<div class="row">
				<!-- Step3 -->
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12 cusstep">
							<div class="cus_step text-center">
								<span>Step1 選擇CPU廠牌 / </span> <span>Step2 選擇CPU型號 / </span> <span
									class="cus_step_1">Step3 選擇其他組裝零件</span>
							</div>
						</div>
					</div>
				</div>

				<div class="cus2">
					<div class="col-md-12 cpu_select">
						<span>主機板</span> <select>
							<option>ASROCK 960GC-GS FX</option>
							<option>MSI 760GA-P43</option>
							<option>ASUS M5A97</option>
							<option>ASUS CROSSHAIR V FORMULA-Z</option>
							<option>ASUS B85M-E</option>
						</select>
					</div>
					<div class="col-md-12 cpu_select">
						<span>硬碟/SSD</span> <select>
							<option>WD 500G/SATAIII/64M/7200R RE企業級/5年硬碟</option>
							<option>Seagate 1TB/SATAIII/64M影音監控/5900R/3年</option>
							<option>TOSHIBA 1TB/SATA3/64M/Harrier企業級/5年硬碟</option>
							<option>Seagate 2TB/SATAIII/64M影音監控/5900R/3年</option>
							<option>WD2.5"750G/SATAIII/16M/7200R/5年硬碟</option>
						</select>
					</div>
					<div class="col-md-12 cpu_select">
						<span>記憶體</span> <select>
							<option>Transcend DDR400 1G PC用</option>
							<option>DDR2 800 2G PC用</option>
							<option>Kingston DDR3 1333 2G PC用</option>
							<option>美光 DDR4 2133 4G 288PIN記憶體</option>
							<option>Kingston DDR3 1866 8G HyperX FURY超頻(藍)</option>
						</select>
					</div>
					<div class="col-md-12 cpu_select">
						<span>顯示/繪圖卡</span> <select>
							<option>Transcend DDR400 1G PC用</option>
							<option>DDR2 800 2G PC用</option>
							<option>Kingston DDR3 1333 2G PC用</option>
							<option>美光 DDR4 2133 4G 288PIN記憶體</option>
							<option>Kingston DDR3 1866 8G HyperX FURY超頻(藍)</option>
						</select>
					</div>
					<div class="col-md-12 cpu_select">
						<span>電源供應器</span> <select>
							<option>Transcend DDR400 1G PC用</option>
							<option>DDR2 800 2G PC用</option>
							<option>Kingston DDR3 1333 2G PC用</option>
							<option>美光 DDR4 2133 4G 288PIN記憶體</option>
							<option>Kingston DDR3 1866 8G HyperX FURY超頻(藍)</option>
						</select>
					</div>
					<div class="col-md-12 cpu_select">
						<span>電腦機殼</span> <select>
							<option>Transcend DDR400 1G PC用</option>
							<option>DDR2 800 2G PC用</option>
							<option>Kingston DDR3 1333 2G PC用</option>
							<option>美光 DDR4 2133 4G 288PIN記憶體</option>
							<option>Kingston DDR3 1866 8G HyperX FURY超頻(藍)</option>
						</select>
					</div>
					<div class="col-md-12 cpu_select">
						<span>DVD燒錄器</span> <select>
							<option>Transcend DDR400 1G PC用</option>
							<option>DDR2 800 2G PC用</option>
							<option>Kingston DDR3 1333 2G PC用</option>
							<option>美光 DDR4 2133 4G 288PIN記憶體</option>
							<option>Kingston DDR3 1866 8G HyperX FURY超頻(藍)</option>
						</select>
					</div>
					<div class="col-md-12 cpu_select">
						<span>CPU散熱風扇</span> <select>
							<option>Transcend DDR400 1G PC用</option>
							<option>DDR2 800 2G PC用</option>
							<option>Kingston DDR3 1333 2G PC用</option>
							<option>美光 DDR4 2133 4G 288PIN記憶體</option>
							<option>Kingston DDR3 1866 8G HyperX FURY超頻(藍)</option>
						</select>
					</div>
				</div>
				<!-- Step3 -->
			</div>


			<div class="col-md-2 cus_next2">
				<a href="customerlizeDetail.jsp">
					<p>完成</p>
				</a>
			</div>



		</div>

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

	</div>
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
	<script src="js/bootstrap.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script>
		$('.dropdown-toggle').dropdown()
	</script>


</body>

</html>
