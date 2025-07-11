package com.baskettecase.ordersmcp.service;

import com.baskettecase.ordersmcp.dto.CustomerOrderResponse;
import com.baskettecase.ordersmcp.dto.OrderDetailsResponse;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@ActiveProfiles("test")
class OrderQueryServiceTest {

    @Autowired
    private OrderQueryService orderQueryService;

    @Test
    void testGetCustomerOrders() {
        // Test with customer ID 1 (should exist from sample data)
        CustomerOrderResponse response = orderQueryService.getCustomerOrders(1L);
        
        assertNotNull(response);
        assertNotNull(response.getCustomer());
        assertEquals(1L, response.getCustomer().getCustomerId());
        assertNotNull(response.getOrders());
        assertNotNull(response.getSummary());
        
        // Customer should have at least one order
        assertTrue(response.getOrders().size() > 0);
        assertTrue(response.getSummary().getTotalOrders() > 0);
    }

    @Test
    void testGetOrderDetails() {
        // First get customer orders to find a valid order ID
        CustomerOrderResponse customerResponse = orderQueryService.getCustomerOrders(1L);
        assertNotNull(customerResponse);
        assertTrue(customerResponse.getOrders().size() > 0);
        
        Long orderId = customerResponse.getOrders().get(0).getOrderId();
        
        // Test getting order details
        OrderDetailsResponse response = orderQueryService.getOrderDetails(1L, orderId);
        
        assertNotNull(response);
        assertNotNull(response.getCustomer());
        assertEquals(1L, response.getCustomer().getCustomerId());
        assertNotNull(response.getOrder());
        assertEquals(orderId, response.getOrder().getOrderId());
        assertNotNull(response.getItems());
        
        // Order should have at least one item
        assertTrue(response.getItems().size() > 0);
    }

    @Test
    void testGetCustomerOrdersWithInvalidId() {
        // Test with non-existent customer ID
        assertThrows(IllegalArgumentException.class, () -> {
            orderQueryService.getCustomerOrders(999L);
        });
    }

    @Test
    void testGetOrderDetailsWithInvalidCustomerId() {
        // Test with non-existent customer ID
        assertThrows(IllegalArgumentException.class, () -> {
            orderQueryService.getOrderDetails(999L, 1L);
        });
    }

    @Test
    void testGetOrderDetailsWithInvalidOrderId() {
        // Test with valid customer but non-existent order
        assertThrows(IllegalArgumentException.class, () -> {
            orderQueryService.getOrderDetails(1L, 999L);
        });
    }

    @Test
    void testGetCustomerOrdersWithNullId() {
        // Test with null customer ID
        assertThrows(IllegalArgumentException.class, () -> {
            orderQueryService.getCustomerOrders(null);
        });
    }

    @Test
    void testGetOrderDetailsWithNullIds() {
        // Test with null parameters
        assertThrows(IllegalArgumentException.class, () -> {
            orderQueryService.getOrderDetails(null, 1L);
        });
        
        assertThrows(IllegalArgumentException.class, () -> {
            orderQueryService.getOrderDetails(1L, null);
        });
    }
} 