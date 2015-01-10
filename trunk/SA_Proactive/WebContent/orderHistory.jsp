<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="database.*"%>
<%@ page import="bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>購物清單</title>
<link rel="shortcut icon" href="img/logo3.jpg">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/modern-business.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="shortcut icon" href="img/logo3.jpg">

</head>
<body>
<%
		if (session.getAttribute("memberAccount") != null) {
	%>
	<div class="productbg">
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
		
		
		<div class="container productslogan">
		<h2 class="cart_h2">
			<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>購物清單
		</h2>
		</div>
	<div class="container productcontent">		
		<caption>		
			<h3 class="cart_h3 cart_h3_chg">編號: </h3>
		</caption>
	
		<caption>		
			<h3 class="cart_h3 cart_h3_chg">零件區</h3>
		</caption>
		<%
			
		%>
		<table class="table table-hover cart_table">
			<thead>
				<tr>
					<td>ITEM</td>
					<td>QUANTITY</td>
					<td>PRICE</td>
				</tr>
			</thead>
			<tbody>
				<tr>  
					<td><a href=""> <img src=""
							class="shoppinglist_product" alt="">
					</a></td>
					<td></td>
					<td>$</td>
					
				</tr>
			</tbody>
		</table>
		<%
			}//for
		%>
		<caption>
			<h3 class="cart_h3">客製化組裝區</h3>
		</caption>
		<table class="table table-hover cart_table">
			<thead>
				<tr>
					<td>ITEM</td>
					<td>QUANTITY</td>
					<td>PRICE</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><a href=""> <img src=""
							class="shoppinglist_product" alt="">
					</a></td>
					<td></td>
					<td>$</td>
				</tr>
			</tbody>
		</table>
		<caption>
			<h3 class="cart_h3">優惠組合區</h3>
		</caption>
		<%
			
		%>
		<table class="table table-hover cart_table">
			<thead>
				<tr>
					<td>ITEM</td>
					<td>QUANTITY</td>
					<td>PRICE</td>
				</tr>
			</thead>
			<tbody>
			<tr>
					<td><a href=""> <img
							src="" class="shoppinglist_product"
							alt="">
					</a> </td>
					<td></td>
					<td>$</td>
					
				</tr>
			</tbody>
		</table>
		

		<div class="totalprice_div">
			<p>
				總金額: <span>$</span>
				<input type="hidden" value="" name="totalPrice">
			</p>
		</div>
<input class="btn btn-primary btn_cart" type="button" value="返回" onclick="location.href='order.jsp'">
		
		</form>
		</div>
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
	

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Script to Activate the Carousel -->
	<script>
		$('.dropdown-toggle').dropdown()
	</script>

	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript">
	
	
	
	</script>


</body>
</html>