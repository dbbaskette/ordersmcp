package com.baskettecase.ordersmcp.mcp;

import com.baskettecase.ordersmcp.dto.CustomerOrderResponse;
import com.baskettecase.ordersmcp.dto.OrderDetailsResponse;
import com.baskettecase.ordersmcp.service.OrderQueryService;
import org.springframework.ai.tool.annotation.Tool;
import org.springframework.stereotype.Service;

/**
 * MCP Tools service for customer order queries.
 * Following Spring AI MCP Server documentation pattern using @Tool annotations.
 */
@Service
public class CustomerOrderTool {

    private final OrderQueryService orderQueryService;

    public CustomerOrderTool(OrderQueryService orderQueryService) {
        this.orderQueryService = orderQueryService;
    }

    /**
     * MCP Tool 1: Get Customer Orders
     * Returns a list of orders for a specific customer with summary information.
     */
    @Tool(description = "Get all orders for a specific customer. Returns customer information, list of orders, and summary statistics.")
    public CustomerOrderResponse getCustomerOrders(Long customerId) {
        return orderQueryService.getCustomerOrders(customerId);
    }

    /**
     * MCP Tool 2: Get Order Details
     * Returns detailed information about a specific order including line items.
     */
    @Tool(description = "Get detailed information about a specific order including line items, addresses, and pricing breakdown.")
    public OrderDetailsResponse getOrderDetails(Long customerId, Long orderId) {
        return orderQueryService.getOrderDetails(customerId, orderId);
    }
} 