<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="database.*"%>
<%@ page import="bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>後台-新增產品</title>
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
                <a class="navbar-brand" href="login.jsp"><span>PROACTIVE</span>後台管理系統</a>
            </div>
            
            <div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-left navcolor">
				<li class="active"><a href="manageProduct.jsp">產品管理</a></li>
				<li><a href="manageCombination.jsp">優惠組合管理</a></li>
				<li><a href="manageHot.jsp">熱銷資訊管理</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right navcolor">
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=session.getAttribute("managerName")%><b class="caret"></b></a>
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
    
    <!-- Page Content -->
    <div class="container_reg">
	<div class="container">

		<div class="tabbable addproductnav">
			<!-- Only required for left/right tabs -->
			<!-- 商品nav -->
			<ul class="nav nav-tabs">
				<li class="active"><a href="#tab1" data-toggle="tab">中央處理器CPU</a></li>
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
					<form action="../AddProductServlet" method="post" id="addForm">
						<input type="hidden" name="ProductType" value="中央處理器">
		                <div class="col-lg-12 orderbg">
		                    <div class="detail">
		                        <div class="row">
		                            <div class="col-md-12 detailtitle">
		                                <h2>
		                                	<input type="text" name="ProductID" class="addtxt" placeholder="ProductID,ex.A001">
		                                    <input type="text" name="ProductName" class="addtxt" placeholder="ProductName">
	                                	</h2>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-md-6 detailimg">
		                                <img src="img/cusbg.jpg" alt="">
		                            </div>
		                            <div class="col-md-6 detailcontent">
		                                <P>產品明細</P>
		                                <table class="table table-hover cart_table">
		                                    <tr>
		                                        <td>廠牌</td>
		                                        <td>
		                                            <input type="text" name="ProductBrand" class="addtxt1" placeholder="ProductBrand">
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <td>Clock</td>
		                                        <td>
		                                            <input type="text" name="Clock" class="addtxt1" placeholder="Clock">
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <td>ProcessorSocket</td>
		                                        <td>
		                                            <input type="text" name="ProcessorSocket" class="addtxt1" placeholder="ProcessorSocket">
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <td>核心數</td>
		                                        <td>
		                                            <input type="text" name="Specifications" class="addtxt1" placeholder="Specifications">
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <td>Cache</td>
		                                        <td>
		                                            <input type="text" name="Cache" class="addtxt1" placeholder="Cache">
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <td>單價</td>
		                                        <td>
		                                            <input type="text" name="UnitPrice" class="addtxt1" placeholder="UnitPrice">
		                                        </td>
		                                    </tr>
		                                    <tr>
		                                        <td>保固期</td>
		                                        <td>
		                                            <input type="text" name="Warranty" class="addtxt1" placeholder="Warranty">
		                                        </td>
		                                    </tr>
		                                </table>
		                                <input class="detailbtn1" type="submit" value="新增產品">
		                                <input class="detailbtn2" type="reset" value="重新填寫">
		                            </div>
		                        </div>
		                    </div>
		                </div>
			        </form>
				</div>
				<!-- end of 中央處理器 cpu -->
				<!-- 主機板 MD -->
				<div class="tab-pane" id="tab2">
					
					 <form action="../AddProductServlet" method="post" id="addForm">
					 	<input type="hidden" name="ProductType" value="硬碟/SSD">
		                <div class="col-lg-12 orderbg">
		                    <div class="detail">
		                        <div class="row">
		                            <div class="col-md-12 detailtitle">
		                                <h2>
		                                    <input type="text" name="ProductID" class="addtxt" placeholder="ProductID,ex.B001">
		                                    <input type="text" name="ProductName" class="addtxt" placeholder="ProductName"> 
		                                </h2>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-md-6 detailimg">
		                                <img src="img/cusbg.jpg" alt="">
		                            </div>
		                            <div class="col-md-6 detailcontent">
		                                <P>產品明細</P>
		                                <table class="table table-hover cart_table">
		                                    <tr>
												<td>廠牌</td>
												<td><input type="text" class="addtxt1" name="ProductBrand"></td>
											</tr>
											<tr>
												<td>Chipset</td>
												<td><input type="text" class="addtxt1" name="Chipset"></td>
											</tr>
											<tr>
												<td>ProcessorSocket</td>
												<td><input type="text" class="addtxt1" name="ProcessorSocket"></td>
											</tr>
											<tr>
												<td>MemorySlot</td>
												<td><input type="text" class="addtxt1" name="MemorySlot"></td>
											</tr>
											<tr>
												<td>DriveSpecifications</td>
												<td><input type="text" class="addtxt1" name="DriveSpecifications"></td>
											</tr>
											<tr>
												<td>ExpansionSlot</td>
												<td><input type="text" class="addtxt1" name="ExpansionSlot"></td>
											</tr>
											<tr>
												<td>大小</td>
												<td><input type="text" class="addtxt1" name="Size"></td>
											</tr>
											<tr>
												<td>單價</td>
												<td><input type="text" class="addtxt1" name="UnitPrice"></td>
											</tr>
											<tr>
												<td>保固</td>
												<td><input type="text" class="addtxt1" name="Warranty"></td>
											</tr>
		                                </table>
		                                <input class="detailbtn1" type="submit" value="新增產品">
		                                <input class="detailbtn2" type="reset" value="重新填寫">
		                            </div>
		                        </div>
		                    </div>
		                </div>
			        </form>
			       
				</div>
				<!-- HD -->
				<div class="tab-pane" id="tab3">
					<form action="../AddProductServlet" method="post" id="addForm">
					 	<input type="hidden" name="ProductType" value="硬碟/SSD">
		                <div class="col-lg-12 orderbg">
		                    <div class="detail">
		                        <div class="row">
		                            <div class="col-md-12 detailtitle">
		                                <h2>
		                                    <input type="text" name="ProductID" class="addtxt" placeholder="ProductID,ex.C001">
		                                    <input type="text" name="ProductName" class="addtxt" placeholder="ProductName"> 
		                                </h2>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-md-6 detailimg">
		                                <img src="img/cusbg.jpg" alt="">
		                            </div>
		                            <div class="col-md-6 detailcontent">
		                                <P>產品明細</P>
		                                <table class="table table-hover cart_table">
		                                    <tr>
												<td>廠牌</td>
												<td><input type="text" class="addtxt1" name="ProductBrand"></td>
											</tr>
											<tr>
												<td>DriveSpecifications</td>
												<td><input type="text" class="addtxt1" name="DriveSpecifications"></td>
											</tr>
											<tr>
												<td>Specifications</td>
												<td><input type="text" class="addtxt1" name="Specifications"></td>
											</tr>
											<tr>
												<td>WRSpeed</td>
												<td><input type="text" class="addtxt1" name="WRSpeed"></td>
											</tr>
											<tr>
												<td>Speed</td>
												<td><input type="text" class="addtxt1" name="Speed"></td>
											</tr>
				
											<tr>
												<td>記憶體大小</td>
												<td><input type="text" class="addtxt1" name="MemorySize"></td>
											</tr>
											<tr>
												<td>大小</td>
												<td><input type="text" class="addtxt1" name="Size"></td>
											</tr>
											<tr>
												<td>單價</td>
												<td><input type="text" class="addtxt1" name="UnitPrice"></td>
											</tr>
											<tr>
												<td>保固</td>
												<td><input type="text" class="addtxt1" name="Warranty"></td>
											</tr>
		                                </table>
		                                <input class="detailbtn1" type="submit" value="新增產品">
		                                <input class="detailbtn2" type="reset" value="重新填寫">
		                            </div>
		                        </div>
		                    </div>
		                </div>
			        </form>
				</div>
				<!-- 記憶體 -->
				<div class="tab-pane" id="tab4">
					<form action="../AddProductServlet" method="post" id="addForm">
					 	<input type="hidden" name="ProductType" value="記憶體">
		                <div class="col-lg-12 orderbg">
		                    <div class="detail">
		                        <div class="row">
		                            <div class="col-md-12 detailtitle">
		                                <h2>
		                                    <input type="text" name="ProductID" class="addtxt" placeholder="ProductID,ex.D001">
		                                    <input type="text" name="ProductName" class="addtxt" placeholder="ProductName"> 
		                                </h2>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-md-6 detailimg">
		                                <img src="img/cusbg.jpg" alt="">
		                            </div>
		                            <div class="col-md-6 detailcontent">
		                                <P>產品明細</P>
		                                <table class="table table-hover cart_table">
											<tr>
												<td>廠牌</td>
												<td><input type="text" class="addtxt1" name="ProductBrand"></td>
											</tr>
											<tr>
												<td>Clock</td>
												<td><input type="text" class="addtxt1" name="Clock"></td>
											</tr>
											<tr>
												<td>MemorySlot</td>
												<td><input type="text" class="addtxt1" name="MemorySlot"></td>
											</tr>
											<tr>
												<td>Pinnumber</td>
												<td><input type="text" class="addtxt1" name="PinNumber"></td>
											</tr>
											<tr>
												<td>MemorySize</td>
												<td><input type="text" class="addtxt1" name="MemorySize"></td>
											</tr>
											<tr>
												<td>單價</td>
												<td><input type="text" class="addtxt1" name="UnitPrice"></td>
											</tr>
				
											<tr>
												<td>保固</td>
												<td><input type="text" class="addtxt1" name="Warranty"></td>
											</tr>
										</table>
		                                <input class="detailbtn1" type="submit" value="新增產品">
		                                <input class="detailbtn2" type="reset" value="重新填寫">
		                            </div>
		                        </div>
		                    </div>
		                </div>
			        </form>
				</div>
				<!-- 顯示/繪圖卡 -->
				<div class="tab-pane" id="tab5">
					<form action="../AddProductServlet" method="post" id="addForm">
					 	<input type="hidden" name="ProductType" value="顯示/繪圖卡">
		                <div class="col-lg-12 orderbg">
		                    <div class="detail">
		                        <div class="row">
		                            <div class="col-md-12 detailtitle">
		                                <h2>
		                                    <input type="text" name="ProductID" class="addtxt" placeholder="ProductID,ex.E001">
		                                    <input type="text" name="ProductName" class="addtxt" placeholder="ProductName"> 
		                                </h2>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-md-6 detailimg">
		                                <img src="img/cusbg.jpg" alt="">
		                            </div>
		                            <div class="col-md-6 detailcontent">
		                                <P>產品明細</P>
		                                <table class="table table-hover cart_table">
											<tr>
												<td>廠牌</td>
												<td><input type="text" class="addtxt1" name="ProductBrand"></td>
											</tr>
											<tr>
												<td>Chipset</td>
												<td><input type="text" class="addtxt1" name="Chipset"></td>
											</tr>
											<tr>
												<td>MemorySlot</td>
												<td><input type="text" class="addtxt1" name="MemorySlot"></td>
											</tr>
											<tr>
												<td>ExpansionSlot</td>
												<td><input type="text" class="addtxt1" name="ExpansionSlot"></td>
											</tr>
											<tr>
												<td>CPU</td>
												<td><input type="text" class="addtxt1" name="GPU"></td>
											</tr>
											<tr>
												<td>記憶體大小</td>
												<td><input type="text" class="addtxt1" name="MemorySize"></td>
											</tr>
											<tr>
												<td>單價</td>
												<td><input type="text" class="addtxt1" name="UnitPrice"></td>
											</tr>
											<tr>
												<td>保固</td>
												<td><input type="text" class="addtxt1" name="Warranty"></td>
											</tr>
										</table>
		                                <input class="detailbtn1" type="submit" value="新增產品">
		                                <input class="detailbtn2" type="reset" value="重新填寫">
		                            </div>
		                        </div>
		                    </div>
		                </div>
			        </form>
				</div>
				<!-- 電源供應器 -->
				<div class="tab-pane" id="tab6">
					<form action="../AddProductServlet" method="post" id="addForm">
					 	<input type="hidden" name="ProductType" value="電源供應器">
		                <div class="col-lg-12 orderbg">
		                    <div class="detail">
		                        <div class="row">
		                            <div class="col-md-12 detailtitle">
		                                <h2>
		                                    <input type="text" name="ProductID" class="addtxt" placeholder="ProductID,ex.F001">
		                                    <input type="text" name="ProductName" class="addtxt" placeholder="ProductName"> 
		                                </h2>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-md-6 detailimg">
		                                <img src="img/cusbg.jpg" alt="">
		                            </div>
		                            <div class="col-md-6 detailcontent">
		                                <P>產品明細</P>
		                                <table class="table table-hover cart_table">
											<tr>
												<td>廠牌</td>
												<td><input type="text" class="addtxt1" name="ProductBrand"></td>
											</tr>
											<tr>
												<td>ExpansionSlot</td>
												<td><input type="text" class="addtxt1" name="ExpansionSlot"></td>
											</tr>
											<tr>
												<td>大小</td>
												<td><input type="text" class="addtxt1" name="Size"></td>
											</tr>
											<tr>
												<td>Wattage</td>
												<td><input type="text" class="addtxt1" name="Wattage"></td>
											</tr>
				
											<tr>
												<td>單價</td>
												<td><input type="text" class="addtxt1" name="UnitPrice"></td>
											</tr>
											<tr>
												<td>保固</td>
												<td><input type="text" class="addtxt1" name="Warranty"></td>
											</tr>
										</table>
		                                <input class="detailbtn1" type="submit" value="新增產品">
		                                <input class="detailbtn2" type="reset" value="重新填寫">
		                            </div>
		                        </div>
		                    </div>
		                </div>
			        </form>
				</div>
				<!-- 電腦機殼 -->
				<div class="tab-pane" id="tab7">
					<form action="../AddProductServlet" method="post" id="addForm">
					 	<input type="hidden" name="ProductType" value="電腦機殼">
		                <div class="col-lg-12 orderbg">
		                    <div class="detail">
		                        <div class="row">
		                            <div class="col-md-12 detailtitle">
		                                <h2>
		                                    <input type="text" name="ProductID" class="addtxt" placeholder="ProductID,ex.G001">
		                                    <input type="text" name="ProductName" class="addtxt" placeholder="ProductName"> 
		                                </h2>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-md-6 detailimg">
		                                <img src="img/cusbg.jpg" alt="">
		                            </div>
		                            <div class="col-md-6 detailcontent">
		                                <P>產品明細</P>
		                                <table class="table table-hover cart_table">
			                                <tr>
												<td>廠牌</td>
												<td><input type="text" class="addtxt1" name="ProductBrand"></td>
											</tr>
											<tr>
												<td>Specifications</td>
												<td><input type="text" class="addtxt1" name="Specifications"></td>
											</tr>
											<tr>
												<td>ExpansionSlot</td>
												<td><input type="text" class="addtxt1" name="ExpansionSlot"></td>
											</tr>
											<tr>
												<td>顏色</td>
												<td><input type="text" class="addtxt1" name="Color"></td>
											</tr>
											<tr>
												<td>大小</td>
												<td><input type="text" class="addtxt1" name="Size"></td>
											</tr>
											<tr>
												<td>單價</td>
												<td><input type="text" class="addtxt1" name="UnitPrice"></td>
											</tr>
										</table>
		                                <input class="detailbtn1" type="submit" value="新增產品">
		                                <input class="detailbtn2" type="reset" value="重新填寫">
		                            </div>
		                        </div>
		                    </div>
		                </div>
			        </form>
				</div>
				<!-- DVD燒錄器 -->
				<div class="tab-pane" id="tab8">
					<form action="../AddProductServlet" method="post" id="addForm">
					 	<input type="hidden" name="ProductType" value="DVD燒錄器">
		                <div class="col-lg-12 orderbg">
		                    <div class="detail">
		                        <div class="row">
		                            <div class="col-md-12 detailtitle">
		                                <h2>
		                                    <input type="text" name="ProductID" class="addtxt" placeholder="ProductID,ex.H001">
		                                    <input type="text" name="ProductName" class="addtxt" placeholder="ProductName"> 
		                                </h2>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-md-6 detailimg">
		                                <img src="img/cusbg.jpg" alt="">
		                            </div>
		                            <div class="col-md-6 detailcontent">
		                                <P>產品明細</P>
		                                <table class="table table-hover cart_table">
			                                <tr>
												<td>廠牌</td>
												<td><input type="text" class="addtxt1" name="ProductBrand"></td>
											</tr>
											<tr>
												<td>DriveSpecifications</td>
												<td><input type="text" class="addtxt1" name="DriveSpecifications"></td>
											</tr>
											<tr>
												<td>Specifications</td>
												<td><input type="text" class="addtxt1" name="Specifications"></td>
											</tr>
											<tr>
												<td>顏色</td>
												<td><input type="text" class="addtxt1" name="Color"></td>
											</tr>
				
											<tr>
												<td>單價</td>
												<td><input type="text" class="addtxt1" name="UnitPrice"></td>
											</tr>
											<tr>
												<td>保固</td>
												<td><input type="text" class="addtxt1" name="Warranty"></td>
											</tr>
										</table>
		                                <input class="detailbtn1" type="submit" value="新增產品">
		                                <input class="detailbtn2" type="reset" value="重新填寫">
		                            </div>
		                        </div>
		                    </div>
		                </div>
			        </form>
				</div>
				<!-- CPU散熱風扇 -->
				<div class="tab-pane" id="tab9">
					<form action="../AddProductServlet" method="post" id="addForm">
					 	<input type="hidden" name="ProductType" value="CPU散熱風扇">
		                <div class="col-lg-12 orderbg">
		                    <div class="detail">
		                        <div class="row">
		                            <div class="col-md-12 detailtitle">
		                                <h2>
		                                    <input type="text" name="ProductID" class="addtxt" placeholder="ProductID,ex.I001">
		                                    <input type="text" name="ProductName" class="addtxt" placeholder="ProductName"> 
		                                </h2>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-md-6 detailimg">
		                                <img src="img/cusbg.jpg" alt="">
		                            </div>
		                            <div class="col-md-6 detailcontent">
		                                <P>產品明細</P>
		                                <table class="table table-hover cart_table">
											<tr>
												<td>廠牌</td>
												<td><input type="text" class="addtxt1" name="ProductBrand"></td>
											</tr>
											<tr>
												<td>CPUSlot</td>
												<td><input type="text" class="addtxt1" name="CPUSlot"></td>
											</tr>
											<tr>
												<td>Speed</td>
												<td><input type="text" class="addtxt1" name="Speed"></td>
											</tr>
											<tr>
												<td>Noise</td>
												<td><input type="text" class="addtxt1" name="Noise"></td>
											</tr>
				
											<tr>
												<td>單價</td>
												<td><input type="text" class="addtxt1" name="UnitPrice"></td>
											</tr>
				
										</table>
		                                <input class="detailbtn1" type="submit" value="新增產品">
		                                <input class="detailbtn2" type="reset" value="重新填寫">
		                            </div>
		                        </div>
		                    </div>
		                </div>
			        </form>
				</div>
				<!-- 液晶螢幕 -->
				<div class="tab-pane" id="tab10">
					<form action="../AddProductServlet" method="post" id="addForm">
					 	<input type="hidden" name="ProductType" value="液晶螢幕">
		                <div class="col-lg-12 orderbg">
		                    <div class="detail">
		                        <div class="row">
		                            <div class="col-md-12 detailtitle">
		                                <h2>
		                                    <input type="text" name="ProductID" class="addtxt" placeholder="ProductID,ex.J001">
		                                    <input type="text" name="ProductName" class="addtxt" placeholder="ProductName"> 
		                                </h2>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-md-6 detailimg">
		                                <img src="img/cusbg.jpg" alt="">
		                            </div>
		                            <div class="col-md-6 detailcontent">
		                                <P>產品明細</P>
		                                <table class="table table-hover cart_table">
											<tr>
												<td>廠牌</td>
												<td><input type="text" class="addtxt1" name="ProductBrand"></td>
											</tr>
											<tr>
												<td>顏色</td>
												<td><input type="text" class="addtxt1" name="Color"></td>
											</tr>
											<tr>
												<td>大小</td>
												<td><input type="text" class="addtxt1" name="Size"></td>
											</tr>
				
											<tr>
												<td>單價</td>
												<td><input type="text" class="addtxt1" name="UnitPrice"></td>
											</tr>
											<tr>
												<td>保固</td>
												<td><input type="text" class="addtxt1" name="Warranty"></td>
											</tr>
										</table>
		                                <input class="detailbtn1" type="submit" value="新增產品">
		                                <input class="detailbtn2" type="reset" value="重新填寫">
		                            </div>
		                        </div>
		                    </div>
		                </div>
			        </form>
				</div>
				<!-- 鍵盤 -->
				<div class="tab-pane" id="tab11">
					<form action="../AddProductServlet" method="post" id="addForm">
					 	<input type="hidden" name="ProductType" value="鍵盤">
		                <div class="col-lg-12 orderbg">
		                    <div class="detail">
		                        <div class="row">
		                            <div class="col-md-12 detailtitle">
		                                <h2>
		                                    <input type="text" name="ProductID" class="addtxt" placeholder="ProductID,ex.K001">
		                                    <input type="text" name="ProductName" class="addtxt" placeholder="ProductName"> 
		                                </h2>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-md-6 detailimg">
		                                <img src="img/cusbg.jpg" alt="">
		                            </div>
		                            <div class="col-md-6 detailcontent">
		                                <P>產品明細</P>
		                                <table class="table table-hover cart_table">
	
											<tr>
												<td>廠牌</td>
												<td><input type="text" class="addtxt1" name="ProductBrand"></td>
											</tr>
											<tr>
												<td>Specifications</td>
												<td><input type="text" class="addtxt1" name="Specifications"></td>
											</tr>
											<tr>
												<td>顏色</td>
												<td><input type="text" class="addtxt1" name="Color"></td>
											</tr>
											<tr>
												<td>單價</td>
												<td><input type="text" class="addtxt1" name="UnitPrice"></td>
											</tr>
				
											<tr>
												<td>保固</td>
												<td><input type="text" class="addtxt1" name="Warranty"></td>
											</tr>
										</table>
		                                <input class="detailbtn1" type="submit" value="新增產品">
		                                <input class="detailbtn2" type="reset" value="重新填寫">
		                            </div>
		                        </div>
		                    </div>
		                </div>
			        </form>
				</div>
				<!-- 滑鼠 -->
				<div class="tab-pane" id="tab12">
					<form action="../AddProductServlet" method="post" id="addForm">
					 	<input type="hidden" name="ProductType" value="滑鼠">
		                <div class="col-lg-12 orderbg">
		                    <div class="detail">
		                        <div class="row">
		                            <div class="col-md-12 detailtitle">
		                                <h2>
		                                    <input type="text" name="ProductID" class="addtxt" placeholder="ProductID,ex.L001">
		                                    <input type="text" name="ProductName" class="addtxt" placeholder="ProductName"> 
		                                </h2>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-md-6 detailimg">
		                                <img src="img/cusbg.jpg" alt="">
		                            </div>
		                            <div class="col-md-6 detailcontent">
		                                <P>產品明細</P>
		                                <table class="table table-hover cart_table">
	
											<tr>
												<td>廠牌</td>
												<td><input type="text" class="addtxt1" name="ProductBrand"></td>
											</tr>
											<tr>
												<td>Specifications</td>
												<td><input type="text" class="addtxt1" name="Specifications"></td>
											</tr>
											<tr>
												<td>顏色</td>
												<td><input type="text" class="addtxt1" name="Color"></td>
											</tr>
											<tr>
												<td>單價</td>
												<td><input type="text" class="addtxt1" name="UnitPrice"></td>
											</tr>
				
											<tr>
												<td>保固</td>
												<td><input type="text" class="addtxt1" name="Warranty"></td>
											</tr>
										</table>
		                                <input class="detailbtn1" type="submit" value="新增產品">
		                                <input class="detailbtn2" type="reset" value="重新填寫">
		                            </div>
		                        </div>
		                    </div>
		                </div>
			        </form>
				</div>
				<!-- 喇叭 -->
				<div class="tab-pane" id="tab13">
					<form action="../AddProductServlet" method="post" id="addForm">
					 	<input type="hidden" name="ProductType" value="喇叭">
		                <div class="col-lg-12 orderbg">
		                    <div class="detail">
		                        <div class="row">
		                            <div class="col-md-12 detailtitle">
		                                <h2>
		                                    <input type="text" name="ProductID" class="addtxt" placeholder="ProductID,ex.M001">
		                                    <input type="text" name="ProductName" class="addtxt" placeholder="ProductName"> 
		                                </h2>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-md-6 detailimg">
		                                <img src="img/cusbg.jpg" alt="">
		                            </div>
		                            <div class="col-md-6 detailcontent">
		                                <P>產品明細</P>
		                                <table class="table table-hover cart_table">
	
											<tr>
												<td>廠牌</td>
												<td><input type="text" class="addtxt1" name="ProductBrand"></td>
											</tr>
											<tr>
												<td>Specifications</td>
												<td><input type="text" class="addtxt1" name="Specifications"></td>
											</tr>
											<tr>
												<td>顏色</td>
												<td><input type="text" class="addtxt1" name="Color"></td>
											</tr>
											<tr>
												<td>Wattage</td>
												<td><input type="text" class="addtxt1" name="Wattage"></td>
											</tr>
											<tr>
												<td>單價</td>
												<td><input type="text" class="addtxt1" name="UnitPrice"></td>
											</tr>
				
											<tr>
												<td>保固</td>
												<td><input type="text" class="addtxt1" name="Warranty"></td>
											</tr>
										</table>
		                                <input class="detailbtn1" type="submit" value="新增產品">
		                                <input class="detailbtn2" type="reset" value="重新填寫">
		                            </div>
		                        </div>
		                    </div>
		                </div>
			        </form>
				</div>
				<!-- 作業系統 -->
				<div class="tab-pane" id="tab14">
					<form action="../AddProductServlet" method="post" id="addForm">
					 	<input type="hidden" name="ProductType" value="作業系統">
		                <div class="col-lg-12 orderbg">
		                    <div class="detail">
		                        <div class="row">
		                            <div class="col-md-12 detailtitle">
		                                <h2>
		                                    <input type="text" name="ProductID" class="addtxt" placeholder="ProductID,ex.N001">
		                                    <input type="text" name="ProductName" class="addtxt" placeholder="ProductName"> 
		                                </h2>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-md-6 detailimg">
		                                <img src="img/cusbg.jpg" alt="">
		                            </div>
		                            <div class="col-md-6 detailcontent">
		                                <P>產品明細</P>
		                                <table class="table table-hover cart_table">
	
											<tr>
												<td>廠牌</td>
												<td><input type="text" class="addtxt1" name="ProductBrand"></td>
											</tr>
				
											<tr>
												<td>單價</td>
												<td><input type="text" class="addtxt1" name="UnitPrice"></td>
											</tr>
				
				
										</table>
		                                <input class="detailbtn1" type="submit" value="新增產品">
		                                <input class="detailbtn2" type="reset" value="重新填寫">
		                            </div>
		                        </div>
		                    </div>
		                </div>
			        </form>
				</div>
				<!-- 網路卡 -->
				<div class="tab-pane" id="tab15">
					<form action="../AddProductServlet" method="post" id="addForm">
					 	<input type="hidden" name="ProductType" value="網路卡">
		                <div class="col-lg-12 orderbg">
		                    <div class="detail">
		                        <div class="row">
		                            <div class="col-md-12 detailtitle">
		                                <h2>
		                                    <input type="text" name="ProductID" class="addtxt" placeholder="ProductID,ex.O001">
		                                    <input type="text" name="ProductName" class="addtxt" placeholder="ProductName"> 
		                                </h2>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-md-6 detailimg">
		                                <img src="img/cusbg.jpg" alt="">
		                            </div>
		                            <div class="col-md-6 detailcontent">
		                                <P>產品明細</P>
		                                <table class="table table-hover cart_table">
	
											<tr>
												<td>廠牌</td>
												<td><input type="text" class="addtxt1" name="ProductBrand"></td>
											</tr>
											<tr>
												<td>Specifications</td>
												<td><input type="text" class="addtxt1" name="Specifications"></td>
											</tr>
											<tr>
												<td>EpansionSlot</td>
												<td><input type="text" class="addtxt1" name="ExpansionSlot"></td>
											</tr>
				
											<tr>
												<td>單價</td>
												<td><input type="text" class="addtxt1" name="UnitPrice"></td>
											</tr>
				
											<tr>
												<td>保固</td>
												<td><input type="text" class="addtxt1" name="Warranty"></td>
											</tr>
										</table>
		                                <input class="detailbtn1" type="submit" value="新增產品">
		                                <input class="detailbtn2" type="reset" value="重新填寫">
		                            </div>
		                        </div>
		                    </div>
		                </div>
			        </form>
				</div>
				<!-- I/O -->
				<div class="tab-pane" id="tab16">
					<form action="../AddProductServlet" method="post" id="addForm">
					 	<input type="hidden" name="ProductType" value="I/O">
		                <div class="col-lg-12 orderbg">
		                    <div class="detail">
		                        <div class="row">
		                            <div class="col-md-12 detailtitle">
		                                <h2>
		                                    <input type="text" name="ProductID" class="addtxt" placeholder="ProductID,ex.P001">
		                                    <input type="text" name="ProductName" class="addtxt" placeholder="ProductName"> 
		                                </h2>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-md-6 detailimg">
		                                <img src="img/cusbg.jpg" alt="">
		                            </div>
		                            <div class="col-md-6 detailcontent">
		                                <P>產品明細</P>
		                                <table class="table table-hover cart_table">
	
											<tr>
												<td>廠牌</td>
												<td><input type="text" class="addtxt1" name="ProductBrand"></td>
											</tr>
				
											<tr>
												<td>EpansionSlot</td>
												<td><input type="text" class="addtxt1" name="ExpansionSlot"></td>
											</tr>
				
											<tr>
												<td>單價</td>
												<td><input type="text" class="addtxt1" name="UnitPrice"></td>
											</tr>
				
											<tr>
												<td>保固</td>
												<td><input type="text" class="addtxt1" name="Warranty"></td>
											</tr>
										</table>
		                                <input class="detailbtn1" type="submit" value="新增產品">
		                                <input class="detailbtn2" type="reset" value="重新填寫">
		                            </div>
		                        </div>
		                    </div>
		                </div>
			        </form>
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