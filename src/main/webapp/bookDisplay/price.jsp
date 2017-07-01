<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DashBoard</title>
<jsp:include page="../headerfile/tags.jsp" />
<style>
.w3-sidebar a {
	font-family: "Roboto", sans-serif
}

body, h1, h2, h3, h4, h5, h6, .w3-wide {
	font-family: "Montserrat", sans-serif;
}


header {
	margin-top =: 100px;
}

footer {
	background-color: #f4511e;
	text-indent: 50px;
	font: 400 15px Lato, sans-serif;
	line-height: 1.8;
}

i, a, h1, h2, h3, h4, h5, h6 {
	color: #f4511e;
}

p {
	margin-top: 30px;
}

table {
	align: center;
	margin-top: 50px;
}

.logo-small {
	color: #f4511e;
	font-size: 50px;
}

.logo {
	color: #f4511e;
	font-size: 200px;
}

.center {
	margin: 30px;
	width: 60%;
	padding: 10px;
}

input[type=text] {
	width: 130px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
	background-color: white;
	background-position: 10px 10px;
	background-repeat: no-repeat;
	padding: 12px 20px 12px 40px;
}

input[type=text]:focus {
	width: 90%;
}
.table-borderless > tbody > tr > td,
.table-borderless > tbody > tr > th,
.table-borderless > tfoot > tr > td,
.table-borderless > tfoot > tr > th,
.table-borderless > thead > tr > td,
.table-borderless > thead > tr > th {
    border: none;
}

</style>
<body class="w3-content" style="max-width: 1200px">


	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top"
		style="z-index:3;width:250px" id="mySidebar">
	<div class="w3-container w3-display-container w3-padding-16">
		<i onclick="w3_close()"
			class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
		<h3 class="w3-wide">
			<b><a>${USER_NAME.name}</a></b>
		</h3>
	</div>
	<div class="w3-padding-64 w3-large w3-text-grey"
		style="font-weight: bold" color="#f4511e">
		<a href="#" class="w3-bar-item w3-button"><lable color="#f4511e">
			Authors </lable> </a> <a onclick="myAccFunc()" href="javascript:void(0)"
			class="w3-button w3-block w3-white w3-left-align" id="myBtn"> <label
			color="#f4511e"> Books </label> <i class="fa fa-caret-down"></i>
		</a>

		<div id="demoAcc"
			class="w3-bar-block w3-hide w3-padding-large w3-medium">
			<a href="../books/listAsc"
				class="w3-bar-item w3-button w3-light-grey"><i
				class="w3-bar-item w3-button"></i>Low to high -price</a> <a
				href="../books/listDesc" class="w3-bar-item w3-button">high to
				Low -price </a> <a href="../books/releaseddate"
				class="w3-bar-item w3-button">New To Old </a>
		</div>
		<a href="../books/booklist" class="w3-bar-item w3-button"><lable
				color="#f4511e"> View all Books </lable> </a>

	</div>
	</nav>





	<!-- !PAGE CONTENT! -->

	<div class="w3-main" style="margin-left: 250px">

		<!-- Push down content on small screens -->
		<div class="w3-hide-large" style="margin-top: 100px"></div>

		<header class="w3-container w3-xlarge">


		<p class="w3-left">Book View</p>
		<p class="w3-right">
			<a href="../orders/displayHistory"
				class="fa fa-shopping-cart w3-margin-right"></a> <a
				class="fa fa-sign-out" style="margin-left: 10px"
				href="../users/logout"> </a>
		</p>

		</header>
		<form action="../../books/specificBook" method="get">
			<input type="text" name="bookname" placeholder="name of book">
			<button class="btn btn-primary" type="submit">search</button>
		</form>

		<table class="table table-borderless" style="border-collapse: collapse;">
			<thead>

			</thead>
			<tbody>
				<c:forEach items="${BOOK_LIST_SPECIFIC}" var="book">
					<tr>
						<td><c:if test="${book.name=='Core Java'}">
								<img class="card-img-left" src="../assests/images/java.jpg"
									width="100" alt="Card image cap">

							</c:if> <c:if test="${book.name=='MySQL'}">
								<img class="card-img-left" src="../assests/images/mysql.jpg"
									width="100" alt="Card image cap">

							</c:if> <c:if test="${book.name=='Javascript'}">
								<img class="card-img-left" src="../assests/images/jscript.png"
									width="100" alt="Card image cap">

							</c:if></td>

						<td><a href="../orders/${book.id}">${book.name}</a></td>
						<td>${book.price}</td>


					</tr>
				</c:forEach>

			</tbody>
		</table>



	</div>


	<!-- End page content -->
	</div>


	<script>
		// Accordion 
		function myAccFunc() {
			var x = document.getElementById("demoAcc");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}
		// Click on the "Jeans" link on page load to open the accordion for demo purposes
		document.getElementById("myBtn").click();
		// Script to open and close sidebar
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("myOverlay").style.display = "block";
		}
		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("myOverlay").style.display = "none";
		}
	</script>

</body>
</html>