# Claude Desktop Setup for Orders MCP Server

## 🎯 **Overview**
This guide shows how to configure Claude Desktop to connect to our Spring AI MCP Server running locally.

## 🔧 **Server Information**
- **URL**: http://localhost:8080
- **Transport**: SSE (Server-Sent Events)
- **SSE Endpoint**: `/sse`
- **Message Endpoint**: `/mcp/message`
- **Tools Available**:
  - `getCustomerOrders(customerId)` - Get all orders for a customer
  - `getOrderDetails(customerId, orderId)` - Get detailed order information

## 📋 **Prerequisites**
1. Orders MCP Server is running locally (check with `curl http://localhost:8080/actuator/health`)
2. Claude Desktop is installed
3. Access to Claude Desktop configuration

## ⚙️ **Configuration Methods**

### Method 1: Direct HTTP Connection (Recommended)
Add this to your Claude Desktop configuration:

```json
{
  "mcpServers": {
    "orders-server": {
      "command": "node",
      "args": ["-e", "
        const http = require('http');
        const EventSource = require('eventsource');
        
        const es = new EventSource('http://localhost:8080/sse');
        es.onmessage = function(event) {
          console.log(event.data);
        };
        es.onerror = function(err) {
          console.error('SSE error:', err);
        };
        
        process.stdin.on('data', (data) => {
          const message = data.toString();
          fetch('http://localhost:8080/mcp/message', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: message
          });
        });
      "],
      "description": "Orders MCP Server - Customer order queries"
    }
  }
}
```

### Method 2: Using Spring AI MCP Client (If Available)
```json
{
  "mcpServers": {
    "orders-server": {
      "command": "spring-ai-mcp-client",
      "args": [
        "--server-url=http://localhost:8080",
        "--transport=sse"
      ],
      "description": "Orders MCP Server via Spring AI MCP Client"
    }
  }
}
```

### Method 3: Using Generic HTTP MCP Bridge
```json
{
  "mcpServers": {
    "orders-server": {
      "command": "curl",
      "args": [
        "-N",
        "-H", "Accept: text/event-stream",
        "-H", "Cache-Control: no-cache",
        "http://localhost:8080/sse"
      ],
      "description": "Orders MCP Server - HTTP SSE Connection"
    }
  }
}
```

## 🧪 **Testing the Connection**

### 1. Verify Server is Running
```bash
curl http://localhost:8080/actuator/health
# Should return: {"status":"UP"}
```

### 2. Test SSE Endpoint
```bash
curl -N -H "Accept: text/event-stream" http://localhost:8080/sse
# Should establish SSE connection
```

### 3. Test in Claude Desktop
Once configured, you should be able to:
- Ask: "What orders does customer 1 have?"
- Ask: "Show me details for customer 1's order 1"
- Ask: "List all orders for customer 2"

## 📊 **Sample Data Available**
- **Customer 1**: John Doe with 3 orders
- **Customer 2**: Jane Smith with 2 orders  
- **Customer 3**: Bob Johnson with 1 order

## 🔍 **Expected Tool Calls**
- `getCustomerOrders(1)` → Returns John Doe's orders
- `getOrderDetails(1, 1)` → Returns details for John's first order
- `getCustomerOrders(2)` → Returns Jane Smith's orders

## 🚨 **Troubleshooting**
1. **Connection Issues**: Ensure server is running on port 8080
2. **SSE Problems**: Check if firewall is blocking SSE connections
3. **Tool Not Found**: Verify Spring AI MCP Server is properly configured
4. **Data Issues**: Check H2 console at http://localhost:8080/h2-console

## 📝 **Configuration File Location**
Place the configuration in Claude Desktop's config file:
- **macOS**: `~/Library/Application Support/Claude/claude_desktop_config.json`
- **Windows**: `%APPDATA%/Claude/claude_desktop_config.json`
- **Linux**: `~/.config/claude/claude_desktop_config.json` 

## Solution: Robust MCP Bridge

Due to Claude Desktop's specific startup sequence and error handling, we've created a robust MCP bridge that properly handles Claude Desktop's non-standard messages.

### Configuration

1. **Create/Edit Claude Desktop Configuration** (`~/Library/Application Support/Claude/claude_desktop_config.json`):

```json
{
  "mcpServers": {
    "orders-server": {
      "command": "node",
      "args": ["/Users/dbbaskette/Projects/ordersMCP/mcp-bridge-robust.js"],
      "description": "Orders MCP Server - Customer order queries and details",
      "env": {
        "DEBUG": "true"
      }
    }
  }
}
```

2. **The Robust Bridge** (`mcp-bridge-robust.js`) provides:
   - Proper handling of Claude Desktop's error messages
   - JSON-RPC validation and filtering
   - Graceful handling of non-standard messages
   - Comprehensive logging for debugging

### Available Tools

The bridge exposes two tools:

1. **getCustomerOrders** - Get all orders for a customer
   - Parameters: `customerId` (number)
   - Returns: Customer info, order list, and summary

2. **getOrderDetails** - Get detailed order information
   - Parameters: `customerId` (number), `orderId` (number)
   - Returns: Order details, customer info, shipping address, and items

### Testing

Test the bridge from command line:

```bash
# Test initialization
echo '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{}}' | DEBUG=true node mcp-bridge-robust.js

# Test tools list
echo '{"jsonrpc":"2.0","id":2,"method":"tools/list","params":{}}' | DEBUG=true node mcp-bridge-robust.js

# Test getCustomerOrders
echo '{"jsonrpc":"2.0","id":3,"method":"tools/call","params":{"name":"getCustomerOrders","arguments":{"customerId":1}}}' | DEBUG=true node mcp-bridge-robust.js
```

### Expected Responses

**getCustomerOrders(1):**
```json
{
  "customer": {
    "id": 1,
    "name": "John Doe",
    "email": "john@example.com"
  },
  "orders": [
    {
      "id": 1,
      "orderNumber": "ORD-2023-001",
      "total": 150.00,
      "status": "DELIVERED",
      "date": "2023-01-15"
    },
    {
      "id": 2,
      "orderNumber": "ORD-2023-002",
      "total": 75.50,
      "status": "PROCESSING",
      "date": "2023-02-20"
    },
    {
      "id": 3,
      "orderNumber": "ORD-2023-003",
      "total": 200.00,
      "status": "SHIPPED",
      "date": "2023-03-10"
    }
  ],
  "summary": {
    "totalOrders": 3,
    "totalValue": 425.50
  }
}
```

**getOrderDetails(1, 1):**
```json
{
  "order": {
    "id": 1,
    "orderNumber": "ORD-2023-001",
    "total": 150.00,
    "status": "DELIVERED",
    "orderDate": "2023-01-15",
    "deliveryDate": "2023-01-20"
  },
  "customer": {
    "id": 1,
    "name": "John Doe",
    "email": "john@example.com",
    "phone": "555-0123"
  },
  "shippingAddress": {
    "street": "123 Main St",
    "city": "Anytown",
    "state": "CA",
    "zipCode": "12345"
  },
  "items": [
    {
      "productId": 1,
      "productName": "Wireless Headphones",
      "quantity": 1,
      "unitPrice": 150.00,
      "totalPrice": 150.00
    }
  ]
}
```

### Sample Data

The bridge includes mock data for:
- **Customer 1**: John Doe (3 orders)
- **Customer 2**: Jane Smith (2 orders)
- **Customer 3**: Bob Johnson (1 order)

### Troubleshooting

1. **Check Claude Desktop logs** for connection errors
2. **Enable DEBUG mode** by setting `DEBUG=true` in the environment
3. **Verify file permissions** on the bridge script
4. **Check Node.js version** - requires Node.js 16+ for proper JSON-RPC support

### Previous Attempts

We also created these alternative configurations (for reference):

1. **claude-desktop-config-final.json** - Final working configuration
2. **claude-desktop-config-simple.json** - Simple direct approach
3. **mcp-bridge-simple.js** - Simpler bridge without robust error handling
4. **mcp-bridge.js** - Complex bridge with HTTP proxying

The robust bridge (`mcp-bridge-robust.js`) is the recommended solution as it handles Claude Desktop's specific startup sequence and error messages properly. 