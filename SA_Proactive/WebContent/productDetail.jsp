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

<title>PROACTIVE買零件</title>
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
<%
	String memberAccount = session.getAttribute("memberAccount") == null? "": (String) session.getAttribute("memberAccount");
	String productID = request.getParameter("ID");
	ProductDB productDB = new ProductDB();
	ProductBean productBean = productDB.getProduct(productID);
	String msg = "";
%>

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
					<%
						}
					%>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container --> </nav>
		<form action="AddCartServlet" method="post" id="addForm">
			<input type="hidden" id="msg" value="<%=msg%>"> 
			<input type="hidden" id="ProductName" name="ProductName" value="<%=productBean.getProductName()%>"> 
			<input type="hidden" name="ProductID" value="<%=productID%>">
		</form>

		<!-- Page Content -->
		<div class="container">
			<div class="detail">
				<div class="row">
					<div class="col-md-12 detailtitle">
						<h2><%=productBean.getProductName()%></h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 detailimg">
						<img src="<%=productBean.getImage()%>" alt="">
					</div>
					<div class="col-md-6 detailcontent">
						<P>產品明細</P>
						<!-- 中央處理器 -->
						<%
							if (productBean.getProductType().equals("中央處理器")) {
						%>
						<table class="table table-hover cart_table">
							<tr>
								<td>廠牌</td>
								<td><%=productBean.getProductBrand()%></td>
							</tr>
							<tr>
								<td>Clock</td>
								<td><%=productBean.getClock()%></td>
							</tr>
							<tr>
								<td>ProcessorSocket</td>
								<td><%=productBean.getProcessorSocket()%></td>
							</tr>
							<tr>
								<td>核心數</td>
								<td><%=productBean.getSpecifications()%></td>
							</tr>
							<tr>
								<td>Cache</td>
								<td><%=productBean.getCache()%></td>
							</tr>
							<tr>
								<td>單價</td>
								<td>$<%=productBean.getUnitPrice()%></td>
							</tr>
							<tr>
								<td>保固期</td>
								<td><%=productBean.getWarranty()%></td>
							</tr>
						</table>
						<%
							}
						%>

						<!-- 主機板 -->
						<%
							if (productBean.getProductType().equals("主機板")) {
						%>

						<table class="table table-hover cart_table">

							<tr>
								<td>廠牌</td>
								<td><%=productBean.getProductBrand()%></td>
							</tr>
							<tr>
								<td>Chipset</td>
								<td><%=productBean.getChipset()%></td>
							</tr>
							<tr>
								<td>ProcessorSocket</td>
								<td><%=productBean.getProcessorSocket()%></td>
							</tr>
							<tr>
								<td>MemorySlot</td>
								<td><%=productBean.getMemorySlot()%></td>
							</tr>
							<tr>
								<td>DriveSpecifications</td>
								<td><%=productBean.getDriveSpecifications()%></td>
							</tr>
							<tr>
								<td>ExpansionSlot</td>
								<td><%=productBean.getExpansionSlot()%></td>
							</tr>
							<tr>
								<td>大小</td>
								<td><%=productBean.getSize()%></td>
							</tr>
							<tr>
								<td>單價</td>
								<td>$<%=productBean.getUnitPrice()%></td>
							</tr>
							<tr>
								<td>保固</td>
								<td><%=productBean.getWarranty()%></td>
							</tr>
						</table>
						<%
							}
						%>
						<!-- 硬碟/SSD -->
						<%
							if (productBean.getProductType().equals("硬碟/SSD")) {
						%>
						<table class="table table-hover cart_table">

							<tr>
								<td>廠牌</td>
								<td><%=productBean.getProductBrand()%></td>
							</tr>
							<tr>
								<td>DriveSpecifications</td>
								<td><%=productBean.getDriveSpecifications()%></td>
							</tr>
							<tr>
								<td>Specifications</td>
								<td><%=productBean.getSpecifications()%></td>
							</tr>
							<tr>
								<td>WRSpeed</td>
								<td><%=productBean.getWRSpeed()%></td>
							</tr>
							<tr>
								<td>Speed</td>
								<td><%=productBean.getSpeed()%></td>
							</tr>

							<tr>
								<td>記憶體大小</td>
								<td><%=productBean.getMemorySize()%></td>
							</tr>
							<tr>
								<td>大小</td>
								<td><%=productBean.getSize()%></td>
							</tr>
							<tr>
								<td>單價</td>
								<td>$<%=productBean.getUnitPrice()%></td>
							</tr>
							<tr>
								<td>保固</td>
								<td><%=productBean.getWarranty()%></td>
							</tr>
						</table>
						<%
							}
						%>


						<!-- 記憶體 -->
						<%
							if (productBean.getProductType().equals("記憶體")) {
						%>

						<table class="table table-hover cart_table">

							<tr>
								<td>廠牌</td>
								<td><%=productBean.getProductBrand()%></td>
							</tr>
							<tr>
								<td>Clock</td>
								<td><%=productBean.getClock()%></td>
							</tr>
							<tr>
								<td>MemorySlot</td>
								<td><%=productBean.getMemorySlot()%></td>
							</tr>
							<tr>
								<td>Pinnumber</td>
								<td><%=productBean.getPinNumber()%></td>
							</tr>
							<tr>
								<td>MemorySize</td>
								<td><%=productBean.getMemorySize()%></td>
							</tr>
							<tr>
								<td>單價</td>
								<td>$<%=productBean.getUnitPrice()%></td>
							</tr>

							<tr>
								<td>保固</td>
								<td><%=productBean.getWarranty()%></td>
							</tr>
						</table>
						<%
							}
						%>
						<!-- 顯示/繪圖卡-->
						<%
							if (productBean.getProductType().equals("顯示/繪圖卡")) {
						%>
						<table class="table table-hover cart_table">

							<tr>
								<td>廠牌</td>
								<td><%=productBean.getProductBrand()%></td>
							</tr>
							<tr>
								<td>Chipset</td>
								<td><%=productBean.getChipset()%></td>
							</tr>
							<tr>
								<td>MemorySlot</td>
								<td><%=productBean.getMemorySlot()%></td>
							</tr>
							<tr>
								<td>ExpansionSlot</td>
								<td><%=productBean.getExpansionSlot()%></td>
							</tr>
							<tr>
								<td>CPU</td>
								<td><%=productBean.getGPU()%></td>
							</tr>
							<tr>
								<td>記憶體大小</td>
								<td><%=productBean.getMemorySize()%></td>
							</tr>
							<tr>
								<td>單價</td>
								<td>$<%=productBean.getUnitPrice()%></td>
							</tr>
							<tr>
								<td>保固</td>
								<td><%=productBean.getWarranty()%></td>
							</tr>
						</table>
						<%
							}
						%>
						<!-- 電源供應器-->
						<%
							if (productBean.getProductType().equals("電源供應器")) {
						%>
						<table class="table table-hover cart_table">

							<tr>
								<td>廠牌</td>
								<td><%=productBean.getProductBrand()%></td>
							</tr>
							<tr>
								<td>ExpansionSlot</td>
								<td><%=productBean.getExpansionSlot()%></td>
							</tr>
							<tr>
								<td>大小</td>
								<td><%=productBean.getSize()%></td>
							</tr>
							<tr>
								<td>Wattage</td>
								<td><%=productBean.getWattage()%></td>
							</tr>

							<tr>
								<td>單價</td>
								<td>$<%=productBean.getUnitPrice()%></td>
							</tr>
							<tr>
								<td>保固</td>
								<td><%=productBean.getWarranty()%></td>
							</tr>
						</table>
						<%
							}
						%>
						<!-- 電腦機殼-->
						<%
							if (productBean.getProductType().equals("電腦機殼")) {
						%>
						<table class="table table-hover cart_table">

							<tr>
								<td>廠牌</td>
								<td><%=productBean.getProductBrand()%></td>
							</tr>
							<tr>
								<td>Specifications</td>
								<td><%=productBean.getSpecifications()%></td>
							</tr>
							<tr>
								<td>ExpansionSlot</td>
								<td><%=productBean.getExpansionSlot()%></td>
							</tr>
							<tr>
								<td>顏色</td>
								<td><%=productBean.getColor()%></td>
							</tr>
							<tr>
								<td>大小</td>
								<td><%=productBean.getSize()%></td>
							</tr>
							<tr>
								<td>單價</td>
								<td>$<%=productBean.getUnitPrice()%></td>
							</tr>

						</table>
						<%
							}
						%>
						<!-- DVD燒錄器-->
						<%
							if (productBean.getProductType().equals("DVD燒錄器")) {
						%>

						<table class="table table-hover cart_table">

							<tr>
								<td>廠牌</td>
								<td><%=productBean.getProductBrand()%></td>
							</tr>
							<tr>
								<td>DriveSpecifications</td>
								<td><%=productBean.getDriveSpecifications()%></td>
							</tr>
							<tr>
								<td>Specifications</td>
								<td><%=productBean.getSpecifications()%></td>
							</tr>
							<tr>
								<td>顏色</td>
								<td><%=productBean.getColor()%></td>
							</tr>

							<tr>
								<td>單價</td>
								<td>$<%=productBean.getUnitPrice()%></td>
							</tr>
							<tr>
								<td>保固</td>
								<td><%=productBean.getWarranty()%></td>
							</tr>
						</table>
						<%
							}
						%>

						<!-- CPU散熱風扇  -->
						<%
							if (productBean.getProductType().equals("CPU散熱風扇")) {
						%>


						<table class="table table-hover cart_table">

							<tr>
								<td>廠牌</td>
								<td><%=productBean.getProductBrand()%></td>
							</tr>
							<tr>
								<td>CPUSlot</td>
								<td><%=productBean.getCPUSlot()%></td>
							</tr>
							<tr>
								<td>Speed</td>
								<td><%=productBean.getSpeed()%></td>
							</tr>
							<tr>
								<td>Noise</td>
								<td><%=productBean.getNoise()%></td>
							</tr>

							<tr>
								<td>單價</td>
								<td>$<%=productBean.getUnitPrice()%></td>
							</tr>

						</table>

						<%
							}
						%>

						<!-- 液晶螢幕  -->
						<%
							if (productBean.getProductType().equals("液晶螢幕")) {
						%>


						<table class="table table-hover cart_table">

							<tr>
								<td>廠牌</td>
								<td><%=productBean.getProductBrand()%></td>
							</tr>
							<tr>
								<td>顏色</td>
								<td><%=productBean.getColor()%></td>
							</tr>
							<tr>
								<td>大小</td>
								<td><%=productBean.getSize()%></td>
							</tr>

							<tr>
								<td>單價</td>
								<td>$<%=productBean.getUnitPrice()%></td>
							</tr>
							<tr>
								<td>保固</td>
								<td><%=productBean.getWarranty()%></td>
							</tr>
						</table>
						<%
							}
						%>

						<!-- 鍵盤  -->
						<%
							if (productBean.getProductType().equals("鍵盤")) {
						%>


						<table class="table table-hover cart_table">

							<tr>
								<td>廠牌</td>
								<td><%=productBean.getProductBrand()%></td>
							</tr>
							<tr>
								<td>Specifications</td>
								<td><%=productBean.getSpecifications()%></td>
							</tr>
							<tr>
								<td>顏色</td>
								<td><%=productBean.getColor()%></td>
							</tr>
							<tr>
								<td>單價</td>
								<td>$<%=productBean.getUnitPrice()%></td>
							</tr>

							<tr>
								<td>保固</td>
								<td><%=productBean.getWarranty()%></td>
							</tr>
						</table>
						<%
							}
						%>

						<!-- 滑鼠  -->
						<%
							if (productBean.getProductType().equals("滑鼠")) {
						%>


						<table class="table table-hover cart_table">

							<tr>
								<td>廠牌</td>
								<td><%=productBean.getProductBrand()%></td>
							</tr>
							<tr>
								<td>Specifications</td>
								<td><%=productBean.getSpecifications()%></td>
							</tr>
							<tr>
								<td>顏色</td>
								<td><%=productBean.getColor()%></td>
							</tr>
							<tr>
								<td>單價</td>
								<td>$<%=productBean.getUnitPrice()%></td>
							</tr>

							<tr>
								<td>保固</td>
								<td><%=productBean.getWarranty()%></td>
							</tr>
						</table>
						<%
							}
						%>

						<!-- 喇叭  -->
						<%
							if (productBean.getProductType().equals("喇叭")) {
						%>


						<table class="table table-hover cart_table">

							<tr>
								<td>廠牌</td>
								<td><%=productBean.getProductBrand()%></td>
							</tr>
							<tr>
								<td>Specifications</td>
								<td><%=productBean.getSpecifications()%></td>
							</tr>
							<tr>
								<td>顏色</td>
								<td><%=productBean.getColor()%></td>
							</tr>
							<tr>
								<td>Wattage</td>
								<td><%=productBean.getWattage()%></td>
							</tr>
							<tr>
								<td>單價</td>
								<td>$<%=productBean.getUnitPrice()%></td>
							</tr>

							<tr>
								<td>保固</td>
								<td><%=productBean.getWarranty()%></td>
							</tr>
						</table>
						<%
							}
						%>
						<!-- 作業系統  -->
						<%
							if (productBean.getProductType().equals("作業系統")) {
						%>


						<table class="table table-hover cart_table">

							<tr>
								<td>廠牌</td>
								<td><%=productBean.getProductBrand()%></td>
							</tr>

							<tr>
								<td>單價</td>
								<td>$<%=productBean.getUnitPrice()%></td>
							</tr>


						</table>
						<%
							}
						%>
						<!-- 網路卡 -->
						<%
							if (productBean.getProductType().equals("網路卡")) {
						%>

						<table class="table table-hover cart_table">

							<tr>
								<td>廠牌</td>
								<td><%=productBean.getProductBrand()%></td>
							</tr>
							<tr>
								<td>Specifications</td>
								<td><%=productBean.getSpecifications()%></td>
							</tr>
							<tr>
								<td>EpansionSlot</td>
								<td><%=productBean.getExpansionSlot()%></td>
							</tr>

							<tr>
								<td>單價</td>
								<td>$<%=productBean.getUnitPrice()%></td>
							</tr>

							<tr>
								<td>保固</td>
								<td><%=productBean.getWarranty()%></td>
							</tr>
						</table>
						<%
							}
						%>
						
						<!-- I/O -->
						<%
							if (productBean.getProductType().equals("I/O")) {
						%>
						<table class="table table-hover cart_table">

							<tr>
								<td>廠牌</td>
								<td><%=productBean.getProductBrand() %></td>
							</tr>

							<tr>
								<td>EpansionSlot</td>
								<td><%=productBean.getExpansionSlot() %></td>
							</tr>

							<tr>
								<td>單價</td>
								<td>$<%=productBean.getUnitPrice() %></td>
							</tr>

							<tr>
								<td>保固</td>
								<td><%=productBean.getWarranty() %></td>
							</tr>
						</table>
						<%
							}
						
						%>

						<%
							int status = 0;
							if (!memberAccount.equals("")) {//檢查是否登入
								if (!productDB.checkCartByMemberAccount(productID, memberAccount)) {//檢查是否已加入購物車
									status = 1;//加入購物車
								} else
									status = 2;//已加入購物車									
							}

							if (status == 1) {
								out.print("<button id='addBtn' class='detailbtn1'>加入購物車</button>");
							} else if (status == 2) {
								out.print("<span class='detailbtn1_1'>已加入購物車</span>");
							}
							else{
								
						%>
						<input class="detailbtn1" type="button" value="加入購物車" onclick="{ if(confirm('請先登入'))location.href='login.jsp'}">
						<% 
						}
						%>
						<input class="detailbtn2" type="button" value="繼續選購" onclick="location.href='product.jsp'">
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
		$('.dropdown-toggle').dropdown();
	</script>
	<!-- javascript -->
	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.js"></script>
	<script type="text/javascript" src="js/additional-methods.js"></script>
	<script type="text/javascript" src="js/messages_zh_TW.js"></script>
	<script type="text/javascript">
	
	$(function() {
		
    	$('#addBtn').click(function(){
			var name = $('#ProductName').val();
			var r = confirm("是否要加入「"+name+"」 ? ");
			if(r == true){
				$.ajax({
						type: "POST",
						url: "AddCartServlet",
						data: $("#addForm").serialize(),
						success:function(){
							alert("加入成功");
							location.reload();
						},
						error:function(){
							alert("加入失敗");
						}
					});
				}
			
    	});
	});
	</script>
	</body>
</html>