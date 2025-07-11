package com.baskettecase.ordersmcp.repository;

import com.baskettecase.ordersmcp.entity.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
    
    // Find order details by order ID - may be useful for detailed queries
    List<OrderDetail> findByOrderOrderId(Long orderId);
} 