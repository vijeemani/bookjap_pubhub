<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../headerfile/tags.jsp" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<title>OrderSummary</title>
<style>
.navbar-inverse {
	background-color: #f4511e;
	border-color: #E7E7E7;
}
</style>

</head>
<body>

<nav class="navbar navbar-inverse">
	<p class="navbar-text">Pubhub@200</p>
	<ul class="nav navbar-nav">
		<li><a href="">Home</a></li>
		<li><a href="#">My orders</a></li>
	</ul>

	</nav>
	<div class="content">
		<div class="container-fluid">

			<div class="row">

				<div class="col-md-8">
					<h5>${USER.name}'s Cart</h5>
					<c:if test="${empty CART_ITEMS || CART_ITEMS.orderItems.isEmpty()}">
						<img src="../assests/images/cartempty.png" width="300" />
						<h5> Shopping Cart  empty</h5>
						<a href="../books/booklist" class="btn btn-info">Continue Shopping</a>
					</c:if>
					<c:if test="${!empty CART_ITEMS && !CART_ITEMS.orderItems.isEmpty()}">
						<table border="1" class="table table-bordered">
							<thead>
								<tr>
									<th width="10%">#</th>
									<th>Item Name</th>
									<th>Quantity</th>
									<th>Total Cost</th>
									<th>Remove from cart </th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${CART_ITEMS.orderItems}" var="item"
									varStatus="loopIt">
									<tr>
										<td>${loopIt.index+1}</td>
										<td>${item.book.name}</td>
										<td>${item.quantity}</td>
										<td>Rs.${item.book.price*item.quantity }</td>
										<td><a href="../orderItems/remove?id=${loopIt.index}" class="btn btn-danger btn-lg">
          <span class="glyphicon glyphicon-remove"></span>  </a>
									</tr>
								</c:forEach>
							</tbody>
						</table>


						<br />
						<a href="../books/bookist" class="btn btn-info">Continue Shopping</a>


					</c:if>
				</div>

				<c:if test="${ CART_ITEMS != null && CART_ITEMS.orderItems.size()>0}">
					<div class="col-md-4">
						
						<c:set var="no_of_items"
							value="${CART_ITEMS.orderItems.size()}" />
						<c:set var="total_amount" value="0" />
						<c:forEach items="${CART_ITEMS.orderItems}" var="item">
							<c:set var="total_amount"
								value="${total_amount + item.book.price*item.quantity}" />
						</c:forEach>

						<form name="orderForm" action="../orders/insert" method="post">
						
							<input type="hidden" name="total_amount" value="${total_amount}" />
							<table class="table table-striped" style="margin-top:200px">

								<tbody>
									<tr>
										<td>Price ( ${no_of_items != null ?no_of_items:0} items )</td>
										<td>Rs. ${total_amount}</td>
									</tr>
									<tr>
										<th><b>Amount Payable </b></th>
										<th><b>Rs. ${total_amount}</b></th>
									</tr>
									<tr>
										<td colspan="2" align="center">
										
										<button type="submit" 
											class="btn btn-success btn-block" >Confirm Order </button></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</c:if>
			</div>
		</div>
	</div>

	
	
	
</body>
</html>