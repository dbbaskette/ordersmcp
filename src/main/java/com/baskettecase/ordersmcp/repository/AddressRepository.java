package com.baskettecase.ordersmcp.repository;

import com.baskettecase.ordersmcp.entity.Address;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AddressRepository extends JpaRepository<Address, Long> {
    
    // Find addresses by customer ID - may be useful for order address information
    List<Address> findByCustomerCustomerId(Long customerId);
} 