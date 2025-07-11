# Orders MCP Server

A Spring Boot-based Model Context Protocol (MCP) server that provides AI assistants with tools to query customer orders and order details. Built with Spring AI MCP Server WebMVC and designed for integration with Claude Desktop.

## Features

- **MCP Protocol Support**: Full Model Context Protocol implementation with JSON-RPC 2.0
- **Spring Boot 3.4.5**: Modern Spring Boot architecture with WebMVC
- **Spring AI Integration**: Spring AI MCP Server for seamless AI assistant integration
- **Database Support**: H2 (local development) and PostgreSQL (production)
- **Flyway Migrations**: Database schema versioning and sample data
- **Security**: Updated to PostgreSQL 42.7.7 (resolved CVE-2024-1597)
- **Claude Desktop Ready**: Robust bridge for Claude Desktop integration

## Available Tools

### `getCustomerOrders`
Retrieve all orders for a specific customer.

**Parameters:**
- `customerId` (number): Customer ID

**Returns:**
- Customer information
- List of orders with status and totals
- Order summary statistics

### `getOrderDetails`
Get detailed information about a specific order.

**Parameters:**
- `customerId` (number): Customer ID
- `orderId` (number): Order ID

**Returns:**
- Order details (dates, status, totals)
- Customer information
- Shipping address
- Order items with products and quantities

## Quick Start

### Prerequisites
- Java 21+
- Maven 3.8+
- Node.js 16+ (for Claude Desktop integration)

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/dbbaskette/ordersmcp.git
   cd ordersmcp
   ```

2. **Build the project**
   ```bash
   ./scripts/build.sh
   ```

3. **Run locally with H2 database**
   ```bash
   ./scripts/run-local.sh
   ```

4. **Run tests**
   ```bash
   ./scripts/build.sh test
   ```

The server will start on `http://localhost:8080` with:
- H2 Console: `http://localhost:8080/h2-console`
- Health Check: `http://localhost:8080/actuator/health`
- MCP SSE Endpoint: `http://localhost:8080/sse`

## Claude Desktop Integration

### Setup

1. **Copy the robust bridge configuration**
   ```bash
   cp claude-desktop-config-robust.json ~/Library/Application\ Support/Claude/claude_desktop_config.json
   ```

2. **Ensure the bridge script is executable**
   ```bash
   chmod +x mcp-bridge-robust.js
   ```

3. **Restart Claude Desktop**

### Usage Examples

Ask Claude Desktop:
- "What orders does customer 1 have?"
- "Show me details for order 1 of customer 1"
- "What's the total value of all orders for customer 2?"

### Sample Data

The server includes sample data for testing:
- **Customer 1**: John Doe (3 orders: DELIVERED, PROCESSING, SHIPPED)
- **Customer 2**: Jane Smith (2 orders: DELIVERED, PROCESSING)  
- **Customer 3**: Bob Johnson (1 order: DELIVERED)

## Architecture

```
├── Spring Boot 3.4.5
├── Spring AI MCP Server WebMVC
├── H2 Database (local) / PostgreSQL (production)
├── Flyway Database Migrations
├── JPA/Hibernate Entities
├── Repository Layer
├── Service Layer
├── MCP Tools Layer
└── Node.js Bridge (Claude Desktop)
```

## Project Structure

```
ordersmcp/
├── src/main/java/com/baskettecase/ordersmcp/
│   ├── entity/          # JPA entities
│   ├── repository/      # Data access layer
│   ├── service/         # Business logic
│   ├── dto/            # Data transfer objects
│   ├── mcp/            # MCP tool implementations
│   └── config/         # Configuration
├── src/main/resources/
│   ├── db/migration/   # Flyway database migrations
│   └── application*.yml # Configuration files
├── scripts/            # Build and run scripts
├── mcp-bridge-robust.js # Claude Desktop bridge
└── claude-desktop-*.json # Claude Desktop configs
```

## Configuration

### Database Profiles

- **Local**: `application-local.yml` - H2 in-memory database
- **Cloud**: `application-cloud.yml` - PostgreSQL for production

### Environment Variables

- `SPRING_PROFILES_ACTIVE`: Set to `local` or `cloud`
- `DEBUG`: Set to `true` for MCP bridge debugging

## Build Scripts

- `./scripts/build.sh` - Maven build, test, and package
- `./scripts/run-local.sh` - Start local server with H2
- `./scripts/test-mcp-tools.sh` - Test MCP endpoints

## Testing

Run the comprehensive test suite:
```bash
./scripts/build.sh test
```

Tests include:
- Unit tests for services and repositories
- Integration tests for MCP tools
- Database migration validation

## Security

- **PostgreSQL Driver**: Updated to 42.7.7 (fixes CVE-2024-1597)
- **Spring Security**: Built-in security configurations
- **H2 Console**: Disabled in production profiles

## Deployment

### Local Development
```bash
./scripts/run-local.sh
```

### Production (Cloud Foundry)
```bash
./scripts/build.sh package
# Deploy JAR to Cloud Foundry with cloud profile
```

## Troubleshooting

### Common Issues

1. **Port 8080 in use**: The run script automatically detects and frees the port
2. **Claude Desktop connection**: Check DEBUG logs in `mcp-bridge-robust.js`
3. **Database migrations**: Verify Flyway migrations in application logs

### Debug Mode

Enable debug logging:
```bash
DEBUG=true ./scripts/run-local.sh
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Run tests: `./scripts/build.sh test`
4. Submit a pull request

## License

This project is licensed under the MIT License.

## Technologies

- **Spring Boot 3.4.5** - Application framework
- **Spring AI 1.0.0** - AI integration framework
- **Spring Data JPA** - Data access layer
- **Flyway** - Database migrations
- **H2 Database** - Local development
- **PostgreSQL** - Production database
- **Maven** - Build tool
- **Node.js** - Claude Desktop bridge