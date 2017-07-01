package com.rev.pubhub.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rev.pubhub.jsp.BookRepository;
import com.rev.pubhub.jsp.UserRepository;
import com.rev.pubhub.model.Book;
import com.rev.pubhub.model.User;
import com.rev.pubhub.service.BookService;

@Controller
@RequestMapping("/books")
public class BookController {
	@Autowired
	BookService bookService;

	@GetMapping("/booklist")
	public String list(ModelMap modelMap, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("LOGGED_IN_USER");
		System.out.println("BookController -> list");
		List<Book> booksList = bookService.findAll();
		modelMap.addAttribute("BOOK_LIST", booksList);
		modelMap.addAttribute("USER_NAME", loggedInUser);
		System.out.println(booksList);
		System.out.println(loggedInUser.getName());

		return "bookDisplay/user_view";
	}

	@GetMapping("/listDesc")
	public String descList(ModelMap modelMap, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("LOGGED_IN_USER");
		System.out.println("BookController -> lis=>desct");
		List<Book> booksListDesc = bookService.priceDesc();
		modelMap.addAttribute("BOOK_LIST", booksListDesc);
		modelMap.addAttribute("USER_NAME", loggedInUser);
		System.out.println(booksListDesc);
		System.out.println(loggedInUser.getName());

		return "bookDisplay/user_view";

	}

	@GetMapping("/listAsc")
	public String ascList(ModelMap modelMap, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("LOGGED_IN_USER");
		System.out.println("BookController -> lis=>desct");
		List<Book> booksListAsc = bookService.priceAsc();
		modelMap.addAttribute("BOOK_LIST", booksListAsc);
		modelMap.addAttribute("USER_NAME", loggedInUser);
		System.out.println(booksListAsc);
		System.out.println(loggedInUser.getName());

		return "bookDisplay/user_view";

	}

	@GetMapping("/specificBook")
	public String priceRange(@RequestParam("bookname") String bookName, HttpSession session,ModelMap modelMap) {
		User loggedInUser = (User) session.getAttribute("LOGGED_IN_USER");
		System.out.println("BookController -> list->specificbook");
		List<Book> booksLisSpecific = bookService.specificBook(bookName);
		modelMap.addAttribute("BOOK_LIST_SPECIFIC", booksLisSpecific);
		modelMap.addAttribute("USER_NAME", loggedInUser);
		System.out.println(booksLisSpecific);
		System.out.println(loggedInUser.getName());	
		
		return "bookDisplay/price";

	}
	@GetMapping("/releaseddate")
	public String releasedDate(ModelMap modelMap,HttpSession session){
		
		User loggedInUser = (User) session.getAttribute("LOGGED_IN_USER");
		System.out.println("BookController -> list->");
		List<Book> booksListDate = bookService.findByOrderByReleasedOnDesc();
		modelMap.addAttribute("BOOK_LIST_SPECIFIC", booksListDate);
		modelMap.addAttribute("USER_NAME", loggedInUser);
		System.out.println(booksListDate);
		System.out.println(loggedInUser.getName());	
		
		return "bookDisplay/price";
	}
}
