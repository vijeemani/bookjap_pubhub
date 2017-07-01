package com.rev.pubhub.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rev.pubhub.model.Book;
import com.rev.pubhub.model.Order;
import com.rev.pubhub.model.OrderItem;
import com.rev.pubhub.model.User;
import com.rev.pubhub.service.BookService;



@Controller
@RequestMapping("/orderItems")
public class OrderedItemController {
	@Autowired
	private BookService bookService;
	
	@PostMapping("/toCart")
	public String addToCart(@RequestParam("book_id") Long bookId, @RequestParam("qty") Integer qty,
			HttpSession session,ModelMap  modelMap) {

		User user = (User) session.getAttribute("LOGGED_IN_USER");

		Order order = (Order) session.getAttribute("CART_ITEMS");

		modelMap.addAttribute("USER", user);

		if (order == null) {
			order = new Order();
			order.setUser(user);
			order.setTotalPrice(0);
			order.setStatus("ORDERED");
		}

		List<OrderItem> orderItems = order.getOrderItems();

		
		boolean isItemExists = false;
		for (OrderItem item : orderItems) {

			if (item.getBook().getId().equals(bookId)) {
				int totalQuantity = item.getQuantity() + qty;
				item.setQuantity(totalQuantity);
				isItemExists = true;
			}
		}

		if ( ! isItemExists) {

			OrderItem orderItem = new OrderItem();
			orderItem.setOrder(order);

			Book book = bookService.findOne(bookId);
			orderItem.setBook(book);
			orderItem.setQuantity(qty);
			orderItems.add(orderItem);
		}

		order.setOrderItems(orderItems);

		session.setAttribute("CART_ITEMS", order);

		
		return "orders/ordersummary"; 
	}
	
	@GetMapping("/remove")
	public String removeItemFromCart(@RequestParam("id") Integer id, HttpSession session) {

		System.out.println("Remove Item from Card:" + id);
		Order order = (Order) session.getAttribute("CART_ITEMS");

		if (order != null && order.getOrderItems().size() > 0) {
			List<OrderItem> orderItems = order.getOrderItems();
			OrderItem itemSelected = orderItems.get(id);
			orderItems.remove(itemSelected);
			order.setOrderItems(orderItems);
			session.setAttribute("CART_ITEMS", order);
		}

		return "redirect:../orderItems/toCart";

	}
	
	@GetMapping("/emptycart")
	public String emptyCartid(HttpSession session) {

		session.removeAttribute("CART_ITEMS");
		return "redirect:../orderItems/toCart";

	}

		
}
