<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>後台-產品管理</title>
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
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="login.jsp"> <span>PROACTIVE</span>後台管理系統
				</a>
			</div>
			
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-left navcolor">
				<li class="active"><a href="manageProduct.jsp">產品管理</a></li>
				<li><a href="manageCombination.jsp">優惠組合管理</a></li>
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
		<!-- /.container -->
	</nav>


	<div class="container_reg">


		<div class="container">
			<div class="col-lg-12 orderbg">
				<input class="addProduct" type="button" value="新增產品" onclick="location.href='addProduct.jsp'">
				<!-- Page Content -->
		        <div class="container productcontent">

		            <div class="tabbable"> <!-- Only required for left/right tabs -->
		                <!-- 商品nav -->
		                <ul class="nav nav-tabs">
		                    <li class="active">
		                        <a href="#tab1" data-toggle="tab">中央處理器 CPU</a>
		                    </li>
		                    <li>
		                        <a href="#tab2" data-toggle="tab">主機板 MD</a>
		                    </li>
		                    <li>
		                        <a href="#tab3" data-toggle="tab">硬碟/SSD HD</a>
		                    </li>
		                    <li>
		                        <a href="#tab4" data-toggle="tab">記憶體 RAM</a>
		                    </li>
		                    <li>
		                        <a href="#tab5" data-toggle="tab">顯示/繪圖卡 VGA</a>
		                    </li>
		                    <li>
		                        <a href="#tab6" data-toggle="tab">電源供應器</a>
		                    </li>
		                    <li>
		                        <a href="#tab7" data-toggle="tab">電腦機殼</a>
		                    </li>
		                    <li>
		                        <a href="#tab8" data-toggle="tab">DVD燒錄器</a>
		                    </li>
		                    <li>
		                        <a href="#tab9" data-toggle="tab">CPU散熱風扇</a>
		                    </li>
		                    <li>
		                        <a href="#tab10" data-toggle="tab">液晶螢幕</a>
		                    </li>
		                    <li>
		                        <a href="#tab11" data-toggle="tab">鍵盤</a>
		                    </li>
		                    <li>
		                        <a href="#tab12" data-toggle="tab">滑鼠</a>
		                    </li>
		                    <li>
		                        <a href="#tab13" data-toggle="tab">喇叭</a>
		                    </li>
		                    <li>
		                        <a href="#tab14" data-toggle="tab">作業系統</a>
		                    </li>
		                    <li>
		                        <a href="#tab15" data-toggle="tab">網路卡</a>
		                    </li>
		                    <li>
		                        <a href="#tab16" data-toggle="tab">I/O卡</a>
		                    </li>
		                </ul>

		                <!-- 所有商品陳列 -->
		                <div class="tab-content">
		                    <!-- 中央處理器 cpu -->
		                    <div class="tab-pane active" id="tab1">
		                        <div class="row">

		                            
		                            <div class="col-sm-6 col-md-3">
		                                <div class="product">
		                                    <a href="modiProduct.jsp">
		                                        <div class="productimg">
		                                            <img src="img/cpu.jpg" alt="">
		                                        </div>
		                                        <div class="productname">
		                                            <p>Intel Pentium G3258</p>
		                                        </div>
		                                    </a>
		                                </div>
		                            </div>
		                            <div class="col-sm-6 col-md-3">
		                                <div class="product">
		                                    <a href="">
		                                        <div class="productimg">
		                                            <img src="img/cpu.jpg" alt="">
		                                        </div>
		                                        <div class="productname">
		                                            <p>Intel Pentium G3258</p>
		                                        </div>
		                                    </a>
		                                </div>
		                            </div>
		                            <div class="col-sm-6 col-md-3">
		                                <div class="product">
		                                    <a href="">
		                                        <div class="productimg">
		                                            <img src="img/cpu.jpg" alt="">
		                                        </div>
		                                        <div class="productname">
		                                            <p>Intel Pentium G3258</p>
		                                        </div>
		                                    </a>
		                                </div>
		                            </div>
		                            <div class="col-sm-6 col-md-3">
		                                <div class="product">
		                                    <a href="">
		                                        <div class="productimg">
		                                            <img src="img/cpu.jpg" alt="">
		                                        </div>
		                                        <div class="productname">
		                                            <p>Intel Pentium G3258</p>
		                                        </div>
		                                    </a>
		                                </div>
		                            </div>
		                            <div class="col-sm-6 col-md-3">
		                                <div class="product">
		                                    <a href="">
		                                        <div class="productimg">
		                                            <img src="img/cpu.jpg" alt="">
		                                        </div>
		                                        <div class="productname">
		                                            <p>Intel Pentium G3258</p>
		                                        </div>
		                                    </a>
		                                </div>
		                            </div>
		                            <div class="col-sm-6 col-md-3">
		                                <div class="product">
		                                    <a href="">
		                                        <div class="productimg">
		                                            <img src="img/cpu.jpg" alt="">
		                                        </div>
		                                        <div class="productname">
		                                            <p>Intel Pentium G3258</p>
		                                        </div>
		                                    </a>
		                                </div>
		                            </div>
		                            <div class="col-sm-6 col-md-3">
		                                <div class="product">
		                                    <a href="">
		                                        <div class="productimg">
		                                            <img src="img/cpu.jpg" alt="">
		                                        </div>
		                                        <div class="productname">
		                                            <p>Intel Pentium G3258</p>
		                                        </div>
		                                    </a>
		                                </div>
		                            </div>

		                        </div>
		                    </div>
		                    <!-- end of 中央處理器 cpu -->
		                    <!-- 主機板 MD -->
		                    <div class="tab-pane" id="tab2">
		                        <p>Howdy, I'm in Section 2.</p>
		                    </div>
		                    <!-- end of 主機板 MD -->
		                    <div class="tab-pane" id="tab3">
		                        <p>I'm in Section 3</p>
		                    </div>
		                    <div class="tab-pane" id="tab4">
		                        <p>Howdy, I'm in Section 4</p>
		                    </div>
		                    <div class="tab-pane" id="tab5">
		                        <p>I'm in Section 5</p>
		                    </div>
		                    <div class="tab-pane" id="tab6">
		                        <p>Howdy, I'm in Section 6</p>
		                    </div>
		                    <div class="tab-pane" id="tab7">
		                        <p>I'm in Section 7</p>
		                    </div>
		                    <div class="tab-pane" id="tab8">
		                        <p>Howdy, I'm in Section 8</p>
		                    </div>
		                    <div class="tab-pane" id="tab9">
		                        <p>I'm in Section 9</p>
		                    </div>
		                    <div class="tab-pane" id="tab10">
		                        <p>Howdy, I'm in Section 10</p>
		                    </div>
		                    <div class="tab-pane" id="tab11">
		                        <p>I'm in Section 11</p>
		                    </div>
		                    <div class="tab-pane" id="tab12">
		                        <p>Howdy, I'm in Section 12</p>
		                    </div>
		                    <div class="tab-pane" id="tab13">
		                        <p>I'm in Section 13</p>
		                    </div>
		                    <div class="tab-pane" id="tab14">
		                        <p>Howdy, I'm in Section 14</p>
		                    </div>
		                    <div class="tab-pane" id="tab15">
		                        <p>I'm in Section 15</p>
		                    </div>
		                    <div class="tab-pane" id="tab16">
		                        <p>Howdy, I'm in Section 16</p>
		                    </div>
		                </div>
		            </div>

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
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap.min.js"></script>
	
	<script>
	$('.dropdown-toggle').dropdown();
	</script>
</body>
</html>