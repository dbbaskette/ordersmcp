# Orders MCP Server Implementation Plan

## Project Overview
Build a Spring AI based MCP Server that provides order query tools for AI assistants. The server will expose 2 main tools:
1. **Get Customer Orders** - Takes customer ID and returns list of order IDs
2. **Get Order Details** - Takes customer ID and order ID, returns complete order details with line items

## Technical Requirements
- **Spring Boot**: 3.4.5
- **Java**: 21
- **Spring AI**: 1.0.0
- **Spring Cloud**: 2024.0.1
- **Maven**: Build tool
- **Database**: H2 (local), PostgreSQL (Cloud Foundry)
- **Transport**: WebMVC Server with SSE (Server-Sent Events)
- **Deployment**: Cloud Foundry with standalone mode for testing

## Implementation Progress

### Phase 1: Project Setup & Database Design ✅ COMPLETED

#### 1.1 Maven Project Structure ✅ COMPLETED
- [x] Create pom.xml with correct dependencies
- [x] Create directory structure
- [x] Create main application class
- [x] Create application configuration files

#### 1.2 Database Schema Design ✅ COMPLETED
- [x] Create V1__Create_customers_table.sql
- [x] Create V2__Create_addresses_table.sql
- [x] Create V3__Create_products_table.sql
- [x] Create V4__Create_orders_table.sql
- [x] Create V5__Create_order_details_table.sql
- [x] Create V6__Insert_sample_data.sql

#### 1.3 JPA Entities ✅ COMPLETED
- [x] Create Customer entity
- [x] Create Address entity
- [x] Create Product entity
- [x] Create Order entity
- [x] Create OrderDetail entity

### Phase 2: Core Application Structure ✅ COMPLETED

#### 2.1 Repository Layer ✅ COMPLETED
- [x] Create CustomerRepository
- [x] Create AddressRepository
- [x] Create ProductRepository
- [x] Create OrderRepository
- [x] Create OrderDetailRepository
- [x] Add essential query methods for MCP tools

#### 2.2 Service Layer ✅ COMPLETED
- [x] Create CustomerService
- [x] Create OrderService
- [x] Create OrderQueryService (for MCP tools)
- [x] Add business logic methods

#### 2.3 DTO Classes ✅ COMPLETED
- [x] Create CustomerOrderResponse DTO
- [x] Create OrderDetailsResponse DTO
- [x] Create supporting DTOs

### Phase 3: MCP Server Configuration ✅ COMPLETED

#### 3.1 MCP Configuration ✅ COMPLETED
- [x] Spring AI MCP Server auto-configuration enabled
- [x] WebMVC transport with SSE configured via starter
- [x] MCP capabilities enabled (tools: true)
- [x] MCP endpoints auto-configured

#### 3.2 MCP Tools Implementation ✅ COMPLETED  
- [x] Create CustomerOrderTool service
- [x] Implement getCustomerOrders method
- [x] Implement getOrderDetails method
- [x] Add proper error handling via service layer
- [x] Tools auto-detected by Spring AI MCP Server

### Phase 4: Testing & Validation ✅ COMPLETED

#### 4.1 Application Testing ✅ COMPLETED
- [x] Test application startup
- [x] Verify database migrations
- [x] Test service layer functionality
- [x] Fix repository query issues
- [x] Verify MCP server auto-configuration

#### 4.2 Integration Testing ❌ PENDING
- [ ] Test database migrations
- [ ] Test MCP server startup
- [ ] Test tool discovery and execution

#### 4.3 Manual Testing ❌ PENDING
- [ ] Test with H2 database
- [ ] Test MCP client connections
- [ ] Validate tool responses

### Phase 5: Scripts & Automation ❌ PENDING

#### 5.1 Build Scripts ❌ PENDING
- [ ] Create build.sh script
- [ ] Create run-local.sh script
- [ ] Create test-mcp.sh script

#### 5.2 Testing Scripts ❌ PENDING
- [ ] Create test-mcp-client.js
- [ ] Create sample MCP requests
- [ ] Create performance test scripts

### Phase 6: Cloud Foundry Deployment ❌ PENDING

#### 6.1 Deployment Configuration ❌ PENDING
- [ ] Create manifest.yml
- [ ] Create deploy-cf.sh script
- [ ] Configure environment variables

#### 6.2 Production Testing ❌ PENDING
- [ ] Test PostgreSQL connection
- [ ] Test MCP server in cloud environment
- [ ] Validate tool performance

### Phase 7: Documentation ❌ PENDING

#### 7.1 API Documentation ❌ PENDING
- [ ] Create docs/API.md
- [ ] Document MCP tool schemas
- [ ] Create usage examples

#### 7.2 Deployment Documentation ❌ PENDING
- [ ] Create docs/DEPLOYMENT.md
- [ ] Create docs/DEVELOPMENT.md
- [ ] Update README.md

## Next Steps

**Currently Completed:**
- ✅ Maven project structure
- ✅ Database schema design
- ✅ Flyway migrations
- ✅ JPA entities with relationships
- ✅ Application configuration

**Next Priority (Phase 2.1):**
1. Create repository interfaces
2. Add custom query methods
3. Test repository layer

**Available Commands:**
- `mvn clean compile` - Test compilation
- `mvn clean package` - Build project
- `mvn spring-boot:run` - Run application locally

## Detailed Task Breakdown

### Phase 2.1: Repository Layer (NEXT)

#### CustomerRepository
```java
@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
    Optional<Customer> findByEmail(String email);
    List<Customer> findByFirstNameContainingIgnoreCase(String firstName);
    List<Customer> findByLastNameContainingIgnoreCase(String lastName);
}
```

#### OrderRepository
```java
@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByCustomerCustomerIdOrderByOrderDateDesc(Long customerId);
    List<Order> findByCustomerCustomerIdAndStatus(Long customerId, Order.OrderStatus status);
    
    @Query("SELECT o FROM Order o LEFT JOIN FETCH o.orderDetails WHERE o.customer.customerId = :customerId")
    List<Order> findByCustomerIdWithDetails(@Param("customerId") Long customerId);
    
    @Query("SELECT o FROM Order o LEFT JOIN FETCH o.orderDetails WHERE o.orderId = :orderId AND o.customer.customerId = :customerId")
    Optional<Order> findByOrderIdAndCustomerIdWithDetails(@Param("orderId") Long orderId, @Param("customerId") Long customerId);
}
```

#### OrderDetailRepository
```java
@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
    List<OrderDetail> findByOrderOrderId(Long orderId);
    List<OrderDetail> findByProductProductId(Long productId);
}
```

### Phase 2.2: Service Layer

#### OrderQueryService (Main service for MCP tools)
```java
@Service
public class OrderQueryService {
    public CustomerOrdersResponse getCustomerOrders(Long customerId);
    public OrderDetailsResponse getOrderDetails(Long customerId, Long orderId);
    private void validateCustomer(Long customerId);
    private void validateOrder(Long customerId, Long orderId);
}
```

### Phase 3.2: MCP Tools

#### Tool 1: GetCustomerOrdersTool
- **Input**: `{ "customerId": 123 }`
- **Output**: Customer info + list of orders + summary
- **Validation**: Customer exists
- **Error handling**: Invalid customer ID

#### Tool 2: GetOrderDetailsTool
- **Input**: `{ "customerId": 123, "orderId": 456 }`
- **Output**: Order details + customer info + line items
- **Validation**: Customer exists, order belongs to customer
- **Error handling**: Invalid IDs, order not found

## Success Criteria

- ✅ **Basic Setup**: Maven builds successfully
- ✅ **Database**: Migrations run successfully
- ✅ **Entities**: JPA entities compile without errors
- ❌ **Repositories**: Repository tests pass
- ❌ **Services**: Service layer works correctly
- ❌ **MCP Tools**: Tools are discoverable and executable
- ❌ **Local Testing**: H2 database works
- ❌ **Cloud Deployment**: PostgreSQL integration works
- ❌ **Documentation**: Complete usage guides 