package com.rev.pubhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rev.pubhub.jsp.BookRepository;
import com.rev.pubhub.model.Book;

@Service
public class BookService {
	@Autowired
	private BookRepository bookRepository;
	
	
	public List<Book> findAll() {
		return bookRepository.findAll();
	}
	
public Book findOne(Long id) {
		return bookRepository.findOne(id);
	}

public List<Book> priceDesc() {
		return bookRepository.findByOrderByPriceDesc();
	}
	
	public List<Book> priceAsc() {
		return bookRepository.findByOrderByPriceAsc();
	}
	public List<Book> specificBook(String name){
		System.out.println("Service reached");
		return bookRepository.findByName(name);
	}

	public List<Book> findByOrderByReleasedOnDesc() {
		return bookRepository.findByOrderByReleasedOnDesc();
	}
	
	/*public List<BookSalesResult> findBookSales()
	{
		return bookSalesRepository.findBookSales();
	}*/

}
