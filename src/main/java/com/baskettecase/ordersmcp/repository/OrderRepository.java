package com.baskettecase.ordersmcp.repository;

import com.baskettecase.ordersmcp.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    
    // Find orders by customer ID - needed for GetCustomerOrders tool
    List<Order> findByCustomerCustomerId(Long customerId);
    
    // Find specific order by ID and customer ID - needed for GetOrderDetails tool
    Optional<Order> findByOrderIdAndCustomerCustomerId(Long orderId, Long customerId);
    
    // Find orders with order details loaded - needed for GetOrderDetails tool
    @Query("SELECT o FROM Order o LEFT JOIN FETCH o.orderDetails WHERE o.customer.customerId = :customerId")
    List<Order> findByCustomerIdWithDetails(@Param("customerId") Long customerId);
    
    // Find specific order with details - needed for GetOrderDetails tool
    @Query("SELECT o FROM Order o LEFT JOIN FETCH o.orderDetails WHERE o.orderId = :orderId AND o.customer.customerId = :customerId")
    Optional<Order> findByOrderIdAndCustomerIdWithDetails(@Param("orderId") Long orderId, @Param("customerId") Long customerId);
} 