package com.baskettecase.ordersmcp.service;

import com.baskettecase.ordersmcp.dto.CustomerOrderResponse;
import com.baskettecase.ordersmcp.dto.OrderDetailsResponse;
import com.baskettecase.ordersmcp.entity.Customer;
import com.baskettecase.ordersmcp.entity.Order;
import com.baskettecase.ordersmcp.repository.CustomerRepository;
import com.baskettecase.ordersmcp.repository.OrderRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Service class for handling MCP tool queries related to orders.
 * This service provides the business logic for the two main MCP tools:
 * 1. Get Customer Orders - returns list of orders for a customer
 * 2. Get Order Details - returns detailed information about a specific order
 */
@Service
@Transactional(readOnly = true)
public class OrderQueryService {

    private static final Logger logger = LoggerFactory.getLogger(OrderQueryService.class);

    private final CustomerRepository customerRepository;
    private final OrderRepository orderRepository;

    @Autowired
    public OrderQueryService(CustomerRepository customerRepository, OrderRepository orderRepository) {
        this.customerRepository = customerRepository;
        this.orderRepository = orderRepository;
    }

    /**
     * Get customer orders - MCP Tool 1
     * Returns a list of orders for a specific customer with summary information.
     * 
     * @param customerId The customer ID to get orders for
     * @return CustomerOrderResponse containing customer info, orders list, and summary
     * @throws IllegalArgumentException if customer ID is null or customer not found
     */
    public CustomerOrderResponse getCustomerOrders(Long customerId) {
        logger.debug("Getting orders for customer ID: {}", customerId);
        
        // Validate input
        if (customerId == null) {
            throw new IllegalArgumentException("Customer ID cannot be null");
        }
        
        // Validate customer exists
        Customer customer = customerRepository.findByCustomerId(customerId)
                .orElseThrow(() -> new IllegalArgumentException("Customer not found with ID: " + customerId));
        
        // Get orders for customer
        List<Order> orders = orderRepository.findByCustomerCustomerId(customerId);
        
        logger.debug("Found {} orders for customer ID: {}", orders.size(), customerId);
        
        // Return response DTO
        return new CustomerOrderResponse(customer, orders);
    }

    /**
     * Get order details - MCP Tool 2
     * Returns detailed information about a specific order including line items.
     * 
     * @param customerId The customer ID (for validation)
     * @param orderId The order ID to get details for
     * @return OrderDetailsResponse containing detailed order information
     * @throws IllegalArgumentException if parameters are null, customer not found, or order not found/not owned by customer
     */
    public OrderDetailsResponse getOrderDetails(Long customerId, Long orderId) {
        logger.debug("Getting order details for customer ID: {}, order ID: {}", customerId, orderId);
        
        // Validate input
        if (customerId == null) {
            throw new IllegalArgumentException("Customer ID cannot be null");
        }
        if (orderId == null) {
            throw new IllegalArgumentException("Order ID cannot be null");
        }
        
        // Validate customer exists
        Customer customer = customerRepository.findByCustomerId(customerId)
                .orElseThrow(() -> new IllegalArgumentException("Customer not found with ID: " + customerId));
        
        // Get order with details (validates order belongs to customer)
        Order order = orderRepository.findByOrderIdAndCustomerIdWithDetails(orderId, customerId)
                .orElseThrow(() -> new IllegalArgumentException(
                        "Order not found with ID: " + orderId + " for customer ID: " + customerId));
        
        logger.debug("Found order {} for customer ID: {} with {} line items", 
                order.getOrderNumber(), customerId, order.getOrderDetails().size());
        
        // Return response DTO
        return new OrderDetailsResponse(customer, order);
    }

    /**
     * Validate that a customer exists.
     * 
     * @param customerId The customer ID to validate
     * @throws IllegalArgumentException if customer ID is null or customer not found
     */
    private void validateCustomer(Long customerId) {
        if (customerId == null) {
            throw new IllegalArgumentException("Customer ID cannot be null");
        }
        
        if (!customerRepository.findByCustomerId(customerId).isPresent()) {
            throw new IllegalArgumentException("Customer not found with ID: " + customerId);
        }
    }

    /**
     * Validate that an order exists and belongs to the specified customer.
     * 
     * @param customerId The customer ID
     * @param orderId The order ID
     * @throws IllegalArgumentException if order not found or doesn't belong to customer
     */
    private void validateOrder(Long customerId, Long orderId) {
        if (orderId == null) {
            throw new IllegalArgumentException("Order ID cannot be null");
        }
        
        if (!orderRepository.findByOrderIdAndCustomerCustomerId(orderId, customerId).isPresent()) {
            throw new IllegalArgumentException(
                    "Order not found with ID: " + orderId + " for customer ID: " + customerId);
        }
    }

    /**
     * Get the count of orders for a customer.
     * 
     * @param customerId The customer ID
     * @return Number of orders for the customer
     */
    public long getOrderCountForCustomer(Long customerId) {
        validateCustomer(customerId);
        return orderRepository.findByCustomerCustomerId(customerId).size();
    }

    /**
     * Check if a customer has any orders.
     * 
     * @param customerId The customer ID
     * @return true if customer has orders, false otherwise
     */
    public boolean customerHasOrders(Long customerId) {
        validateCustomer(customerId);
        return !orderRepository.findByCustomerCustomerId(customerId).isEmpty();
    }
} 