<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*"%>
<%@ page import="bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>後台-修改產品</title>
    <link rel="stylesheet" href="css/jquery.validate.css" media="screen" />
    <link rel="shortcut icon" href="img/logo3.jpg">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<%
	String productID = request.getParameter("ID");
	ProductDB productDB = new ProductDB();
	ProductBean productBean = productDB.getProduct(productID);
%>
<body>
	<%
		if (session.getAttribute("managerAccount") != null) {
	%>
   <nav class="navbar navbar-inverse navbar-fixed-top navchg" role="navigation">
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
				<a class="navbar-brand" href="login.jsp"> <span>PROACTIVE</span>後台管理系統</a>
			</div>
            
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-left navcolor">
				<li class="active"><a href="manageProduct.jsp">產品管理</a></li>
				<li><a href="manageCombination.jsp">優惠組合管理</a></li>
				<li><a href="manageHot.jsp">熱銷資訊管理</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right navcolor">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=session.getAttribute("managerName")%><b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="manageOrder.jsp">訂單管理</a></li>
						<li><a href="../MLogoutServlet">登出</a></li>
					</ul>
				</li>
			</ul>
		</div>
            
            
        </div>
        <!-- /.container -->
    </nav>

    <div class="container_reg">

	<form action="../ModiProductServlet" method="post">
		<input type="hidden" name="ProductID" value="<%=productBean.getProductID()%>">
        <div class="container">
            <div class="col-lg-12 orderbg modi">
                <div class="detail">
                    <div class="row">
                        <div class="col-md-12 detailtitle">
                            <h2>
                                <input type="text" class="addtxt" name="ProductName" value="<%=productBean.getProductName()%>">
                            </h2>
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
									<td><input type="text" class="addtxt1" name="ProductBrand" value="<%=productBean.getProductBrand()%>"></td>
								</tr>
								<tr>
									<td>Clock</td>
									<td><input type="text" class="addtxt1" name="Clock" value="<%=productBean.getClock()%>"></td>
								</tr>
								<tr>
									<td>ProcessorSocket</td>
									<td><input type="text" class="addtxt1" name="ProcessorSocket" value="<%=productBean.getProcessorSocket()%>"></td>
								</tr>
								<tr>
									<td>核心數</td>
									<td><input type="text" class="addtxt1" name="Specifications" value="<%=productBean.getSpecifications()%>"></td>
								</tr>
								<tr>
									<td>Cache</td>
									<td><input type="text" class="addtxt1" name="Cache" value="<%=productBean.getCache()%>"></td>
								</tr>
								<tr>
									<td>單價</td>
									<td><input type="text" class="addtxt1" name="UnitPrice" value="<%=productBean.getUnitPrice()%>"></td>
								</tr>
								<tr>
									<td>保固期</td>
									<td><input type="text" class="addtxt1" name="Warranty" value="<%=productBean.getWarranty()%>"></td>
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
									<td><input type="text" class="addtxt1" value="<%=productBean.getProductBrand()%>"></td>
								</tr>
								<tr>
									<td>Chipset</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getChipset()%>"></td>
								</tr>
								<tr>
									<td>ProcessorSocket</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getProcessorSocket()%>"></td>
								</tr>
								<tr>
									<td>MemorySlot</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getMemorySlot()%>"></td>
								</tr>
								<tr>
									<td>DriveSpecifications</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getDriveSpecifications()%>"></td>
								</tr>
								<tr>
									<td>ExpansionSlot</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getExpansionSlot()%>"></td>
								</tr>
								<tr>
									<td>大小</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getSize()%>"></td>
								</tr>
								<tr>
									<td>單價</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getUnitPrice()%>"></td>
								</tr>
								<tr>
									<td>保固</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getWarranty()%>"></td>
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
									<td><input type="text" class="addtxt1" value="<%=productBean.getProductBrand()%>"></td>
								</tr>
								<tr>
									<td>DriveSpecifications</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getDriveSpecifications()%>"></td>
								</tr>
								<tr>
									<td>Specifications</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getSpecifications()%>"></td>
								</tr>
								<tr>
									<td>WRSpeed</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getWRSpeed()%>"></td>
								</tr>
								<tr>
									<td>Speed</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getSpeed()%>"></td>
								</tr>
	
								<tr>
									<td>記憶體大小</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getMemorySize()%>"></td>
								</tr>
								<tr>
									<td>大小</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getSize()%>"></td>
								</tr>
								<tr>
									<td>單價</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getUnitPrice()%>"></td>
								</tr>
								<tr>
									<td>保固</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getWarranty()%>"></td>
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
									<td><input type="text" class="addtxt1" value="<%=productBean.getProductBrand()%>"></td>
								</tr>
								<tr>
									<td>Clock</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getClock()%>"></td>
								</tr>
								<tr>
									<td>MemorySlot</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getMemorySlot()%>"></td>
								</tr>
								<tr>
									<td>Pinnumber</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getPinNumber()%>"></td>
								</tr>
								<tr>
									<td>MemorySize</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getMemorySize()%>"></td>
								</tr>
								<tr>
									<td>單價</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getUnitPrice()%>"></td>
								</tr>
	
								<tr>
									<td>保固</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getWarranty()%>"></td>
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
									<td><input type="text" class="addtxt1" value="<%=productBean.getProductBrand()%>"></td>
								</tr>
								<tr>
									<td>Chipset</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getChipset()%>"></td>
								</tr>
								<tr>
									<td>MemorySlot</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getMemorySlot()%>"></td>
								</tr>
								<tr>
									<td>ExpansionSlot</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getExpansionSlot()%>"></td>
								</tr>
								<tr>
									<td>CPU</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getGPU()%>"></td>
								</tr>
								<tr>
									<td>記憶體大小</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getMemorySize()%>"></td>
								</tr>
								<tr>
									<td>單價</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getUnitPrice()%>"></td>
								</tr>
								<tr>
									<td>保固</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getWarranty()%>"></td>
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
									<td><input type="text" class="addtxt1" value="<%=productBean.getProductBrand()%>"></td>
								</tr>
								<tr>
									<td>ExpansionSlot</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getExpansionSlot()%>"></td>
								</tr>
								<tr>
									<td>大小</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getSize()%>"></td>
								</tr>
								<tr>
									<td>Wattage</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getWattage()%>"></td>
								</tr>
	
								<tr>
									<td>單價</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getUnitPrice()%>"></td>
								</tr>
								<tr>
									<td>保固</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getWarranty()%>"></td>
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
									<td><input type="text" class="addtxt1" value="<%=productBean.getProductBrand()%>"></td>
								</tr>
								<tr>
									<td>Specifications</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getSpecifications()%>"></td>
								</tr>
								<tr>
									<td>ExpansionSlot</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getExpansionSlot()%>"></td>
								</tr>
								<tr>
									<td>顏色</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getColor()%>"></td>
								</tr>
								<tr>
									<td>大小</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getSize()%>"></td>
								</tr>
								<tr>
									<td>單價</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getUnitPrice()%>"></td>
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
									<td><input type="text" class="addtxt1" value="<%=productBean.getProductBrand()%>"></td>
								</tr>
								<tr>
									<td>DriveSpecifications</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getDriveSpecifications()%>"></td>
								</tr>
								<tr>
									<td>Specifications</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getSpecifications()%>"></td>
								</tr>
								<tr>
									<td>顏色</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getColor()%>"></td>
								</tr>
	
								<tr>
									<td>單價</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getUnitPrice()%>"></td>
								</tr>
								<tr>
									<td>保固</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getWarranty()%>"></td>
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
									<td><input type="text" class="addtxt1" value="<%=productBean.getProductBrand()%>"></td>
								</tr>
								<tr>
									<td>CPUSlot</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getCPUSlot()%>"></td>
								</tr>
								<tr>
									<td>Speed</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getSpeed()%>"></td>
								</tr>
								<tr>
									<td>Noise</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getNoise()%>"></td>
								</tr>
	
								<tr>
									<td>單價</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getUnitPrice()%>"></td>
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
									<td><input type="text" class="addtxt1" value="<%=productBean.getProductBrand()%>"></td>
								</tr>
								<tr>
									<td>顏色</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getColor()%>"></td>
								</tr>
								<tr>
									<td>大小</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getSize()%>"></td>
								</tr>
	
								<tr>
									<td>單價</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getUnitPrice()%>"></td>
								</tr>
								<tr>
									<td>保固</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getWarranty()%>"></td>
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
									<td><input type="text" class="addtxt1" value="<%=productBean.getProductBrand()%>"></td>
								</tr>
								<tr>
									<td>Specifications</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getSpecifications()%>"></td>
								</tr>
								<tr>
									<td>顏色</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getColor()%>"></td>
								</tr>
								<tr>
									<td>單價</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getUnitPrice()%>"></td>
								</tr>
	
								<tr>
									<td>保固</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getWarranty()%>"></td>
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
									<td><input type="text" class="addtxt1" value="<%=productBean.getProductBrand()%>"></td>
								</tr>
								<tr>
									<td>Specifications</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getSpecifications()%>"></td>
								</tr>
								<tr>
									<td>顏色</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getColor()%>"></td>
								</tr>
								<tr>
									<td>單價</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getUnitPrice()%>"></td>
								</tr>
	
								<tr>
									<td>保固</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getWarranty()%>"></td>
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
									<td><input type="text" class="addtxt1" value="<%=productBean.getProductBrand()%>"></td>
								</tr>
								<tr>
									<td>Specifications</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getSpecifications()%>"></td>
								</tr>
								<tr>
									<td>顏色</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getColor()%>"></td>
								</tr>
								<tr>
									<td>Wattage</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getWattage()%>"></td>
								</tr>
								<tr>
									<td>單價</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getUnitPrice()%>"></td>
								</tr>
	
								<tr>
									<td>保固</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getWarranty()%>"></td>
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
									<td><input type="text" class="addtxt1" value="<%=productBean.getProductBrand()%>"></td>
								</tr>
	
								<tr>
									<td>單價</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getUnitPrice()%>"></td>
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
									<td><input type="text" class="addtxt1" value="<%=productBean.getProductBrand()%>"></td>
								</tr>
								<tr>
									<td>Specifications</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getSpecifications()%>"></td>
								</tr>
								<tr>
									<td>EpansionSlot</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getExpansionSlot()%>"></td>
								</tr>
	
								<tr>
									<td>單價</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getUnitPrice()%>"></td>
								</tr>
	
								<tr>
									<td>保固</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getWarranty()%>"></td>
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
									<td><input type="text" class="addtxt1" value="<%=productBean.getProductBrand() %>"></td>
								</tr>
	
								<tr>
									<td>EpansionSlot</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getExpansionSlot() %>"></td>
								</tr>
	
								<tr>
									<td>單價</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getUnitPrice() %>"></td>
								</tr>
	
								<tr>
									<td>保固</td>
									<td><input type="text" class="addtxt1" value="<%=productBean.getWarranty() %>"></td>
								</tr>
							</table>
							<%
								}
							
							%>
							<input type="submit" class="detailbtn1 detailbtn1_re" value="修改">
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
    <%
		}//if
		else
			response.sendRedirect("login.jsp");
	%>
	
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
    
    
    <script>
		$('.dropdown-toggle').dropdown();
	</script>
	

</body>
</html>