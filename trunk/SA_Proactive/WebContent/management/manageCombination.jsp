<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="database.*"%>
<%@ page import="bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>後台-優惠組合管理</title>
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
		if (session.getAttribute("managerAccount") != null) {
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
			<a class="navbar-brand" href="manageProduct.jsp"> <span>PROACTIVE</span>後台管理系統
			</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-left navcolor">
				<li><a href="manageProduct.jsp">產品管理</a></li>
				<li class="active"><a href="manageCombination.jsp">優惠組合管理</a></li>
				<li><a href="manageHot.jsp">熱銷資訊管理</a></li>
				<li><a href="sales.jsp">分析銷售量</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right navcolor">

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><%=session.getAttribute("managerName")%><b
						class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="manageOrder.jsp">訂單管理</a></li>
						<li><a href="../MLogoutServlet">登出</a></li>
					</ul></li>
			</ul>
		</div>

	</div>
	<!-- /.container --> </nav>

	<%
		List<CombinationBean> combinationList = new ArrayList<CombinationBean>();
			CombinationDB combinationDB=new CombinationDB();
			combinationList=combinationDB.getCombinationList();
	%>

	<div class="container_reg">
		<div class="container">
			<div class="col-lg-12 orderbg">
				<div class="col-lg-12 orderhead">
					<h1>
						<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
						優惠組合管理
					</h1>
				</div>

				<div class="col-lg-15 ">
					<table class="table table-hover cart_table">
						<thead>
							<tr>
								<td><h4>組合編號</h4></td>
								<td><h4>組合名稱</h4></td>
								<td><h4>總金額</h4></td>
								<td><h4>編輯</h4></td>
							</tr>
						</thead>
						<tbody>

							<%
								for(CombinationBean combinationBean:combinationList){
							%>
							<tr>
								<td>
									<h4><%=combinationBean.getCombinationID()%></h4>
								</td>
								<td>
									<h4><%=combinationBean.getCombinationName()%></h4>
								</td>

								<td>
									<h4><%=combinationBean.getTotalPrice()%></h4>
								</td>
								<td>
									<input type="button" value="編輯"onclick="location.href='modiCombination.jsp?ID=<%=combinationBean.getCombinationID()%>'"
									style="width: 100px; height: 30px; font-size: 15px;" class="modiCombi_btn">
								</td>
							</tr>
							<%
								}
							%>

						</tbody>
					</table>
				</div>

			</div>

		</div>

		<div class="container">
			<footer class="footer_order">
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
	<script src="js/bootstrap.min.js"></script>

	<!-- Script to Activate the Carousel -->
	<script>
	$('.dropdown-toggle').dropdown();
	</script>

</body>
</html>