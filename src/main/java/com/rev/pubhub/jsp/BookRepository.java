package com.rev.pubhub.jsp;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rev.pubhub.model.Book;
import com.rev.pubhub.model.Order;

public interface BookRepository extends JpaRepository<Book, Long> {

	List<Book> findByOrderByPriceDesc();

	List<Book> findByOrderByPriceAsc();

	List<Book> findByName(String name);

	List<Book> findByOrderByReleasedOnDesc();
}
