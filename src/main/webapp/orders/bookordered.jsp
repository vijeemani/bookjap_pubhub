<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<jsp:include page="../headerfile/tags.jsp" />

<style>
.navbar-inverse {
	background-color: #f4511e;
	border-color: #E7E7E7;
}
</style>
<title>OrderList</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
	<p class="navbar-text">Pubhub@200</p>
	<ul class="nav navbar-nav">
		<li><a href="">Home</a></li>
		<li><a href="#">My orders</a></li>
	</ul>

	</nav>

	<div class="container-fluid">

		<div class="row">
			<div class="col-md-12">

				<b>Item Details</b>
				<c:if test="${empty LOGGED_IN_USER}">
					<div class="alert alert-danger" role="alert">
						Please <strong>Login</strong> to add items to cart.
					</div>
				</c:if>

				<form action="../orderItems/toCart" method="POST">
					<input type="hidden" name="book_id" value="${CLICKED_BOOK.id}" />

					<table class="table table-bordered" border="1">

						<tr>
							<th>Book Name</th>
							<th>Price</th>
							<th>Quantity</th>
						</tr>
						<tr>

							<td>${CLICKED_BOOK.name}</td>

							<td>Rs. ${CLICKED_BOOK.price}</td>
							<td><input type="number" name="qty" min="1" value="1"
								required /></td>

							<c:if test="${!empty LOGGED_IN_USER}">
								<td><button type="submit" class="btn btn-primary" class="fa fa-cart-plus">Add
										To Cart</button></td>
							</c:if>

							<c:if test="${empty LOGGED_IN_USER}">
								<td><button type="submit" class="btn btn-primary" disabled>Add
										To Cart</button></td>
							</c:if>

						</tr>
					</table>
				</form>

			</div>
		</div>
	</div>

</body>
</html>