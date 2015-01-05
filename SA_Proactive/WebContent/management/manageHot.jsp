<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>熱銷資訊</title>
	<link rel="shortcut icon" href="img/logo3.jpg">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="manageProduct.jsp"> <span>PROACTIVE</span>後台管理系統
			</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-left navcolor">
				<li><a href="manageProduct.jsp">產品管理</a></li>
				<li><a href="manageCombination.jsp">優惠組合管理</a></li>
				<li class="active"><a href="manageHot.jsp">熱銷資訊管理</a></li>
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
	</nav>
	<div class="container_reg">
	<div class="container hotProduct_div">
<h2 class="cart_h2"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>熱銷資訊管理</h2>
   <form action="">
    <table class="table table-hover  table_chg">
        <thead>
            <tr>
                <td>商品種類</td>
                <td>No.1</td>
                <td>No.2</td>
                <td>No.3</td>
            </tr>
        </thead>
        <tbody>
            <tr>
	            <td>CPU</td>
	            <td>
		            <select name="" id="">
		            	<option value="">cpu1</option>
		            	<option value="">cpu2</option>
		            	<option value="">cpu3</option>
		            </select>
	            </td>
	            <td>
	            	<select name="" id="">
	            		<option value="">cpu1</option>
	            		<option value="">cpu2</option>
	            		<option value="">cpu3</option>
	            	</select>
	            </td>
	            <td>
	            	<select name="" id="">
	            		<option value="">cpu1</option>
	            		<option value="">cpu2</option>
	            		<option value="">cpu3</option>
	            	</select>
	            </td>
	        </tr>
	        <tr>
	            <td>MD</td>
	            <td>
		            <select name="" id="">
		            	<option value="">MD1</option>
		            	<option value="">MD2</option>
		            	<option value="">MD3</option>
		            </select>
	            </td>
	            <td>
	            	<select name="" id="">
	            		<option value="">MD1</option>
	            		<option value="">MD2</option>
	            		<option value="">MD3</option>
	            	</select>
	            </td>
	            <td>
	            	<select name="" id="">
	            		<option value="">MD1</option>
	            		<option value="">MD2</option>
	            		<option value="">MD3</option>
	            	</select>
	            </td>
	        </tr>
        </tbody> 
    </table>
    <button>確定儲存</button>
    </form>
</div>
   	<p class="footer_right">Copyright &copy; 2014 PROACTIVE</p>
	
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