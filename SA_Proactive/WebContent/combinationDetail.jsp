<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="database.*"%>
<%@ page import="bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String memberAccount = session.getAttribute("memberAccount") == null? "":(String) session.getAttribute("memberAccount");
	String combinationID = request.getParameter("ID");
	CombinationDB combintionDB = new CombinationDB();
	CombinationBean combinationBean = combintionDB.getCombination(combinationID);
	CombinationDetailDB combinationDetailDB=new CombinationDetailDB();
	String msg = "";
%>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"> <span>PROACTIVE</span>
				</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
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

		<form action="AddCartCombinationServlet" method="post" id="addForm">
			<input type="hidden" id="msg" value="<%=msg%>"> 
			<input type="hidden" id="CombinationName" name="CombinationName" value="<%=combinationBean.getCombinationName()%>"> 
			<input type="hidden" name="CombinationID" value="<%=combinationID%>">
		</form>

		<!-- Page Content -->
		<div class="container">
			<div class="detail">
				<div class="row">
					<div class="col-md-12 detailtitle">
						<h2>
							<%=combinationBean.getCombinationName()%>
							<!--優惠組合名稱 -->
						</h2>
						<p>
							<%=combinationBean.getCombinationDescription()%>
							<!--優惠組合敘述 -->
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 detailimg">
						<img src="<%=combinationBean.getComImage()%>" alt="">
					</div>
					<div class="col-md-6 detailcontent">
						<P>組合明細</P>
						<table class="table table-hover cart_table">
							<tr>
								<td>中央處理器</td>
								<td>ASROCK960GC-GS FX</td>
							</tr>
							<tr>
								<td>主機板</td>
								<td>ASROCK 960GC-GS FX</td>
							</tr>
							<tr>
								<td>硬碟</td>
								<td>INTEL Core I3-4130</td>
							</tr>
							<tr>
								<td>記憶體</td>
								<td>ASROCK 960GC-GS FX</td>
							</tr>
							<tr>
								<td>顯示/繪圖卡</td>
								<td>INTEL Core I3-4130</td>
							</tr>
							<tr>
								<td>電源供應器</td>
								<td>ASROCK 960GC-GS FX</td>
							</tr>
							<tr>
								<td>電腦機殼</td>
								<td>INTEL Core I3-4130</td>
							</tr>
							<tr>
								<td>DVD燒錄器</td>
								<td>ASROCK 960GC-GS FX</td>
							</tr>
							<tr>
								<td>CPU散熱風扇</td>
								<td>ASROCK 960GC-GS FX</td>
							</tr>
							<tr>
								<td>總價</td>
								<td>$<%=combinationBean.getTotalPrice()%></td>
							</tr>
						</table>
						<%
							int status = 0;
							if (!memberAccount.equals("")) {//檢查是否登入
								if (!combintionDB.checkCartCombinationByMemberAccount(combinationID, memberAccount)) {//檢查是否已加入購物車
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
						<input class="detailbtn2" type="button" value="繼續選購" onclick="location.href='specialOffer.jsp'">
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
	
	<!-- Script to Dropdown -->
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
			var name = $('#CombinationName').val();
			var r = confirm("是否要加入「"+name+"」 ? ");
			if(r == true){
				$.ajax({
						type: "POST",
						url: "AddCartCombinationServlet",
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