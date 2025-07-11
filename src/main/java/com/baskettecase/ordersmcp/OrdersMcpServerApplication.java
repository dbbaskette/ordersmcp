package com.baskettecase.ordersmcp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Main Spring Boot application for the Orders MCP Server.
 * 
 * This application provides a Model Context Protocol (MCP) server that allows
 * AI models to query order information by customer ID. It uses Spring AI
 * for MCP server capabilities and Spring Data JPA for database operations.
 * 
 * Features:
 * - MCP protocol implementation via Spring AI
 * - Customer order queries
 * - Database integration with orders and order_details
 * - Cloud Foundry deployment support
 * - Standalone mode for local development
 */
@SpringBootApplication
public class OrdersMcpServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(OrdersMcpServerApplication.class, args);
    }
} 