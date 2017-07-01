package com.rev.pubhub.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rev.pubhub.model.Book;
import com.rev.pubhub.model.Order;
import com.rev.pubhub.model.User;
import com.rev.pubhub.service.BookService;
import com.rev.pubhub.service.OrderService;
import com.rev.pubhub.service.UserService;

import ch.qos.logback.core.net.SyslogOutputStream;

@Controller
@RequestMapping("/orders")
public class OrderController {
	@Autowired
	BookService bookService;
	@Autowired
	OrderService orderService;
	@Autowired
	UserService userService;

	@GetMapping("/order")
	public String ordering(ModelMap modelMap,HttpSession session) {
		
		User user= (User)session.getAttribute("LOGGED_IN_USER");
		System.out.println("BookController -> list");
		List<Book> booksList = bookService.findAll();
		modelMap.addAttribute("ORDER_LIST", booksList);
		System.out.println(booksList);

		return "redirect:../orderItems/toCart";

	}

	@GetMapping("/{id}")
	public String addToCart(@PathVariable("id") Long id, ModelMap modelMap, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("LOGGED_IN_USER");
		System.out.println("ShowBook:" + id);
		Book book = bookService.findOne(id);
		modelMap.addAttribute("CLICKED_BOOK", book);
		return "orders/bookordered";

	}

	@PostMapping("/insert")
	public String placeOrder(@RequestParam("total_amount") Integer totalAmount, HttpSession session, ModelMap modelMap)
			throws Exception {

		User user = (User) session.getAttribute("LOGGED_IN_USER");
		Order thingsInCart = (Order) session.getAttribute("CART_ITEMS");
		int sizeOfCart = thingsInCart.getOrderItems().size();
		if (thingsInCart != null && sizeOfCart > 0) {
			thingsInCart.setTotalPrice(totalAmount);
			orderService.insertToTable(thingsInCart);
			session.removeAttribute("CART_ITEMS");
			String toDiaplaytouser = userService.sendOrderDetails(user.getEmail(), thingsInCart, user.getName());
			System.out.println(toDiaplaytouser);
			modelMap.addAttribute("USER_END_MESSAGE", toDiaplaytouser);

		}

		return "orders/orderplaced";
	}

	@GetMapping("/displayHistory")
	public String myOrders(ModelMap modelMap, HttpSession session) {

		User loggedInUser = (User) session.getAttribute("LOGGED_IN_USER");
		List<Order> order = orderService.findAllOrderList(loggedInUser.getId());
		modelMap.addAttribute("ORDER_LIST", order);
		return "orders/orderhistory";

	}

}
