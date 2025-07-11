package com.baskettecase.ordersmcp.mcp;

import com.baskettecase.ordersmcp.dto.CustomerOrderResponse;
import com.baskettecase.ordersmcp.entity.Customer;
import com.baskettecase.ordersmcp.service.OrderQueryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;

/**
 * MCP Tool for querying customer orders.
 */
@Component
public class CustomerOrderTool {
    private static final Logger logger = LoggerFactory.getLogger(CustomerOrderTool.class);
    @Autowired
    private OrderQueryService orderQueryService;

    /**
     * Query customer orders by customer ID.
     * 
     * @param customerId The customer ID to query
     * @return JSON string with customer order information
     */
    public String queryCustomerOrders(Long customerId) {
        logger.info("Querying customer orders for customer ID: {}", customerId);
        
        if (customerId == null) {
            return "{\"success\": false, \"error\": \"Customer ID is required\", \"customerId\": null}";
        }

        try {
            Optional<Customer> customerOpt = orderQueryService.findCustomerWithOrders(customerId);
            
            if (customerOpt.isPresent()) {
                Customer customer = customerOpt.get();
                CustomerOrderResponse response = new CustomerOrderResponse(customer);
                return "{\"success\": true, \"customerId\": " + customerId + 
                       ", \"fullName\": \"" + customer.getFullName() + "\"" +
                       ", \"email\": \"" + customer.getEmail() + "\"" +
                       ", \"orderCount\": " + customer.getOrders().size() +
                       ", \"data\": " + response.toString() + "}";
            } else {
                return "{\"success\": false, \"error\": \"Customer not found\", \"customerId\": " + customerId + "}";
            }
        } catch (Exception e) {
            logger.error("Error querying customer orders for customer ID: {}", customerId, e);
            return "{\"success\": false, \"error\": \"Internal server error\", \"customerId\": " + customerId + "}";
        }
    }
} 