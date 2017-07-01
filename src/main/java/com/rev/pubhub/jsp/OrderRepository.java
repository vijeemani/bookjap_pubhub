package com.rev.pubhub.jsp;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rev.pubhub.model.Order;


public interface OrderRepository extends JpaRepository<Order, Long> {

	public List<Order> findByUserIdOrderByIdDesc(Integer userId);}
