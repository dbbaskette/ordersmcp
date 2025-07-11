package com.baskettecase.ordersmcp.service;

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
import java.util.Optional;

/**
 * Service for querying customer orders and related data.
 * Provides business logic for order queries used by the MCP server.
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
     * Find customer by ID with all their orders and order details.
     *
     * @param customerId the customer ID to search for
     * @return Optional containing the customer with orders if found
     */
    public Optional<Customer> findCustomerWithOrders(Long customerId) {
        logger.debug("Finding customer with orders for customerId: {}", customerId);
        
        try {
            Optional<Customer> customer = customerRepository.findByIdWithOrdersAndDetails(customerId);
            
            if (customer.isPresent()) {
                logger.info("Found customer {} with {} orders", 
                    customer.get().getFullName(), 
                    customer.get().getOrders().size());
            } else {
                logger.warn("Customer not found for customerId: {}", customerId);
            }
            
            return customer;
        } catch (Exception e) {
            logger.error("Error finding customer with orders for customerId: {}", customerId, e);
            throw new RuntimeException("Failed to retrieve customer orders", e);
        }
    }

    /**
     * Find customer by email with all their orders and order details.
     *
     * @param email the customer email to search for
     * @return Optional containing the customer with orders if found
     */
    public Optional<Customer> findCustomerWithOrdersByEmail(String email) {
        logger.debug("Finding customer with orders for email: {}", email);
        
        try {
            Optional<Customer> customerOpt = customerRepository.findByEmail(email);
            
            if (customerOpt.isPresent()) {
                Customer customer = customerOpt.get();
                List<Order> orders = orderRepository.findByCustomerIdWithDetails(customer.getCustomerId());
                customer.setOrders(orders);
                
                logger.info("Found customer {} with {} orders", 
                    customer.getFullName(), 
                    orders.size());
                
                return Optional.of(customer);
            } else {
                logger.warn("Customer not found for email: {}", email);
                return Optional.empty();
            }
        } catch (Exception e) {
            logger.error("Error finding customer with orders for email: {}", email, e);
            throw new RuntimeException("Failed to retrieve customer orders", e);
        }
    }

    /**
     * Get all orders for a customer by customer ID.
     *
     * @param customerId the customer ID to search for
     * @return List of orders for the customer
     */
    public List<Order> getCustomerOrders(Long customerId) {
        logger.debug("Getting orders for customerId: {}", customerId);
        
        try {
            List<Order> orders = orderRepository.findByCustomerIdWithDetails(customerId);
            logger.info("Found {} orders for customerId: {}", orders.size(), customerId);
            return orders;
        } catch (Exception e) {
            logger.error("Error getting orders for customerId: {}", customerId, e);
            throw new RuntimeException("Failed to retrieve customer orders", e);
        }
    }

    /**
     * Check if a customer exists by ID.
     *
     * @param customerId the customer ID to check
     * @return true if customer exists, false otherwise
     */
    public boolean customerExists(Long customerId) {
        return customerRepository.existsById(customerId);
    }

    /**
     * Get customer count.
     *
     * @return total number of customers
     */
    public long getCustomerCount() {
        return customerRepository.count();
    }

    /**
     * Get order count for a customer.
     *
     * @param customerId the customer ID to count orders for
     * @return number of orders for the customer
     */
    public long getCustomerOrderCount(Long customerId) {
        return orderRepository.countByCustomerCustomerId(customerId);
    }
} 