package com.baskettecase.ordersmcp.dto;

import com.baskettecase.ordersmcp.entity.Customer;
import com.baskettecase.ordersmcp.entity.Order;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Response DTO for the GetCustomerOrders MCP tool.
 * Contains customer information, list of orders, and summary statistics.
 */
public class CustomerOrderResponse {
    
    private CustomerInfo customer;
    private List<OrderInfo> orders;
    private OrderSummary summary;
    
    // Constructors
    public CustomerOrderResponse() {}
    
    public CustomerOrderResponse(Customer customer, List<Order> orders) {
        this.customer = new CustomerInfo(customer);
        this.orders = orders.stream()
                .map(OrderInfo::new)
                .collect(Collectors.toList());
        this.summary = new OrderSummary(orders);
    }
    
    // Getters and Setters
    public CustomerInfo getCustomer() {
        return customer;
    }
    
    public void setCustomer(CustomerInfo customer) {
        this.customer = customer;
    }
    
    public List<OrderInfo> getOrders() {
        return orders;
    }
    
    public void setOrders(List<OrderInfo> orders) {
        this.orders = orders;
    }
    
    public OrderSummary getSummary() {
        return summary;
    }
    
    public void setSummary(OrderSummary summary) {
        this.summary = summary;
    }
    
    /**
     * Customer information DTO.
     */
    public static class CustomerInfo {
        private Long customerId;
        private String email;
        private String firstName;
        private String lastName;
        private String fullName;
        private String phone;
        
        @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
        private LocalDateTime createdAt;
        
        public CustomerInfo() {}
        
        public CustomerInfo(Customer customer) {
            this.customerId = customer.getCustomerId();
            this.email = customer.getEmail();
            this.firstName = customer.getFirstName();
            this.lastName = customer.getLastName();
            this.fullName = customer.getFullName();
            this.phone = customer.getPhone();
            this.createdAt = customer.getCreatedAt();
        }
        
        // Getters and Setters
        public Long getCustomerId() {
            return customerId;
        }
        
        public void setCustomerId(Long customerId) {
            this.customerId = customerId;
        }
        
        public String getEmail() {
            return email;
        }
        
        public void setEmail(String email) {
            this.email = email;
        }
        
        public String getFirstName() {
            return firstName;
        }
        
        public void setFirstName(String firstName) {
            this.firstName = firstName;
        }
        
        public String getLastName() {
            return lastName;
        }
        
        public void setLastName(String lastName) {
            this.lastName = lastName;
        }
        
        public String getFullName() {
            return fullName;
        }
        
        public void setFullName(String fullName) {
            this.fullName = fullName;
        }
        
        public String getPhone() {
            return phone;
        }
        
        public void setPhone(String phone) {
            this.phone = phone;
        }
        
        public LocalDateTime getCreatedAt() {
            return createdAt;
        }
        
        public void setCreatedAt(LocalDateTime createdAt) {
            this.createdAt = createdAt;
        }
    }
    
    /**
     * Order information DTO for the list view.
     */
    public static class OrderInfo {
        private Long orderId;
        private String orderNumber;
        
        @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
        private LocalDateTime orderDate;
        
        private String status;
        private String paymentStatus;
        private String paymentMethod;
        private BigDecimal subtotal;
        private BigDecimal taxAmount;
        private BigDecimal shippingAmount;
        private BigDecimal totalAmount;
        private int itemCount;
        private int totalQuantity;
        
        public OrderInfo() {}
        
        public OrderInfo(Order order) {
            this.orderId = order.getOrderId();
            this.orderNumber = order.getOrderNumber();
            this.orderDate = order.getOrderDate();
            this.status = order.getStatus().name();
            this.paymentStatus = order.getPaymentStatus().name();
            this.paymentMethod = order.getPaymentMethod();
            this.subtotal = order.getSubtotal();
            this.taxAmount = order.getTaxAmount();
            this.shippingAmount = order.getShippingAmount();
            this.totalAmount = order.getTotalAmount();
            this.itemCount = order.getItemCount();
            this.totalQuantity = order.getTotalQuantity();
        }
        
        // Getters and Setters
        public Long getOrderId() {
            return orderId;
        }
        
        public void setOrderId(Long orderId) {
            this.orderId = orderId;
        }
        
        public String getOrderNumber() {
            return orderNumber;
        }
        
        public void setOrderNumber(String orderNumber) {
            this.orderNumber = orderNumber;
        }
        
        public LocalDateTime getOrderDate() {
            return orderDate;
        }
        
        public void setOrderDate(LocalDateTime orderDate) {
            this.orderDate = orderDate;
        }
        
        public String getStatus() {
            return status;
        }
        
        public void setStatus(String status) {
            this.status = status;
        }
        
        public String getPaymentStatus() {
            return paymentStatus;
        }
        
        public void setPaymentStatus(String paymentStatus) {
            this.paymentStatus = paymentStatus;
        }
        
        public String getPaymentMethod() {
            return paymentMethod;
        }
        
        public void setPaymentMethod(String paymentMethod) {
            this.paymentMethod = paymentMethod;
        }
        
        public BigDecimal getSubtotal() {
            return subtotal;
        }
        
        public void setSubtotal(BigDecimal subtotal) {
            this.subtotal = subtotal;
        }
        
        public BigDecimal getTaxAmount() {
            return taxAmount;
        }
        
        public void setTaxAmount(BigDecimal taxAmount) {
            this.taxAmount = taxAmount;
        }
        
        public BigDecimal getShippingAmount() {
            return shippingAmount;
        }
        
        public void setShippingAmount(BigDecimal shippingAmount) {
            this.shippingAmount = shippingAmount;
        }
        
        public BigDecimal getTotalAmount() {
            return totalAmount;
        }
        
        public void setTotalAmount(BigDecimal totalAmount) {
            this.totalAmount = totalAmount;
        }
        
        public int getItemCount() {
            return itemCount;
        }
        
        public void setItemCount(int itemCount) {
            this.itemCount = itemCount;
        }
        
        public int getTotalQuantity() {
            return totalQuantity;
        }
        
        public void setTotalQuantity(int totalQuantity) {
            this.totalQuantity = totalQuantity;
        }
    }
    
    /**
     * Order summary DTO with statistics.
     */
    public static class OrderSummary {
        private int totalOrders;
        private BigDecimal totalSpent;
        private BigDecimal averageOrderValue;
        private String mostRecentOrderDate;
        private String statusBreakdown;
        
        public OrderSummary() {}
        
        public OrderSummary(List<Order> orders) {
            this.totalOrders = orders.size();
            this.totalSpent = orders.stream()
                    .map(Order::getTotalAmount)
                    .reduce(BigDecimal.ZERO, BigDecimal::add);
            this.averageOrderValue = totalOrders > 0 ? 
                    totalSpent.divide(BigDecimal.valueOf(totalOrders), 2, BigDecimal.ROUND_HALF_UP) : 
                    BigDecimal.ZERO;
            this.mostRecentOrderDate = orders.stream()
                    .map(Order::getOrderDate)
                    .max(LocalDateTime::compareTo)
                    .map(LocalDateTime::toString)
                    .orElse("No orders");
            this.statusBreakdown = orders.stream()
                    .collect(Collectors.groupingBy(
                            order -> order.getStatus().name(),
                            Collectors.counting()))
                    .toString();
        }
        
        // Getters and Setters
        public int getTotalOrders() {
            return totalOrders;
        }
        
        public void setTotalOrders(int totalOrders) {
            this.totalOrders = totalOrders;
        }
        
        public BigDecimal getTotalSpent() {
            return totalSpent;
        }
        
        public void setTotalSpent(BigDecimal totalSpent) {
            this.totalSpent = totalSpent;
        }
        
        public BigDecimal getAverageOrderValue() {
            return averageOrderValue;
        }
        
        public void setAverageOrderValue(BigDecimal averageOrderValue) {
            this.averageOrderValue = averageOrderValue;
        }
        
        public String getMostRecentOrderDate() {
            return mostRecentOrderDate;
        }
        
        public void setMostRecentOrderDate(String mostRecentOrderDate) {
            this.mostRecentOrderDate = mostRecentOrderDate;
        }
        
        public String getStatusBreakdown() {
            return statusBreakdown;
        }
        
        public void setStatusBreakdown(String statusBreakdown) {
            this.statusBreakdown = statusBreakdown;
        }
    }
} 