<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="database.*"%>
<%@ page import="bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>購物車</title>
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
		if(session.getAttribute("memberAccount") != null){
	%>
	<!-- Navigation -->
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
			<a class="navbar-brand" href="index.jsp">
				<span>PROACTIVE</span>
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
				String memberAccount = session.getAttribute("memberAccount") == null?"":(String)session.getAttribute("memberAccount");
				String memberName = session.getAttribute("memberName").toString();
				MemberBean memberBean = new MemberBean();
				MemberDB memberDB = new MemberDB();
				memberBean = memberDB.getMember(memberAccount);
			%>
			
			<ul class="nav navbar-nav navbar-right navcolor">
				<li class="active"><a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>購物車</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"data-toggle="dropdown"><%=session.getAttribute("memberName")%><b class="caret"></b></a>
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
	<div class="container">
		<h2 class="cart_h2">
			<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Cart
		</h2>

		<form method="post" action="ModiQuantityServlet">
				<h3 class="cart_h3 cart_h3_chg">零件區</h3>
			</caption>
			<%
				ProductDB productDB=new ProductDB();
				List<ProductBean> allproduct = new ArrayList<ProductBean>();
				allproduct=productDB.getProductListByMemberAccount(memberAccount);
										
				for(ProductBean productBean : allproduct){
				%>
				
			<input type="hidden" name="productID" value="<%=productBean.getProductID()%>">
			<table class="table table-hover cart_table">
				<thead>
					<tr>
						<td>ITEM</td>
						<td>QUANTITY</td>
						<td>PRICE</td>
						<td>REMOVE</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<a href="productDetail.jsp?ID=<%=productBean.getProductID()%>">
					 			<img src="<%=productBean.getImage()%>" class="cart_product" alt="">
					 			<%=productBean.getProductName()%>
							</a></td>
						<td>
							<button type="button" class="glyphicon glyphicon-minus plus" aria-hidden="true"></button>
							<input type="text" class="cart_quantity" name="productQuantity" value=<%=productBean.getQuantity()%>>
							<button type="button" class="glyphicon glyphicon-plus plus" aria-hidden="true"></button>
						</td>
						<td>$<%=productBean.getUnitPrice()%></td>
						<td>
							<button type="button" class="icon_trash plus" onclick="doDelete1('<%=productBean.getProductID()%>','<%=memberAccount%>')">
								<span class="glyphicon glyphicon-trash"></span>
							</button>
						</td>
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
						<td>REMOVE</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<a href="customerlizeDetail.jsp">
					 			<img src="img/cusimg.jpg" class="cart_product" alt="">
					 			我的組合1
							</a>
						</td>
						<td>
							<button type="button" class="glyphicon glyphicon-minus plus" aria-hidden="true"></button>
							<input type="text" class="cart_quantity" value="1">
							<button type="button" class="glyphicon glyphicon-plus plus" aria-hidden="true"></button>
						</td>
						<td></td>
						<td>
							<button type="button" class="icon_trash plus" onclick="">
								<span class="glyphicon glyphicon-trash"></span>
							</button>
						</td>
					</tr>

				</tbody>
			</table>

			<caption>
				<h3 class="cart_h3">優惠組合區</h3>
			</caption>
			<%
				CombinationDB combinationDB=new CombinationDB();
				List<CombinationBean> allcombination = new ArrayList<CombinationBean>();
				allcombination=combinationDB.getCombinationListByMemberAccount(memberAccount);
										
				for(CombinationBean combinationBean : allcombination){
			%>
			<input type="hidden" name="combinationID" value="<%=combinationBean.getCombinationID()%>">
			<table class="table table-hover cart_table">
				<thead>
					<tr>
						<td>ITEM</td>
						<td>QUANTITY</td>
						<td>PRICE</td>
						<td>REMOVE</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
						<a href="combinationDetail.jsp?ID=<%=combinationBean.getCombinationID()%>">
								<img src="<%=combinationBean.getComImage()%>" class="cart_product" alt="">
								<%=combinationBean.getCombinationName()%>
						</a></td>

						<td>
							<button type="button" class="glyphicon glyphicon-minus plus" aria-hidden="true"></button>
							<input type="text" class="cart_quantity" name="combinationQuantity" value=<%=combinationBean.getQuantity()%>>
							<button type="button" class="glyphicon glyphicon-plus plus" aria-hidden="true"></button>
						</td>

						<td>$<%=combinationBean.getTotalPrice()%></td>
						<td>
							<button type="button" class="icon_trash plus" onclick="doDelete('<%=combinationBean.getCombinationID()%>','<%=memberAccount%>')">
								<span class="glyphicon glyphicon-trash"></span>
							</button>
						</td>
					</tr>
				</tbody>
			</table>
			<%
				}//for
			%>
			<p>
				<a class="btn btn-primary btn_cart" href="product.jsp">繼續挑選</a> 
				<button type="submit" class="btn btn-danger btn_cart">下一步</button>
			</p>
		</form>
		<footer>
		<div class="row">
			<div class="col-lg-12">
				<p class="text-right">Copyright &copy; 2014 PROACTIVE</p>
			</div>
		</div>
		</footer>
	</div>
	
	<form action="DelCartServlet" method="post" id="delForm1">
		<input type="hidden" name="productID" id="productID">
		<input type="hidden" name="memberAccount" id="memberAccount">
	</form>
	
	<form action="DelCartCombinationServlet" method="post" id="delForm">
		<input type="hidden" name="combinationID" id="combinationID">
		<input type="hidden" name="memberAccount" id="memberAccount">
	</form>



	<%
		}//if
		else
			response.sendRedirect("login.jsp");
	%>






	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Script to Activate the Carousel -->
	<script>
		$('.dropdown-toggle').dropdown();
	</script>

	<script type="text/javascript">
	
		function doDelete1(productID, memberAccount) {
			var r = confirm("是否刪除?");
			if (r == true) {
				$("#productID").val(productID);
				$("#memberAccount").val(memberAccount);
				$("#delForm1").submit();
			}
		}
		
		function doDelete(combinationID, memberAccount) {
			var r = confirm("是否刪除?");
			if (r == true) {
				$("#combinationID").val(combinationID);
				$("#memberAccount").val(memberAccount);
				$("#delForm").submit();
			}
		}

		$('.glyphicon-minus').on('click', function() {
			var count = $(this).siblings(".cart_quantity");
			var val = parseInt(count.val());
			if (val > 1)
				count.val(val - 1);
		});
		$('.glyphicon-plus').on('click', function() {
			var count = $(this).siblings(".cart_quantity");
			var val = parseInt(count.val());
			count.val(val + 1);
			if (val >= 5)
				count.val(val);
		});
	</script>

</body>
</html>