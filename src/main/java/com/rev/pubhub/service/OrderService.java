package com.rev.pubhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rev.pubhub.jsp.OrderRepository;
import com.rev.pubhub.model.Order;

@Service
public class OrderService {
	@Autowired
	OrderRepository orderRepository;
	

	public Order insertToTable(Order order) {
		return orderRepository.save(order);
		
		
	}
	public List<Order> findAllOrderList( Integer userId){
		System.out.println("Service Reached ======");
		//Order order = 
       return 	orderRepository.findByUserIdOrderByIdDesc(userId);
	}
	
}
