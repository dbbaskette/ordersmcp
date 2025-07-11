package com.baskettecase.ordersmcp.repository;

import com.baskettecase.ordersmcp.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
    
    // Basic method to find customer by ID - needed for MCP tool validation
    Optional<Customer> findByCustomerId(Long customerId);
    
    // Optional: find by email for potential future use
    Optional<Customer> findByEmail(String email);
} 