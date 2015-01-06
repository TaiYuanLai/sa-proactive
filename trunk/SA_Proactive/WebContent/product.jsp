<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="database.*"%>
<%@ page import="bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
	String memberAccount = session.getAttribute("memberAccount") == null? "": (String) session.getAttribute("memberAccount");
%>
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
					<li class="active"><a href="product.jsp">買零件</a></li>
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
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><%=session.getAttribute("memberName")%><b
							class="caret"></b></a>
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
			List<ProductBean> productList = new ArrayList<ProductBean>();
				ProductDB productDB=new ProductDB();
				productList=productDB.getProductList();
		%>


		<div class="container productslogan">
			<h2>單買零件嗎? 來這裡可以瀏覽所有的商品喔!</h2>
		</div>

		<!-- Page Content -->
		<div class="container productcontent">

			<div class="tabbable">
				<!-- Only required for left/right tabs -->
				<!-- 商品nav -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab1" data-toggle="tab">中央處理器
							CPU</a></li>
					<li><a href="#tab2" data-toggle="tab">主機板 MD</a></li>
					<li><a href="#tab3" data-toggle="tab">硬碟/SSD HD</a></li>
					<li><a href="#tab4" data-toggle="tab">記憶體 RAM</a></li>
					<li><a href="#tab5" data-toggle="tab">顯示/繪圖卡 VGA</a></li>
					<li><a href="#tab6" data-toggle="tab">電源供應器</a></li>
					<li><a href="#tab7" data-toggle="tab">電腦機殼</a></li>
					<li><a href="#tab8" data-toggle="tab">DVD燒錄器</a></li>
					<li><a href="#tab9" data-toggle="tab">CPU散熱風扇</a></li>
					<li><a href="#tab10" data-toggle="tab">液晶螢幕</a></li>
					<li><a href="#tab11" data-toggle="tab">鍵盤</a></li>
					<li><a href="#tab12" data-toggle="tab">滑鼠</a></li>
					<li><a href="#tab13" data-toggle="tab">喇叭</a></li>
					<li><a href="#tab14" data-toggle="tab">作業系統</a></li>
					<li><a href="#tab15" data-toggle="tab">網路卡</a></li>
					<li><a href="#tab16" data-toggle="tab">I/O卡</a></li>
				</ul>

				<!-- 所有商品陳列 -->
				<div class="tab-content">
					<!-- 中央處理器 cpu -->
					<div class="tab-pane active" id="tab1">
						<div class="row">
							<%
								for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("中央處理器")){
							%>
							<div class="col-sm-6 col-md-3">
								<div class="product">
									<a href="productDetail.jsp?ID=<%=productBean.getProductID()%>">
										<div class="productimg">
											<img src="<%=productBean.getImage()%>" alt="">
										</div>
										<div class="productname">
											<p><%=productBean.getProductName()%></p>
										</div>
									</a>
								</div>
							</div>
							<%
								}
									}
							%>
						</div>
					</div>
					<!-- end of 中央處理器 cpu -->
					<!-- 主機板 MD -->
					<div class="tab-pane" id="tab2">
						<div class="row">
						<%
								for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("主機板")){
							%>

							<div class="col-sm-6 col-md-3">
								<div class="product">
									<a href="productDetail.jsp?ID=<%=productBean.getProductID()%>">
										<div class="productimg">
											<img src="<%=productBean.getImage()%>" alt="">
										</div>
										<div class="productname">
											<p><%=productBean.getProductName()%></p>
										</div>
									</a>
								</div>
							</div>
							<%
								}
									}
							%>
						</div>
					</div>
					<!-- end of 主機板 MD -->
					<div class="tab-pane" id="tab3">
						<div class="row">
						<%
								for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("硬碟/SSD")){
							%>

							<div class="col-sm-6 col-md-3">
								<div class="product">
									<a href="productDetail.jsp?ID=<%=productBean.getProductID()%>">
										<div class="productimg">
											<img src="<%=productBean.getImage()%>" alt="">
										</div>
										<div class="productname">
											<p><%=productBean.getProductName()%></p>
										</div>
									</a>
								</div>
							</div>
							<%
								}
									}
							%>
						</div>
					</div>
					<div class="tab-pane" id="tab4">
						<div class="row">
						<%
								for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("記憶體")){
							%>

							<div class="col-sm-6 col-md-3">
								<div class="product">
									<a href="productDetail.jsp?ID=<%=productBean.getProductID()%>">
										<div class="productimg">
											<img src="<%=productBean.getImage()%>" alt="">
										</div>
										<div class="productname">
											<p><%=productBean.getProductName()%></p>
										</div>
									</a>
								</div>
							</div>
							<%
								}
									}
							%>
						</div>
					</div>
					<div class="tab-pane" id="tab5">
						<div class="row">
						<%
								for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("顯示/繪圖卡")){
							%>

							<div class="col-sm-6 col-md-3">
								<div class="product">
									<a href="productDetail.jsp?ID=<%=productBean.getProductID()%>">
										<div class="productimg">
											<img src="<%=productBean.getImage()%>" alt="">
										</div>
										<div class="productname">
											<p><%=productBean.getProductName()%></p>
										</div>
									</a>
								</div>
							</div>
							<%
								}
									}
							%>
						</div>
					</div>
					<div class="tab-pane" id="tab6">
						<div class="row">
						<%
								for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("電源供應器")){
							%>

							<div class="col-sm-6 col-md-3">
								<div class="product">
									<a href="productDetail.jsp?ID=<%=productBean.getProductID()%>">
										<div class="productimg">
											<img src="<%=productBean.getImage()%>" alt="">
										</div>
										<div class="productname">
											<p><%=productBean.getProductName()%></p>
										</div>
									</a>
								</div>
							</div>
							<%
								}
									}
							%>
						</div>
					</div>
					<div class="tab-pane" id="tab7">
						<div class="row">
						<%
								for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("電腦機殼")){
							%>

							<div class="col-sm-6 col-md-3">
								<div class="product">
									<a href="productDetail.jsp?ID=<%=productBean.getProductID()%>">
										<div class="productimg">
											<img src="<%=productBean.getImage()%>" alt="">
										</div>
										<div class="productname">
											<p><%=productBean.getProductName()%></p>
										</div>
									</a>
								</div>
							</div>
							<%
								}
									}
							%>
						</div>
					</div>
					<div class="tab-pane" id="tab8">
						<div class="row">
						<%
								for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("DVD燒錄器")){
							%>

							<div class="col-sm-6 col-md-3">
								<div class="product">
									<a href="productDetail.jsp?ID=<%=productBean.getProductID()%>">
										<div class="productimg">
											<img src="<%=productBean.getImage()%>" alt="">
										</div>
										<div class="productname">
											<p><%=productBean.getProductName()%></p>
										</div>
									</a>
								</div>
							</div>
							<%
								}
									}
							%>
						</div>
					</div>
					<div class="tab-pane" id="tab9">
						<div class="row">
						<%
								for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("CPU散熱風扇")){
							%>

							<div class="col-sm-6 col-md-3">
								<div class="product">
									<a href="productDetail.jsp?ID=<%=productBean.getProductID()%>">
										<div class="productimg">
											<img src="<%=productBean.getImage()%>" alt="">
										</div>
										<div class="productname">
											<p><%=productBean.getProductName()%></p>
										</div>
									</a>
								</div>
							</div>
							<%
								}
									}
							%>
						</div>
					</div>
					<div class="tab-pane" id="tab10">
						<div class="row">
						<%
								for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("液晶螢幕")){
							%>

							<div class="col-sm-6 col-md-3">
								<div class="product">
									<a href="productDetail.jsp?ID=<%=productBean.getProductID()%>">
										<div class="productimg">
											<img src="<%=productBean.getImage()%>" alt="">
										</div>
										<div class="productname">
											<p><%=productBean.getProductName()%></p>
										</div>
									</a>
								</div>
							</div>
							<%
								}
									}
							%>
						</div>
					</div>
					<div class="tab-pane" id="tab11">
						<div class="row">
						<%
								for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("鍵盤")){
							%>

							<div class="col-sm-6 col-md-3">
								<div class="product">
									<a href="productDetail.jsp?ID=<%=productBean.getProductID()%>">
										<div class="productimg">
											<img src="<%=productBean.getImage()%>" alt="">
										</div>
										<div class="productname">
											<p><%=productBean.getProductName()%></p>
										</div>
									</a>
								</div>
							</div>
							<%
								}
									}
							%>
						</div>
					</div>
					<div class="tab-pane" id="tab12">
						<div class="row">
						<%
								for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("滑鼠")){
							%>

							<div class="col-sm-6 col-md-3">
								<div class="product">
									<a href="productDetail.jsp?ID=<%=productBean.getProductID()%>">
										<div class="productimg">
											<img src="<%=productBean.getImage()%>" alt="">
										</div>
										<div class="productname">
											<p><%=productBean.getProductName()%></p>
										</div>
									</a>
								</div>
							</div>
							<%
								}
									}
							%>
						</div>
					</div>
					<div class="tab-pane" id="tab13">
						<div class="row">
						<%
								for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("喇叭")){
							%>

							<div class="col-sm-6 col-md-3">
								<div class="product">
									<a href="productDetail.jsp?ID=<%=productBean.getProductID()%>">
										<div class="productimg">
											<img src="<%=productBean.getImage()%>" alt="">
										</div>
										<div class="productname">
											<p><%=productBean.getProductName()%></p>
										</div>
									</a>
								</div>
							</div>
							<%
								}
									}
							%>
						</div>
					</div>
					<div class="tab-pane" id="tab14">
						<div class="row">
						<%
								for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("作業系統")){
							%>

							<div class="col-sm-6 col-md-3">
								<div class="product">
									<a href="productDetail.jsp?ID=<%=productBean.getProductID()%>">
										<div class="productimg">
											<img src="<%=productBean.getImage()%>" alt="">
										</div>
										<div class="productname">
											<p><%=productBean.getProductName()%></p>
										</div>
									</a>
								</div>
							</div>
							<%
								}
									}
							%>
						</div>
					</div>
					<div class="tab-pane" id="tab15">
						<div class="row">
						<%
								for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("網路卡")){
							%>

							<div class="col-sm-6 col-md-3">
								<div class="product">
									<a href="productDetail.jsp?ID=<%=productBean.getProductID()%>">
										<div class="productimg">
											<img src="<%=productBean.getImage()%>" alt="">
										</div>
										<div class="productname">
											<p><%=productBean.getProductName()%></p>
										</div>
									</a>
								</div>
							</div>
							<%
								}
									}
							%>
						</div>
					</div>
					<div class="tab-pane" id="tab16">
						<div class="row">
						<%
								for(ProductBean productBean : productList){//簡化下方
									if(productBean.getProductType().equals("I/O")){
							%>

							<div class="col-sm-6 col-md-3">
								<div class="product">
									<a href="productDetail.jsp?ID=<%=productBean.getProductID()%>">
										<div class="productimg">
											<img src="<%=productBean.getImage()%>" alt="">
										</div>
										<div class="productname">
											<p><%=productBean.getProductName()%></p>
										</div>
									</a>
								</div>
							</div>
							<%
								}
									}
							%>
						</div>
					</div>
				</div>
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
	<!-- /bg -->

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
