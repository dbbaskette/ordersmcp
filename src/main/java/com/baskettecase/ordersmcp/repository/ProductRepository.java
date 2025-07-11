package com.baskettecase.ordersmcp.repository;

import com.baskettecase.ordersmcp.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    
    // Find product by SKU - may be useful for product information in order details
    Optional<Product> findBySku(String sku);
} 