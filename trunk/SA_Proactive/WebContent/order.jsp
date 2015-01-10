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
	<!-- Navigation -->
	<div class="productbg">
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
				<%
					String memberAccount = session.getAttribute("memberAccount").toString();
										String memberName = session.getAttribute("memberName").toString();
										MemberBean memberBean = new MemberBean();
										MemberDB memberDB = new MemberDB();
										memberBean = memberDB.getMember(memberAccount);
				%>
				<ul class="nav navbar-nav navbar-right navcolor">
					<li><a href="cart.jsp"><span
							class="glyphicon glyphicon-shopping-cart"></span>購物車</a></li>
					<li class="dropdown active"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><%=session.getAttribute("memberName")%><b
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
		<%
			List<OrderBean> orderList = new ArrayList<OrderBean>();
			OrderDB orderDB=new OrderDB();
			orderList=orderDB.getOrderList();
		%>

		<div class="container productslogan">
			<h2 class="cart_h2">
				<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>歷史訂單
			</h2>
		</div>
		<div class="container productcontent">
			<!-- <caption><h3 class="cart_h3 cart_h3_chg"></h3></caption> -->
			
			
			<table class="table table-hover cart_table" >
				<%
					if(orderList.size()==0){
				%>

				<p>尚未有任何購買紀錄</p>
				<%
					} else{
				%>
				<thead>
				
					<tr>
						<td>訂單編號</td>
						<td>日期</td>
						<td>總價</td>
						<td>狀態</td>
					</tr>
				</thead>
				<tbody>
					<%
						for(OrderBean orderBean : orderList){//簡化下方
					%>
				
					<tr data-href="orderHistory.jsp">
						<td><%=orderBean.getOrderID()%></td>
						<td><%=orderBean.getOrderDate()%></td>
						<td>$<%=orderBean.getTotalPrice()%></td>
						<%
							if(orderBean.getOrderState()==0){
						%>
						<td><span class="order_span">未付款</span></td>
						<%
							}
										if(orderBean.getOrderState()==1){
						%>
						<td><span class="order_span">已付款</span></td>

						<%
							}
						%>

					</tr>
					
					<%
						}
							}
					%>
					
				</tbody>
			</table>
			
		</div>
		<br> <br> <br> <br> <br> <br>


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
		$('.dropdown-toggle').dropdown()</script>
		<script>
		$(document).ready(function(){
    $('table tr').click(function(){
        window.location = $(this).data('href');
        return false;
    });
});
	</script>
</body>
</html>