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
<title>商品購買STEP2</title>
<link rel="stylesheet" href="css/jquery.validate.css" media="screen" />
<link
	href="http://cdn.bootcss.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet">
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
					ProductBean productBean=new ProductBean();
					
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
			<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>商品購買STEP2
		</h2>
		</div>
		<div class="container productcontent">
		<!-- BEGIN CONTACT FORM -->
		<form id="sendForm" action="AddOrderServlet" method="post">
		<input type="hidden" name="productID" value="<%=productBean.getProductID()%>">
			<table class="table">
				<h3 class="cart_h3">填寫收件人資訊</h3>
				<tr>
					<td><label id="memberAccount" name="memberAccount">會員帳號：<%=session.getAttribute("memberAccount")%></label>
					</td>
				</tr>
				<tr>
					<td><label id="memberName" name="memberName">會員名稱：<%=session.getAttribute("memberName")%></label>
					</td>
				</tr>
				<tr>
					<td><label>電話:</label> <input type="text" placeholder="09******" id="orderPhone" name="orderPhone" onkeyup="value=this.value.replace(/\D+/g,'')" >
					</td>
				</tr>
				<tr>
					<td><label>地址:</label> <input name="orderAddress" type="text" id="rderAddress" placeholder="  範例：台北市信義區信義路五段150巷431弄23號三樓" size="64">                                                       
					</td>
				</tr>
			</table>
			<table class="table">
				<h3 class="cart_h3">付款方式</h3>
				<tr>
					<td><label for="">取貨前預付</label></td>
					<td><label class="radio"> <input type="radio" name="payway" id="payway1" value="FamiPort"> 代碼繳費FamiPort
					</label></td>
					<td><label class="radio"> <input type="radio" name="payway" id="payway2" value="Ibon"> 代碼繳費Ibon
					</label></td>
				</tr>
				<tr>
					<td><label for="">貨到後付款</label></td>
					<td><label class="radio"> <input type="radio" name="payway" id="payway3" value="到店取貨付現"> 到店取貨付現
					</label></td>
					<td><label class="radio"> <input type="radio" name="payway" id="payway4" value="宅配貨到付款"> 宅配貨到付款
					</label></td>
				</tr>
				<span id="msg2"></span>
			</table>
			<input type="checkbox" name="check"> <a href="#myModal"
				role="button" class="btn_pop" data-toggle="modal" onclick="provision()" >已閱讀消費者服務條款<span
				id="msg1"></span></a>
			
			<!-- /.modal -->
			<!-- Footer -->
			<p>
				<!--<br> <a class="btn btn-danger btn_cart" href="payOrder.jsp">下一步</a>-->
				<input type="submit"class="btn btn-danger btn_cart">
			</p>
			
		</form>
		<!-- END CONTACT FORM -->
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
	<%
		}//if
		else
			response.sendRedirect("login.jsp");
	%>


	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
	<script
		src="http://cdn.bootcss.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<!-- validate -->
	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.js"></script>
	<script type="text/javascript" src="js/additional-methods.js"></script>
	<script type="text/javascript" src="js/messages_zh_TW.js"></script>
	<script type="text/javascript">
	
		function provision(){
			alert("1.Proactive公司係依據本服務條款提供Proactive服務 (以下簡稱「本服務」)。當會員完成Proactive之會員註冊手續、或開始使用本服務時，即表示已閱讀、瞭解並同意接受本服務條款之所有內容，並完全接受本服務現有與未來衍生的服務項目及內容。Proactive公司有權於任何時間修改或變更本服務條款之內容，修改後的服務條款內容將公佈網站上，Proactive將不會個別通知會員，建議會員隨時注意該等修改或變更。會員於任何修改或變更後繼續使用本服務時，視為會員已閱讀、瞭解並同意接受該等修改或變更。若不同意上述的服務條款修訂或更新方式，或不接受本服務條款的其他任一約定，會員應立即停止使用本服務。2.若會員為未滿二十歲之未成年人，應於會員的家長（或監護人）閱讀、瞭解並同意本約定書之所有內容及其後修改變更後，方得註冊為會員、使用或繼續使用本服務。當會員使用或繼續使用Proactive時，即推定會員的家長（或監護人）已閱讀、瞭解並同意接受本約定書之所有內容及其後修改變更。3.會員及Proactive雙方同意使用本服務之所有內容包括意思表示等，以電子文件作為表示方式。");
			
		}
		
		
		$(function() {
			$("#sendForm").validate({
				
				rules : {
					orderPhone : "required",
					orderAddress: "required",
					payway: "required",
					check: "required"
				},
				messages : {
					orderPhone : "請輸入電話!",
					orderAddress: "請輸入完整的地址!",
					payway:"請選擇付款方式!",
					check: "請確認已閱讀!"
				},
				errorPlacement : function(error, element) {
					if (element.attr('name') == "check") {
						$("#msg1").append(error);
					}
					else if(element.attr('name') == "payway"){
						$("#msg2").append(error);
					}
					else 
						error.insertAfter(element);
				}

			});
			$('.dropdown-toggle').dropdown();

			
		});
	</script>

</body>
</html>