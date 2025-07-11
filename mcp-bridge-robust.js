#!/usr/bin/env node

/**
 * Robust MCP Bridge for Claude Desktop
 * Handles Claude Desktop's specific startup sequence and error messages
 */

const DEBUG = process.env.DEBUG === 'true';

function log(message) {
  if (DEBUG) {
    console.error(`[MCP-Robust] ${message}`);
  }
}

function isValidJsonRpc(message) {
  return message && 
         typeof message === 'object' && 
         message.jsonrpc === '2.0' && 
         typeof message.method === 'string' &&
         (message.id !== undefined);
}

async function handleMessage(message) {
  log(`Received: ${JSON.stringify(message)}`);
  
  // Handle Claude Desktop error messages gracefully
  if (message.error && !message.method) {
    log(`Ignoring Claude Desktop error message: ${JSON.stringify(message.error)}`);
    return null; // Don't respond to error-only messages
  }
  
  // Skip messages that aren't valid JSON-RPC
  if (!isValidJsonRpc(message)) {
    log(`Skipping invalid JSON-RPC message: ${JSON.stringify(message)}`);
    return null;
  }
  
  const { id, method, params } = message;
  
  try {
    switch (method) {
      case 'initialize':
        return {
          jsonrpc: '2.0',
          id,
          result: {
            protocolVersion: '2024-11-05',
            capabilities: {
              tools: {}
            },
            serverInfo: {
              name: 'orders-mcp-server',
              version: '1.0.0'
            }
          }
        };
        
      case 'tools/list':
        return {
          jsonrpc: '2.0',
          id,
          result: {
            tools: [
              {
                name: 'getCustomerOrders',
                description: 'Get all orders for a customer',
                inputSchema: {
                  type: 'object',
                  properties: {
                    customerId: { type: 'number', description: 'Customer ID' }
                  },
                  required: ['customerId']
                }
              },
              {
                name: 'getOrderDetails',
                description: 'Get order details',
                inputSchema: {
                  type: 'object',
                  properties: {
                    customerId: { type: 'number', description: 'Customer ID' },
                    orderId: { type: 'number', description: 'Order ID' }
                  },
                  required: ['customerId', 'orderId']
                }
              }
            ]
          }
        };
        
      case 'tools/call':
        if (!params || !params.name || !params.arguments) {
          throw new Error('Invalid tool call parameters');
        }
        
        const { name, arguments: args } = params;
        
        // Mock data for demonstration
        const mockData = {
          getCustomerOrders: {
            1: { 
              customer: { id: 1, name: 'John Doe', email: 'john@example.com' },
              orders: [
                { id: 1, orderNumber: 'ORD-2023-001', total: 150.00, status: 'DELIVERED', date: '2023-01-15' },
                { id: 2, orderNumber: 'ORD-2023-002', total: 75.50, status: 'PROCESSING', date: '2023-02-20' },
                { id: 3, orderNumber: 'ORD-2023-003', total: 200.00, status: 'SHIPPED', date: '2023-03-10' }
              ],
              summary: { totalOrders: 3, totalValue: 425.50 }
            },
            2: { 
              customer: { id: 2, name: 'Jane Smith', email: 'jane@example.com' },
              orders: [
                { id: 4, orderNumber: 'ORD-2023-004', total: 99.99, status: 'DELIVERED', date: '2023-01-25' },
                { id: 5, orderNumber: 'ORD-2023-005', total: 125.00, status: 'PROCESSING', date: '2023-03-15' }
              ],
              summary: { totalOrders: 2, totalValue: 224.99 }
            },
            3: {
              customer: { id: 3, name: 'Bob Johnson', email: 'bob@example.com' },
              orders: [
                { id: 6, orderNumber: 'ORD-2023-006', total: 300.00, status: 'DELIVERED', date: '2023-02-01' }
              ],
              summary: { totalOrders: 1, totalValue: 300.00 }
            }
          },
          getOrderDetails: {
            '1-1': { 
              order: { 
                id: 1, 
                orderNumber: 'ORD-2023-001', 
                total: 150.00, 
                status: 'DELIVERED',
                orderDate: '2023-01-15',
                deliveryDate: '2023-01-20'
              },
              customer: { 
                id: 1, 
                name: 'John Doe', 
                email: 'john@example.com',
                phone: '555-0123'
              },
              shippingAddress: {
                street: '123 Main St',
                city: 'Anytown',
                state: 'CA',
                zipCode: '12345'
              },
              items: [
                { 
                  productId: 1,
                  productName: 'Wireless Headphones', 
                  quantity: 1, 
                  unitPrice: 150.00,
                  totalPrice: 150.00
                }
              ]
            },
            '1-2': {
              order: { 
                id: 2, 
                orderNumber: 'ORD-2023-002', 
                total: 75.50, 
                status: 'PROCESSING',
                orderDate: '2023-02-20'
              },
              customer: { 
                id: 1, 
                name: 'John Doe', 
                email: 'john@example.com',
                phone: '555-0123'
              },
              items: [
                { 
                  productId: 2,
                  productName: 'Phone Case', 
                  quantity: 1, 
                  unitPrice: 25.50,
                  totalPrice: 25.50
                },
                { 
                  productId: 3,
                  productName: 'Screen Protector', 
                  quantity: 2, 
                  unitPrice: 25.00,
                  totalPrice: 50.00
                }
              ]
            }
          }
        };
        
        let result;
        if (name === 'getCustomerOrders') {
          result = mockData.getCustomerOrders[args.customerId];
          if (!result) {
            result = { error: `Customer ${args.customerId} not found`, availableCustomers: [1, 2, 3] };
          }
        } else if (name === 'getOrderDetails') {
          const key = `${args.customerId}-${args.orderId}`;
          result = mockData.getOrderDetails[key];
          if (!result) {
            result = { error: `Order ${args.orderId} for customer ${args.customerId} not found` };
          }
        } else {
          throw new Error(`Unknown tool: ${name}`);
        }
        
        return {
          jsonrpc: '2.0',
          id,
          result: {
            content: [
              {
                type: 'text',
                text: JSON.stringify(result, null, 2)
              }
            ]
          }
        };
        
      case 'ping':
        return {
          jsonrpc: '2.0',
          id,
          result: { status: 'ok' }
        };
        
      default:
        log(`Unknown method: ${method}`);
        return {
          jsonrpc: '2.0',
          id,
          error: {
            code: -32601,
            message: `Method not found: ${method}`
          }
        };
    }
  } catch (error) {
    log(`Error: ${error.message}`);
    return {
      jsonrpc: '2.0',
      id: id || null,
      error: {
        code: -32603,
        message: error.message
      }
    };
  }
}

// Main loop
let buffer = '';

process.stdin.on('data', async (chunk) => {
  buffer += chunk.toString();
  
  let newlineIndex;
  while ((newlineIndex = buffer.indexOf('\n')) !== -1) {
    const line = buffer.slice(0, newlineIndex).trim();
    buffer = buffer.slice(newlineIndex + 1);
    
    if (line) {
      try {
        const message = JSON.parse(line);
        const response = await handleMessage(message);
        
        // Only send response if we have one (some messages we ignore)
        if (response) {
          log(`Sending: ${JSON.stringify(response)}`);
          console.log(JSON.stringify(response));
        }
      } catch (error) {
        log(`Parse error: ${error.message} for line: ${line}`);
        
        // Try to be helpful with parse errors
        if (line.includes('{')) {
          console.log(JSON.stringify({
            jsonrpc: '2.0',
            id: null,
            error: { 
              code: -32700, 
              message: `Parse error: ${error.message}` 
            }
          }));
        }
        // Otherwise just ignore non-JSON lines
      }
    }
  }
});

process.stdin.on('end', () => {
  log('Connection closed');
  process.exit(0);
});

process.on('SIGINT', () => {
  log('Received SIGINT, shutting down...');
  process.exit(0);
});

process.on('SIGTERM', () => {
  log('Received SIGTERM, shutting down...');
  process.exit(0);
});

log('MCP Bridge Robust started - ready for Claude Desktop'); 