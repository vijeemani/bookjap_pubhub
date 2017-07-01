<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>DashBoard</title>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

.logo-small {
	color: #f4511e;
	font-size: 50px;
}

.logo {
	color: #f4511e;
	font-size: 200px;
}
table {
    border-collapse: collapse;
}

/* remove padding */
td, th {
    padding: 0;
}
.table-borderless > tbody > tr > td,
.table-borderless > tbody > tr > th,
.table-borderless > tfoot > tr > td,
.table-borderless > tfoot > tr > th,
.table-borderless > thead > tr > td,
.table-borderless > thead > tr > th {
    border: none;
}
input[type=text] {
	width: 130px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
	background-color: white;
	background-image: url('searchicon.png');
	background-position: 10px 10px;
	background-repeat: no-repeat;
	padding: 12px 20px 12px 40px;
	-webkit-transition: width 0.4s ease-in-out;
	transition: width 0.4s ease-in-out;
}

input[type=text]:focus {
	width: 90%;
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
			<b><a href="../profile/profileopen">${USER.name}</a></b>
		</h3>
	</div>
	<div class="w3-padding-64 w3-large w3-text-grey"
		style="font-weight: bold" color="#f4511e">
		<a href="#" class="w3-bar-item w3-button"><lable color="#f4511e">
			Filters </lable> </a> <a onclick="myAccFunc()" href="javascript:void(0)"
			class="w3-button w3-block w3-white w3-left-align" id="myBtn"> <label
			color="#f4511e"> Books filter </label> <i class="fa fa-caret-down"></i>
		</a>

		<div id="demoAcc"
			class="w3-bar-block w3-hide w3-padding-large w3-medium">
			<a href="../books/listAsc"
				class="w3-bar-item w3-button w3-light-grey"><i
				class="w3-bar-item w3-button"></i>Low to high -price</a> <a
				href="../books/listDesc" class="w3-bar-item w3-button">high to
				Low -price </a>
				 <a
				href="../books/releaseddate" class="w3-bar-item w3-button">New To Old </a>
		</div>
		<a href="../books/booklist" class="w3-bar-item w3-button"><lable
				color="#f4511e"> View all Books </lable> </a>

	</div>
	</nav>
	<div class="w3-main" style="margin-left: 250px" >


		<header class="w3-container w3-xlarge" style="margin-top:40px">


		<p class="w3-left">Book View</p>
		<p class="w3-right">
			<a href="../orders/displayHistory"
				class="fa fa-shopping-cart w3-margin-right"></a> <a
				class="fa fa-sign-out" style="margin-left: 40px"
				href="../users/logout"> </a>

		</p>
		<br>

		</header>
		<form action="../../books/specificBook" method="get">
			<input type="text" name="bookname" placeholder="name of book">
			<button class="btn btn-primary" type="submit">search</button>
		</form>
	</div>
<br>
	<!-- Top menu on small screens -->
	<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
	<div class="w3-bar-item w3-padding-24 w3-wide">Pubhub200</div>
	<a href="javascript:void(0)"
		class="w3-bar-item w3-button w3-padding-24 w3-right"
		onclick="w3_open()"><i class="fa fa-bars"></i></a> </header>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large" onclick="w3_close()"
		style="cursor: pointer" title="close side menu" id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 350px">



		<!-- Product grid -->
		<div class="w3-row w3-grayscale">
			<div class="w3-col l3 s6">
				<div class="w3-container">
					<img src="../assests/images/python.jpg" style="width: 100%">
					<p>
						Python<br> <b>$24.99</b>
					</p>
				</div>
				<div class="w3-container">
					<img src="../assests/images/jscript.png" style="width: 100%">
					<p>
						Java Script<br> <b>$19.99</b>
					</p>
				</div>
			</div>

			<div class="w3-col l3 s6">
				<div class="w3-container">
					<div class="w3-display-container">
						<img src="../assests/images/java.jpg" style="width: 100%"> <span
							class="w3-tag w3-display-topleft">New</span>
					</div>
					<p>
						Java Complete Reference<br> <b>$19.99</b>
					</p>
				</div>
				<div class="w3-container">
					<img src="../assests/images/cpp.jpg" style="width: 100%">
					<p>
						C++<br> <b>$20.50</b>
					</p>
				</div>
			</div>

			<div class="w3-col l3 s6">
				<div class="w3-container">
					<img src="../assests/images/dbms.jpg" style="width: 100%"
						height="300">
					<p>
						Database Management System<br> <b>$20.50</b>
					</p>
				</div>
				<div class="w3-container">
					<div class="w3-display-container">
						<img src="../assests/images/st.jpg" style="width: 100%"> <span
							class="w3-tag w3-display-topleft">Sale</span>
						<div class="w3-display-middle w3-display-hover">
							<button class="w3-button">
								Buy now <i class="fa fa-shopping-cart"></i>
							</button>
						</div>
					</div>
					<p>
						Software Testing<br> <b class="w3-text-red">$14.99</b>
					</p>
				</div>
			</div>

		</div>




		<div class="w3-black w3-center w3-padding-24" color="#f4511e">
			Powered by <a title="W3.CSS" target="_blank" class="w3-hover-opacity">spring_boot</a>
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