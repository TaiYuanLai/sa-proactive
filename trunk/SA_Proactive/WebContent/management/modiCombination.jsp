<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="database.*"%>
<%@ page import="bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>後台-修改優惠組合</title>
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
			<a class="navbar-brand" href="login.jsp"> <span>PROACTIVE</span>後台管理系統
			</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-left navcolor">
				<li><a href="manageProduct.jsp">產品管理</a></li>
				<li class="active"><a href="manageCombination.jsp">優惠組合管理</a></li>
				<li><a href="manageHot.jsp">熱銷資訊管理</a></li>
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


	<div class="container_reg">

		<form action="">
			<div class="container">
				<div class="col-lg-12 orderbg modi">
					<div class="detail">
						<div class="row">
							<div class="col-md-12 detailtitle">
								<h2>優惠組合A</h2>
								<p>組合敘述組合敘述組合敘述組合敘述組合敘述組合敘述組合敘述組合敘述組合敘述</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 detailimg">
								<img src="img/cusbg.jpg" alt="">
							</div>
							<div class="col-md-6 detailcontent">
								<P>組合明細</P>
								<table class="table table-hover cart_table">
									<tr>
										<td>中央處理器</td>
										<td><select name="" id="">
												<option value="">INTEL Core I3-4130</option>
												<option value="">INTEL Core I3-4130</option>
												<option value="">INTEL Core I3-4130</option>
										</select></td>
									</tr>
									<tr>
										<td>主機板</td>
										<td><select name="" id="">
												<option value="">INTEL Core I3-4130</option>
												<option value="">INTEL Core I3-4130</option>
												<option value="">INTEL Core I3-4130</option>
										</select></td>
									</tr>
									<tr>
										<td>硬碟</td>
										<td><select name="" id="">
												<option value="">INTEL Core I3-4130</option>
												<option value="">INTEL Core I3-4130</option>
												<option value="">INTEL Core I3-4130</option>
										</select></td>
									</tr>
									<tr>
										<td>記憶體</td>
										<td><select name="" id="">
												<option value="">INTEL Core I3-4130</option>
												<option value="">INTEL Core I3-4130</option>
												<option value="">INTEL Core I3-4130</option>
										</select></td>
									</tr>
									<tr>
										<td>顯示/繪圖卡</td>
										<td><select name="" id="">
												<option value="">INTEL Core I3-4130</option>
												<option value="">INTEL Core I3-4130</option>
												<option value="">INTEL Core I3-4130</option>
										</select></td>
									</tr>
									<tr>
										<td>電源供應器</td>
										<td><select name="" id="">
												<option value="">INTEL Core I3-4130</option>
												<option value="">INTEL Core I3-4130</option>
												<option value="">INTEL Core I3-4130</option>
										</select></td>
									</tr>
									<tr>
										<td>電腦機殼</td>
										<td><select name="" id="">
												<option value="">INTEL Core I3-4130</option>
												<option value="">INTEL Core I3-4130</option>
												<option value="">INTEL Core I3-4130</option>
										</select></td>
									</tr>
									<tr>
										<td>DVD燒錄器</td>
										<td><select name="" id="">
												<option value="">INTEL Core I3-4130</option>
												<option value="">INTEL Core I3-4130</option>
												<option value="">INTEL Core I3-4130</option>
										</select></td>
									</tr>
									<tr>
										<td>CPU散熱風扇</td>
										<td><select name="" id="">
												<option value="">INTEL Core I3-4130</option>
												<option value="">INTEL Core I3-4130</option>
												<option value="">INTEL Core I3-4130</option>
										</select></td>
									</tr>
								</table>
								<input class="detailbtn1 detailbtn1_re" type="button" value="修改">
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>

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