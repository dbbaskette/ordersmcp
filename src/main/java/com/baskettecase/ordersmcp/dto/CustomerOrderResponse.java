package com.baskettecase.ordersmcp.dto;

import com.baskettecase.ordersmcp.entity.Customer;
import com.baskettecase.ordersmcp.entity.Order;
import com.baskettecase.ordersmcp.entity.OrderDetail;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

/**
 * DTO for customer order responses in MCP format.
 * Provides structured data for MCP server responses.
 */
public class CustomerOrderResponse {

    private CustomerInfo customer;
    private List<OrderInfo> orders;
    private OrderSummary summary;

    public CustomerOrderResponse() {}

    public CustomerOrderResponse(Customer customer) {
        this.customer = new CustomerInfo(customer);
        this.orders = customer.getOrders().stream()
                .map(OrderInfo::new)
                .collect(Collectors.toList());
        this.summary = new OrderSummary(customer.getOrders());
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
     * Order information DTO.
     */
    public static class OrderInfo {
        private Long orderId;
        private String orderNumber;
        private LocalDateTime orderDate;
        private String status;
        private String paymentStatus;
        private String paymentMethod;
        private BigDecimal subtotal;
        private BigDecimal taxAmount;
        private BigDecimal shippingAmount;
        private BigDecimal totalAmount;
        private List<OrderDetailInfo> orderDetails;

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
            this.orderDetails = order.getOrderDetails().stream()
                    .map(OrderDetailInfo::new)
                    .collect(Collectors.toList());
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

        public List<OrderDetailInfo> getOrderDetails() {
            return orderDetails;
        }

        public void setOrderDetails(List<OrderDetailInfo> orderDetails) {
            this.orderDetails = orderDetails;
        }
    }

    /**
     * Order detail information DTO.
     */
    public static class OrderDetailInfo {
        private Long detailId;
        private String productName;
        private String productSku;
        private String productDescription;
        private Integer quantity;
        private BigDecimal unitPrice;
        private BigDecimal discountAmount;
        private BigDecimal lineTotal;

        public OrderDetailInfo() {}

        public OrderDetailInfo(OrderDetail orderDetail) {
            this.detailId = orderDetail.getDetailId();
            this.productName = orderDetail.getProductName();
            this.productSku = orderDetail.getProductSku();
            this.productDescription = orderDetail.getProductDescription();
            this.quantity = orderDetail.getQuantity();
            this.unitPrice = orderDetail.getUnitPrice();
            this.discountAmount = orderDetail.getDiscountAmount();
            this.lineTotal = orderDetail.getLineTotal();
        }

        // Getters and Setters
        public Long getDetailId() {
            return detailId;
        }

        public void setDetailId(Long detailId) {
            this.detailId = detailId;
        }

        public String getProductName() {
            return productName;
        }

        public void setProductName(String productName) {
            this.productName = productName;
        }

        public String getProductSku() {
            return productSku;
        }

        public void setProductSku(String productSku) {
            this.productSku = productSku;
        }

        public String getProductDescription() {
            return productDescription;
        }

        public void setProductDescription(String productDescription) {
            this.productDescription = productDescription;
        }

        public Integer getQuantity() {
            return quantity;
        }

        public void setQuantity(Integer quantity) {
            this.quantity = quantity;
        }

        public BigDecimal getUnitPrice() {
            return unitPrice;
        }

        public void setUnitPrice(BigDecimal unitPrice) {
            this.unitPrice = unitPrice;
        }

        public BigDecimal getDiscountAmount() {
            return discountAmount;
        }

        public void setDiscountAmount(BigDecimal discountAmount) {
            this.discountAmount = discountAmount;
        }

        public BigDecimal getLineTotal() {
            return lineTotal;
        }

        public void setLineTotal(BigDecimal lineTotal) {
            this.lineTotal = lineTotal;
        }
    }

    /**
     * Order summary DTO.
     */
    public static class OrderSummary {
        private int totalOrders;
        private BigDecimal totalSpent;
        private BigDecimal averageOrderValue;
        private String mostRecentOrderDate;
        private String orderStatusBreakdown;

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
            this.orderStatusBreakdown = orders.stream()
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

        public String getOrderStatusBreakdown() {
            return orderStatusBreakdown;
        }

        public void setOrderStatusBreakdown(String orderStatusBreakdown) {
            this.orderStatusBreakdown = orderStatusBreakdown;
        }
    }
} 