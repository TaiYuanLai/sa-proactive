<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="database.*"%>
<%@ page import="bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>新增優惠組合</title>
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
			<a class="navbar-brand" href="manageCombination.jsp"> 
				<span>PROACTIVE</span>後台管理系統
			</a>
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-left navcolor">
				<li><a href="##">周邊零件管理</a></li>
				<li><a href="manageCombination.jsp">優惠組合管理</a></li>
				<li><a href="##">客製化組裝管理</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right navcolor">
				
					<%=session.getAttribute("managerName")%><b class="caret"></b></a>
						<li><a href="##">訂單管理</a></li>
						<li><a href="../MLogoutServlet">登出</a></li>
				
			</ul>
		</div>

	</div>
	<!-- /.container --> </nav>

	

	<div class="container_reg">


		<div class="container">
			<div class="col-lg-12 orderbg">
				<div class="col-lg-12 orderhead">					
          <h1>
						<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
						新增優惠組合
					</h1><br>
				</div>

				<div class="col-lg-12 combicontent table">
					
					<table class="">
						<thead>
						<tr>
						<td><h4>優惠組合編號:&nbsp; </h4></td>
						<td><input type="text" name="CombinationID"></td>					
						</tr>
						<tr>
						<td><h4>優惠組合名稱:&nbsp;</h4></td>
						<td><input type="text" name="CombinationName"></td>						
						</tr>
						<tr>
						<td><h4>價格:&nbsp;</h4></td>
						<td><input type="text" name="CombinationName"></td>					
						</tr>
						<tr>
						<td><h4>上傳圖片:&nbsp;</h4></td>
						<td><input type="text" name="ComImage"></td>					
						</tr>
						<tr>
						<td><h4>中央處理器:&nbsp;</h4></td>
						<td>
						<select>
                        <option>抓資料庫</option>
                        </select>
                        </td>					
						</tr>
						<tr>
						<td><h4>主機板:&nbsp;</h4></td>
						<td>
						<select>
                       
                        </select>
                        </td>					
						</tr>
						<tr>
						<td><h4>中央處理器:&nbsp;</h4></td>
						<td>
						<select>
                       
                        </select>
                        </td>					
						</tr>
						<tr>
						<td><h4>硬碟/SSD:&nbsp;</h4></td>
						<td>
						<select>
                       
                        </select>
                        </td>					
						</tr>
						<tr>
						<td><h4>記憶體:&nbsp;</h4></td>
						<td>
						<select>
                       
                        </select>
                        </td>					
						</tr>
						<tr>
						<td><h4>顯示/繪圖卡:&nbsp;</h4></td>
						<td>
						<select>
                       
                        </select>
                        </td>					
						</tr>
						<tr>
						<td><h4>電源供應器:&nbsp;</h4></td>
						<td>
						<select>
                       
                        </select>
                        </td>					
						</tr><tr>
						<td><h4>電腦機殼:&nbsp;</h4></td>
						<td>
						<select>
                       
                        </select>
                        </td>					
						</tr><tr>
						<td><h4>DVD燒錄器:&nbsp;</h4></td>
						<td>
						<select>
                       
                        </select>
                        </td>					
						</tr>
						<tr>
						<td><h4>描述:&nbsp;</h4></td>
						<td>
					    <form method="post" action="">
                        <textarea name="comments" cols="25" rows="5">                       
                        </textarea>
                        </form>
                        </td>					
						</tr>
						
						</thead>
						<tbody>

						
							
						</tbody>
					
					</table><br>
					<button type="button">確認送出</button>&nbsp; &nbsp;
					<button type="reset">重新修改</button>
					
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
	
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>
</html>