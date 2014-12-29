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
				<a class="navbar-brand" href="index.jsp"> <span>PROACTIVE</span>
				</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-left navcolor">
					<li><a href="index.jsp">首頁</a></li>
					<li><a href="product.jsp">買零件</a></li>
					<li class="active"><a href="specialOffer.jsp">買優惠組合</a></li>
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
					<li><a href="cart.jsp"><span
							class="glyphicon glyphicon-shopping-cart"></span>購物車</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=session.getAttribute("memberName")%><b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="modiPassword.jsp">修改密碼</a></li>
							<li><a href="order.jsp">訂單查詢</a></li>
							<li><a href="LogoutServlet">登出</a></li>
						</ul></li>
					<%
						}
					%>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container --> </nav>
		<%
			List<CombinationBean> combinationList = new ArrayList<CombinationBean>();
			CombinationDB combinationDB=new CombinationDB();
			combinationList=combinationDB.getCombinationList();
			
		%>
		
		<div class="offerslogan">
			<div class="offerslogan2">
				<h2>有特殊的電腦需求嗎? 快來看看我們為您準備的優惠組合吧!</h2>
			</div>
		</div>

		<!-- Page Content -->
		<div class="container">

			<div class="row">
			<%
					for(CombinationBean combinationBean:combinationList){
				%>

				<div class="offer clearfix">
					<a href="combinationDetail.jsp?ID=<%=combinationBean.getCombinationID()%>">
						<div class="col-md-12 col-sm-12">
							<div class="offer_pic">
								<img src="<%=combinationBean.getComImage()%>" alt="">
							</div>

							<div class="col-md-8 col-sm-8 offer_describe">
								<h4><%=combinationBean.getCombinationName()%></h4>
								<p><%=combinationBean.getCombinationDescription()%></p>
							</div>

							<div class="col-md-2 col-sm-2 offer_price  text-center">
								$<%=combinationBean.getTotalPrice()%></div>
						</div>
					</a>
				</div>
				<%
					}
				%>			
			</div>

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
	</div>

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<!-- Script to Activate the Carousel -->
	<script>
	$('.dropdown-toggle').dropdown();
	</script>

</body>

</html>
