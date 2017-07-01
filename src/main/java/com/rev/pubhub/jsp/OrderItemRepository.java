package com.rev.pubhub.jsp;

import org.springframework.data.jpa.repository.JpaRepository;


import com.rev.pubhub.model.OrderItem;

public interface OrderItemRepository extends JpaRepository<OrderItem, Integer> {
	
}
