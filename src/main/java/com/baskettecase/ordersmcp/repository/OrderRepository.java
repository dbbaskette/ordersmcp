package com.baskettecase.ordersmcp.repository;

import com.baskettecase.ordersmcp.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

/**
 * Repository interface for Order entity operations.
 * Provides data access methods for order-related queries.
 */
@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    /**
     * Find orders by customer ID.
     *
     * @param customerId the customer ID to search for
     * @return List of orders for the customer
     */
    List<Order> findByCustomerCustomerId(Long customerId);

    /**
     * Find orders by order number.
     *
     * @param orderNumber the order number to search for
     * @return Optional containing the order if found
     */
    Optional<Order> findByOrderNumber(String orderNumber);

    /**
     * Find orders by status.
     *
     * @param status the order status to search for
     * @return List of orders with the specified status
     */
    List<Order> findByStatus(Order.OrderStatus status);

    /**
     * Find orders by payment status.
     *
     * @param paymentStatus the payment status to search for
     * @return List of orders with the specified payment status
     */
    List<Order> findByPaymentStatus(Order.PaymentStatus paymentStatus);

    /**
     * Find orders by customer ID and status.
     *
     * @param customerId the customer ID to search for
     * @param status the order status to search for
     * @return List of orders matching both criteria
     */
    List<Order> findByCustomerCustomerIdAndStatus(Long customerId, Order.OrderStatus status);

    /**
     * Find orders created between two dates.
     *
     * @param startDate the start date (inclusive)
     * @param endDate the end date (inclusive)
     * @return List of orders created in the date range
     */
    List<Order> findByOrderDateBetween(LocalDateTime startDate, LocalDateTime endDate);

    /**
     * Find orders with total amount greater than the specified amount.
     *
     * @param amount the minimum total amount
     * @return List of orders with total amount greater than the specified amount
     */
    @Query("SELECT o FROM Order o WHERE o.totalAmount > :amount")
    List<Order> findByTotalAmountGreaterThan(@Param("amount") Double amount);

    /**
     * Find order by ID with customer, addresses, and order details.
     * Uses a custom query to eagerly fetch related entities.
     *
     * @param orderId the order ID to search for
     * @return Optional containing the order with all related data if found
     */
    @Query("SELECT o FROM Order o " +
           "LEFT JOIN FETCH o.customer c " +
           "LEFT JOIN FETCH o.shippingAddress sa " +
           "LEFT JOIN FETCH o.billingAddress ba " +
           "LEFT JOIN FETCH o.orderDetails od " +
           "WHERE o.orderId = :orderId")
    Optional<Order> findByIdWithAllDetails(@Param("orderId") Long orderId);

    /**
     * Find orders by customer ID with all related data.
     * Uses a custom query to eagerly fetch orders and their details for a customer.
     *
     * @param customerId the customer ID to search for
     * @return List of orders with all related data for the customer
     */
    @Query("SELECT o FROM Order o " +
           "LEFT JOIN FETCH o.orderDetails od " +
           "WHERE o.customer.customerId = :customerId " +
           "ORDER BY o.orderDate DESC")
    List<Order> findByCustomerIdWithDetails(@Param("customerId") Long customerId);

    /**
     * Count orders by customer ID.
     *
     * @param customerId the customer ID to count orders for
     * @return the number of orders for the customer
     */
    long countByCustomerCustomerId(Long customerId);

    /**
     * Check if an order exists by order number.
     *
     * @param orderNumber the order number to check
     * @return true if order exists, false otherwise
     */
    boolean existsByOrderNumber(String orderNumber);
} 