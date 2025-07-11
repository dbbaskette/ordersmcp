package com.baskettecase.ordersmcp.dto;

import com.baskettecase.ordersmcp.entity.Customer;
import com.baskettecase.ordersmcp.entity.Order;
import com.baskettecase.ordersmcp.entity.OrderDetail;
import com.baskettecase.ordersmcp.entity.Address;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Response DTO for the GetOrderDetails MCP tool.
 * Contains detailed order information including customer, order details, and line items.
 */
public class OrderDetailsResponse {
    
    private CustomerInfo customer;
    private OrderInfo order;
    private List<OrderDetailInfo> items;
    private AddressInfo shippingAddress;
    private AddressInfo billingAddress;
    
    // Constructors
    public OrderDetailsResponse() {}
    
    public OrderDetailsResponse(Customer customer, Order order) {
        this.customer = new CustomerInfo(customer);
        this.order = new OrderInfo(order);
        this.items = order.getOrderDetails().stream()
                .map(OrderDetailInfo::new)
                .collect(Collectors.toList());
        this.shippingAddress = order.getShippingAddress() != null ? 
                new AddressInfo(order.getShippingAddress()) : null;
        this.billingAddress = order.getBillingAddress() != null ? 
                new AddressInfo(order.getBillingAddress()) : null;
    }
    
    // Getters and Setters
    public CustomerInfo getCustomer() {
        return customer;
    }
    
    public void setCustomer(CustomerInfo customer) {
        this.customer = customer;
    }
    
    public OrderInfo getOrder() {
        return order;
    }
    
    public void setOrder(OrderInfo order) {
        this.order = order;
    }
    
    public List<OrderDetailInfo> getItems() {
        return items;
    }
    
    public void setItems(List<OrderDetailInfo> items) {
        this.items = items;
    }
    
    public AddressInfo getShippingAddress() {
        return shippingAddress;
    }
    
    public void setShippingAddress(AddressInfo shippingAddress) {
        this.shippingAddress = shippingAddress;
    }
    
    public AddressInfo getBillingAddress() {
        return billingAddress;
    }
    
    public void setBillingAddress(AddressInfo billingAddress) {
        this.billingAddress = billingAddress;
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
        
        public CustomerInfo() {}
        
        public CustomerInfo(Customer customer) {
            this.customerId = customer.getCustomerId();
            this.email = customer.getEmail();
            this.firstName = customer.getFirstName();
            this.lastName = customer.getLastName();
            this.fullName = customer.getFullName();
            this.phone = customer.getPhone();
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
    }
    
    /**
     * Detailed order information DTO.
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
        private String notes;
        
        @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
        private LocalDateTime createdAt;
        
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
            this.notes = order.getNotes();
            this.createdAt = order.getCreatedAt();
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
        
        public String getNotes() {
            return notes;
        }
        
        public void setNotes(String notes) {
            this.notes = notes;
        }
        
        public LocalDateTime getCreatedAt() {
            return createdAt;
        }
        
        public void setCreatedAt(LocalDateTime createdAt) {
            this.createdAt = createdAt;
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
        private BigDecimal subtotalBeforeDiscount;
        private boolean hasDiscount;
        
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
            this.subtotalBeforeDiscount = orderDetail.getSubtotalBeforeDiscount();
            this.hasDiscount = orderDetail.hasDiscount();
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
        
        public BigDecimal getSubtotalBeforeDiscount() {
            return subtotalBeforeDiscount;
        }
        
        public void setSubtotalBeforeDiscount(BigDecimal subtotalBeforeDiscount) {
            this.subtotalBeforeDiscount = subtotalBeforeDiscount;
        }
        
        public boolean isHasDiscount() {
            return hasDiscount;
        }
        
        public void setHasDiscount(boolean hasDiscount) {
            this.hasDiscount = hasDiscount;
        }
    }
    
    /**
     * Address information DTO.
     */
    public static class AddressInfo {
        private Long addressId;
        private String addressType;
        private String firstName;
        private String lastName;
        private String fullName;
        private String company;
        private String addressLine1;
        private String addressLine2;
        private String city;
        private String state;
        private String postalCode;
        private String country;
        private String phone;
        private String fullAddress;
        
        public AddressInfo() {}
        
        public AddressInfo(Address address) {
            this.addressId = address.getAddressId();
            this.addressType = address.getAddressType().name();
            this.firstName = address.getFirstName();
            this.lastName = address.getLastName();
            this.fullName = address.getFullName();
            this.company = address.getCompany();
            this.addressLine1 = address.getAddressLine1();
            this.addressLine2 = address.getAddressLine2();
            this.city = address.getCity();
            this.state = address.getState();
            this.postalCode = address.getPostalCode();
            this.country = address.getCountry();
            this.phone = address.getPhone();
            this.fullAddress = address.getFullAddress();
        }
        
        // Getters and Setters
        public Long getAddressId() {
            return addressId;
        }
        
        public void setAddressId(Long addressId) {
            this.addressId = addressId;
        }
        
        public String getAddressType() {
            return addressType;
        }
        
        public void setAddressType(String addressType) {
            this.addressType = addressType;
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
        
        public String getCompany() {
            return company;
        }
        
        public void setCompany(String company) {
            this.company = company;
        }
        
        public String getAddressLine1() {
            return addressLine1;
        }
        
        public void setAddressLine1(String addressLine1) {
            this.addressLine1 = addressLine1;
        }
        
        public String getAddressLine2() {
            return addressLine2;
        }
        
        public void setAddressLine2(String addressLine2) {
            this.addressLine2 = addressLine2;
        }
        
        public String getCity() {
            return city;
        }
        
        public void setCity(String city) {
            this.city = city;
        }
        
        public String getState() {
            return state;
        }
        
        public void setState(String state) {
            this.state = state;
        }
        
        public String getPostalCode() {
            return postalCode;
        }
        
        public void setPostalCode(String postalCode) {
            this.postalCode = postalCode;
        }
        
        public String getCountry() {
            return country;
        }
        
        public void setCountry(String country) {
            this.country = country;
        }
        
        public String getPhone() {
            return phone;
        }
        
        public void setPhone(String phone) {
            this.phone = phone;
        }
        
        public String getFullAddress() {
            return fullAddress;
        }
        
        public void setFullAddress(String fullAddress) {
            this.fullAddress = fullAddress;
        }
    }
} 