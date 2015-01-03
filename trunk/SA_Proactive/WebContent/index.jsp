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

<div class="indexbg">

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
				<li class="active"><a href="index.jsp">首頁</a></li>
				<li><a href="product.jsp">買零件</a></li>
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
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=session.getAttribute("memberName")%><b class="caret"></b></a>
                       <ul class="dropdown-menu">
                           <li>
                               <a href="modiPassword.jsp">修改密碼</a>
                           </li>
                           <li>
                                <a href="order.jsp">訂單查詢</a>
                           </li>
                           <li>
                               <a href="LogoutServlet">登出</a>
                           </li>
                       </ul>
				</li>
				<%
					}
				%>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

		<div class="head clearfix">
            <div class="head_content">
                <h2 class="head_title">&nbsp;PROACTIVE</h2>
                <h2>想要花一樣的經費,</h2>
                <h2>卻擁有比品牌電腦更高檔的配備嗎?</h2>
                <br><br>
                <div class="head_btn">
                    <a class="" href="customerlize1.jsp">立即組裝我的電腦</a>
                </div>
            </div>
        </div>

        
        <div>
            <h1 class="index_hot">熱銷資訊
                <small>各配備最熱銷型號前三名</small>
            </h1>
        </div>
        
        
        <div class="pageContainer clearfix">
            <div class="leftColumn">
                <nav>
                    <ul>
                        <li><a href="#hot_cpu" class="current">中央處理器 CPU</a></li>
                        <li><a href="#hot_md">主機板 MD</a></li>
                        <li><a href="#hot_ssdhd">硬碟/SSD HD</a></li>
                        <li><a href="#hot_ram">記憶體 RAM</a></li>
                        <li><a href="#hot_vga">顯示/繪圖卡 VGA</a></li>

                        <li><a href="#hot_power">電源供應器</a></li>
                        <li><a href="#hot_box">電腦機殼</a></li>
                        <li><a href="#hot_dvd">DVD燒錄器</a></li>
                        <li><a href="#hot_fan">CPU散熱風扇</a></li>
                        <li><a href="#hot_moniter">液晶螢幕</a></li>

                        
                        <li><a href="#hot_keyboard">鍵盤</a></li>
                        <li><a href="#hot_mouse">滑鼠</a></li>
                        <li><a href="#hot_speaker">喇叭</a></li>
                        <li><a href="#hot_os">作業系統</a></li>

                        <li><a href="#hot_webcard">網路卡</a></li>
                        <li><a href="#hot_io">I/O卡</a></li>
                    </ul>
                </nav>
            </div><!-- div.leftColume -->

            <div class="rightColumn">

                <!-- 中央處理器 cpu -->
                <div class="row" id="hot_cpu">
                    <div class="col-sm-12 col-md-3">
                        <div class="hot_div">
                            <p>CPU</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/A001.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO1.</span>
                                    <p>INTEL Core I3-4130</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/A002.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO2.</span>
                                    <p>INTEL Core I7-4770K</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/A003.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO3.</span>
                                    <p>INTEL Pentium G3420</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- 主機板 MD -->
                <div class="row" id="hot_md">
                    <div class="col-sm-12 col-md-3">
                        <div class="hot_div">
                            <p>MD</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/B001.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO1.</span>
                                    <p>ASROCK 960GC-GS FX</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/B002.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO2.</span>
                                    <p>MSI 760GA-P43</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/B003.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO3.</span>
                                    <p>ASUS M5A97</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- 硬碟/SSD HD -->
                <div class="row" id="hot_ssdhd">
                    <div class="col-sm-12 col-md-3">
                        <div class="hot_div">
                            <p>HD</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/C001.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO1.</span>
                                    <p>WD 500G/SATAIII/64M/7200R RE企業級/5年硬碟     </p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/C002.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO2.</span>
                                    <p>Seagate 1TB/SATAIII/64M影音監控/5900R/3年</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/C003.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO3.</span>
                                    <p>TOSHIBA 1TB/SATA3/64M/Harrier企業級/5年硬碟</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- 記憶體 RAM -->
                <div class="row" id="hot_ram">
                    <div class="col-sm-12 col-md-3">
                        <div class="hot_div">
                            <p>RAM</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/D001.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO1.</span>
                                    <p>Transcend DDR400 1G PC用</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/D002.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO2.</span>
                                    <p>Transcend DDR2 800 2G PC用</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/D003.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO3.</span>
                                    <p>Kingston DDR3 1333 2G PC用</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- 顯示/繪圖卡 VGA -->
                <div class="row" id="hot_vga">
                    <div class="col-sm-12 col-md-3">
                        <div class="hot_div">
                            <p>VGA</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/E001.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO1.</span>
                                    <p>GIGABYTE GV-R545-1GI</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/E002.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO2.</span>
                                    <p>MSI R7750-1GD5</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/E003.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO3.</span>
                                    <p>ASUS R7240-2GD3-L 顯示卡</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- 電源共應器 -->
                <div class="row" id="hot_power">
                    <div class="col-sm-12 col-md-3">
                        <div class="hot_div">
                            <p>電源</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/F001.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO1.</span>
                                    <p>COOLER MASTER 350W/12CM 電源供應器</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/F002.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO2.</span>
                                    <p>GIGABYTE Hercules X530 電源供應器</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/F003.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO3.</span>
                                    <p>iCute SPEED 400W 電源供應器</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- 電腦機殼 -->
                <div class="row" id="hot_box">
                    <div class="col-sm-12 col-md-3">
                        <div class="hot_div">
                            <p>機殼</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/G001.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO1.</span>
                                    <p>COOLER MASTER 693</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/G002.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO2.</span>
                                    <p>GIGABYTE GZ-F1</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/G003.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO3.</span>
                                    <p>金河田 8526BL</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- DVD燒錄器 -->
                <div class="row" id="hot_dvd">
                    <div class="col-sm-12 col-md-3">
                        <div class="hot_div">
                            <p>DVD</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/H001.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO1.</span>
                                    <p>ASUS DRW-24D3ST</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/H002.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO2.</span>
                                    <p>LITEON IHAS324</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/H003.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO3.</span>
                                    <p>PIONEER DVR-S21L</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- CPU散熱風扇 -->
                <div class="row" id="hot_fan">
                    <div class="col-sm-12 col-md-3">
                        <div class="hot_div">
                            <p>風扇</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/I001.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO1.</span>
                                    <p>AOC usa CPT12-9525EA 超靜音風扇LGA775</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/I002.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO2.</span>
                                    <p>COOLER MASTER Vortex 211P風扇LGA1156</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/I003.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO3.</span>
                                    <p>COOLER MASTER Vortex 211P風扇LGA1156</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- 液晶螢幕 -->
                <div class="row" id="hot_moniter">
                    <div class="col-sm-12 col-md-3">
                        <div class="hot_div">
                            <p>螢幕</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/J001.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO1.</span>
                                    <p>acer 18.5" K192HQL(LED)</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/J002.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO2.</span>
                                    <p>ViewSonic 19" VA916A(4:3)LED</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/J003.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO3.</span>
                                    <p>ASUS 19.5" VS207DE (LE</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- 鍵盤 -->
                <div class="row" id="hot_keyboard">
                    <div class="col-sm-12 col-md-3">
                        <div class="hot_div">
                            <p>鍵盤</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/K001.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO1.</span>
                                    <p>A4 黑/KB-750圓角舒無邊防水鍵盤/USB</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/K002.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO2.</span>
                                    <p>ANDY愛MAY MAY 白/K6巧克力超薄鍵盤/USB</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/K003.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO3.</span>
                                    <p>KINYO 白/BKB-33藍牙無線鍵盤</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- 滑鼠 -->
                <div class="row" id="hot_mouse">
                    <div class="col-sm-12 col-md-3">
                        <div class="hot_div">
                            <p>滑鼠</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/L001.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO1.</span>
                                    <p>Logitech 粉紅/M105有線光學滑鼠/USB</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/L002.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO2.</span>
                                    <p>Logitech 白/M187無線迷你滑鼠</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/L003.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO3.</span>
                                    <p>Logitech 黑/M705無線鐳射滑鼠</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- 喇叭 -->
                <div class="row" id="hot_speaker">
                    <div class="col-sm-12 col-md-3">
                        <div class="hot_div">
                            <p>喇叭</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/M001.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO1.</span>
                                    <p>ALTEC BXR1220</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/M002.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO2.</span>
                                    <p>Logitech Z200</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/M003.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO3.</span>
                                    <p>JS JY2004</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- 作業系統 -->
                <div class="row" id="hot_os">
                    <div class="col-sm-12 col-md-3">
                        <div class="hot_div">
                            <p>OS</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/N001.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO1.</span>
                                    <p>Microsoft Win 7 Home Prem家用進階32位元隨機版(中文)</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/N002.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO2.</span>
                                    <p>Microsoft Win 7 Home Prem家用進階32位元隨機版(中文</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/N003.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO3.</span>
                                    <p>Microsoft Win 8.1 專業64位元隨機版(中文)</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- 網路卡 -->
                <div class="row" id="hot_webcard">
                    <div class="col-sm-12 col-md-3">
                        <div class="hot_div">
                            <p>網卡</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/O001.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO1.</span>
                                    <p>D-LINK DGE-528T Giga網路卡PCI</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/O002.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO2.</span>
                                    <p>INTEL EXPI9301CTBLK Giga網卡PCI-E</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/O003.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO3.</span>
                                    <p>TOTOLINK P100網路卡PCI</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- I/O卡 -->
                <div class="row" id="hot_io">
                    <div class="col-sm-12 col-md-3">
                        <div class="hot_div">
                            <p>I/O卡</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/P001.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO1.</span>
                                    <p>伽利略 PETRP02A 2埠PT+RS-232卡PCI-E   </p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/P002.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO2.</span>
                                    <p>伽利略 PETR02A 2埠RS232卡PCI-E</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="product">
                            <a href="">
                                <div class="productimg">
                                    <img src="img/P003.jpg" alt="">
                                </div>
                                <div class="productname">
                                    <span>NO3.</span>
                                    <p>伽利略 PTR02 2埠RS-232卡PCI</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>

            </div><!-- div.rightColume -->
        </div><!-- div.pageContainer -->

		<hr>
		<div class="container">
    		<footer>
        		<div class="row">
        			<div class="col-lg-12">
        				<p class="text-right">Copyright &copy; 2014 PROACTIVE</p>
        			</div>
        		</div>
    		</footer>
        </div>
        
	</div>
	<!-- /.container -->

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
