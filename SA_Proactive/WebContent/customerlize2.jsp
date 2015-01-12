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
		<%
			List<ProductBean> productList = new ArrayList<ProductBean>();
				ProductDB productDB=new ProductDB();
				productList=productDB.getProductList();
		%>

		<div class="container productslogan">
			<h2>
				想要花一樣的經費,卻擁有比品牌電腦更高檔的配備嗎?
				<h2>組一台自己的電腦吧!</h2>
		</div>


		<!-- Page Content -->
		<form action="AddOtherServlet" method="post">
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

					<div class="cus2 clearfix">
						<div class="col-md-12 cpu_select">
							<span>主機板</span> <select name="BoardID">
								<%
									for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("主機板")){
								%>
								<option value="<%=productBean.getProductID()%>">
									<%=productBean.getProductName()%> ($<%=productBean.getUnitPrice()%>)
								</option>
								<%
									}
																					}
								%>
							</select>
						</div>
						<div class="col-md-12 cpu_select">
							<span>硬碟/SSD</span> <select name="SSDID">
								<%
									for(ProductBean productBean : productList){//簡化下方
															if(productBean.getProductType().equals("硬碟/SSD")){
								%>
								<option value="<%=productBean.getProductID()%>">
									<%=productBean.getProductName()%> ($<%=productBean.getUnitPrice()%>)
								</option>
								<%
									}
																					}
								%>
							</select>

						</div>
						<div class="col-md-12 cpu_select">
							<span>記憶體</span> <select name="MemoryID">
								<%
									for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("記憶體")){
								%>
								<option value="<%=productBean.getProductID()%>">
									<%=productBean.getProductName()%> ($<%=productBean.getUnitPrice()%>)
								</option>
								<%
									}
																					}
								%>
							</select>
						</div>
						<div class="col-md-12 cpu_select">
							<span>顯示/繪圖卡</span> <select name="DisplayCardID">
								<%
									for(ProductBean productBean : productList){//簡化下方
															if(productBean.getProductType().equals("顯示/繪圖卡")){
								%>
								<option value="<%=productBean.getProductID()%>">
									<%=productBean.getProductName()%> ($<%=productBean.getUnitPrice()%>)
								</option>
								<%
									}
																					}
								%>
							</select>
						</div>
						<div class="col-md-12 cpu_select">
							<span>電源供應器</span> <select name="PowerID">
								<%
									for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("電源供應器")){
								%>
								<option value="<%=productBean.getProductID()%>">
									<%=productBean.getProductName()%> ($<%=productBean.getUnitPrice()%>)
								</option>
								<%
									}
																					}
								%>

							</select>
						</div>
						<div class="col-md-12 cpu_select">
							<span>電腦機殼</span> <select name="CaseID">
								<%
									for(ProductBean productBean : productList){//簡化下方
																					if(productBean.getProductType().equals("電腦機殼")){
								%>
								<option value="<%=productBean.getProductID()%>">
									<%=productBean.getProductName()%> ($<%=productBean.getUnitPrice()%>)
								</option>
								<%
									}
																					}
								%>
							</select>
						</div>
						<div class="col-md-12 cpu_select">
							<span>DVD燒錄器</span> <select name="DVDID">
								<%
									for(ProductBean productBean : productList){//簡化下方
															if(productBean.getProductType().equals("DVD燒錄器")){
								%>
								<option value="<%=productBean.getProductID()%>">
									<%=productBean.getProductName()%> ($<%=productBean.getUnitPrice()%>)
								</option>
								<%
									}
																					}
								%>
							</select>

						</div>
						<div class="col-md-12 cpu_select">
							<span>CPU散熱風扇</span> <select name="FanID">
								<%
									for(ProductBean productBean : productList){//簡化下方
																					if(productBean.getProductType().equals("CPU散熱風扇")){
								%>
								<option value="<%=productBean.getProductID()%>">

									<%=productBean.getProductName()%> ($<%=productBean.getUnitPrice()%>)
								</option>
								<%
									}
																					}
								%>

							</select>
							<br>
							<div style="font-size: 20px; font-weight: bold; margin: 50px 0;">
								<input type="checkbox" name="check" id="check">是否組裝($400)
							</div>
						</div>
						
					</div>
					<!-- Step3 -->
				</div>
                
				<input type="submit" class="col-md-2 detailbtn3" value="完成" />
				<!-- 				<div class="col-md-2 cus_next2"> -->
				<!-- 					<a href="customerlizeDetail.jsp"> -->
				<!-- 						<p>完成</p> -->
				<!-- 					</a> -->
				<!-- 				</div> -->



			</div>
		</form>
		<!-- Page Content -->
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
