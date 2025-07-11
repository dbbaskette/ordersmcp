package com.baskettecase.ordersmcp.mcp;

import com.baskettecase.ordersmcp.entity.Customer;
import com.baskettecase.ordersmcp.entity.Order;
import com.baskettecase.ordersmcp.service.OrderQueryService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.lenient;
import static org.mockito.Mockito.when;

/**
 * Unit tests for CustomerOrderTool.
 */
@ExtendWith(MockitoExtension.class)
class CustomerOrderToolTest {

    @Mock
    private OrderQueryService orderQueryService;

    @InjectMocks
    private CustomerOrderTool customerOrderTool;

    private Customer testCustomer;
    private Order testOrder;

    @BeforeEach
    void setUp() {
        // Create test customer
        testCustomer = new Customer("test@example.com", "Test", "User");
        testCustomer.setCustomerId(1L);

        // Create test order
        testOrder = new Order("ORD-2024-001234", testCustomer);
        testOrder.setOrderId(1L);
        testOrder.setOrderDate(LocalDateTime.now());
        testOrder.setSubtotal(BigDecimal.valueOf(299.99));
        testOrder.setTaxAmount(BigDecimal.valueOf(24.00));
        testOrder.setShippingAmount(BigDecimal.valueOf(9.99));
        testOrder.setTotalAmount(BigDecimal.valueOf(333.98));

        // Add order to customer
        testCustomer.setOrders(Arrays.asList(testOrder));
    }

    @Test
    void queryCustomerOrders_WhenValidCustomerId_ReturnsSuccessResponse() {
        // Given
        when(orderQueryService.findCustomerWithOrders(1L)).thenReturn(Optional.of(testCustomer));

        // When
        String result = customerOrderTool.queryCustomerOrders(1L);

        // Then
        assertNotNull(result);
        assertTrue(result.contains("\"success\": true"));
        assertTrue(result.contains("\"customerId\": 1"));
        assertTrue(result.contains("\"fullName\": \"Test User\""));
    }

    @Test
    void queryCustomerOrders_WhenInvalidCustomerId_ReturnsErrorResponse() {
        // Given
        lenient().when(orderQueryService.findCustomerWithOrders(-1L)).thenReturn(Optional.empty());

        // When
        String result = customerOrderTool.queryCustomerOrders(-1L);

        // Then
        assertNotNull(result);
        assertTrue(result.contains("\"success\": false"));
        assertTrue(result.contains("\"error\":"));
        assertTrue(result.contains("\"customerId\": -1"));
    }

    @Test
    void queryCustomerOrders_WhenCustomerNotFound_ReturnsErrorResponse() {
        // Given
        when(orderQueryService.findCustomerWithOrders(999L)).thenReturn(Optional.empty());

        // When
        String result = customerOrderTool.queryCustomerOrders(999L);

        // Then
        assertNotNull(result);
        assertTrue(result.contains("\"success\": false"));
        assertTrue(result.contains("\"error\": \"Customer not found\""));
        assertTrue(result.contains("\"customerId\": 999"));
    }
} 