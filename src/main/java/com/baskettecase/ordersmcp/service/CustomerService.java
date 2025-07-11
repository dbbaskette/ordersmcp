package com.baskettecase.ordersmcp.service;

import com.baskettecase.ordersmcp.entity.Customer;
import com.baskettecase.ordersmcp.repository.CustomerRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

/**
 * Service class for customer-related operations.
 * Provides basic CRUD operations and customer lookup functionality.
 */
@Service
@Transactional(readOnly = true)
public class CustomerService {

    private static final Logger logger = LoggerFactory.getLogger(CustomerService.class);

    private final CustomerRepository customerRepository;

    @Autowired
    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    /**
     * Find a customer by ID.
     * 
     * @param customerId The customer ID
     * @return Optional containing the customer if found
     */
    public Optional<Customer> findById(Long customerId) {
        logger.debug("Finding customer by ID: {}", customerId);
        return customerRepository.findByCustomerId(customerId);
    }

    /**
     * Find a customer by email.
     * 
     * @param email The customer email
     * @return Optional containing the customer if found
     */
    public Optional<Customer> findByEmail(String email) {
        logger.debug("Finding customer by email: {}", email);
        return customerRepository.findByEmail(email);
    }

    /**
     * Get all customers.
     * 
     * @return List of all customers
     */
    public List<Customer> findAll() {
        logger.debug("Finding all customers");
        return customerRepository.findAll();
    }

    /**
     * Check if a customer exists by ID.
     * 
     * @param customerId The customer ID
     * @return true if customer exists, false otherwise
     */
    public boolean existsById(Long customerId) {
        return customerRepository.findByCustomerId(customerId).isPresent();
    }

    /**
     * Get the total number of customers.
     * 
     * @return Total count of customers
     */
    public long getCustomerCount() {
        return customerRepository.count();
    }
} 