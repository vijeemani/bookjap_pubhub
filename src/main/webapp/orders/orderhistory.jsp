<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../headerfile/tags.jsp" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order History</title>
<style>
h1{
font-family: "Montserrat", sans-serif;
color:"#f4511e"
}

</style>
</head>
<body >

	<h1>Your order History</h1>

	<table class="table table-striped">
		<thead>

			<tr>
				<th width="10%">Order Id</th>
				<th>Order Items</th>
				<th>Amount</th>
				<th>Status</th>
				<th>Ordered Date</th>
			</tr>

		</thead>
		<tbody>
			<c:forEach items="${ORDER_LIST}" var="order">
				<tr>
					<td>${order.id}</td>
					<td>
						<ul>
							<c:forEach items="${order.orderItems}" var="item">
								<li>${item.book.name}(Quantity- ${item.quantity} )</li>
							</c:forEach>
						</ul>
					</td>
					<td>Rs. ${order.totalPrice }</td>
					<td>${order.status}</td>
					<td>${order.orderedDate }</td>
					<c:if test="${order.status == 'ORDERED'}">
						<td><a
							href="../orders/updateStatus?id=${order.id}&status=CANCELLED"
							class="btn btn-warning btn-sm">Cancel Order </a></td>
					</c:if>

				</tr>

			</c:forEach>
		</tbody>
	</table>
 	<a href="../books/booklist" class="btn btn-info">back to shopping</a>

</body>
</html>