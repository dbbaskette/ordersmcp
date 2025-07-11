#!/usr/bin/env node

/**
 * Simple MCP Bridge for Claude Desktop
 * Minimal implementation of MCP protocol for Orders Server
 */

const DEBUG = process.env.DEBUG === 'true';

function log(message) {
  if (DEBUG) {
    console.error(`[MCP-Simple] ${message}`);
  }
}

async function handleMessage(message) {
  log(`Received: ${JSON.stringify(message)}`);
  
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
        const { name, arguments: args } = params;
        
        // Mock data for demonstration
        const mockData = {
          getCustomerOrders: {
            1: { customer: 'John Doe', orders: ['ORD-001', 'ORD-002', 'ORD-003'] },
            2: { customer: 'Jane Smith', orders: ['ORD-004', 'ORD-005'] }
          },
          getOrderDetails: {
            '1-1': { order: 'ORD-001', customer: 'John Doe', total: 150.00, status: 'DELIVERED' }
          }
        };
        
        let result;
        if (name === 'getCustomerOrders') {
          result = mockData.getCustomerOrders[args.customerId] || { error: 'Customer not found' };
        } else if (name === 'getOrderDetails') {
          const key = `${args.customerId}-${args.orderId}`;
          result = mockData.getOrderDetails[key] || { error: 'Order not found' };
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
        
      default:
        throw new Error(`Unknown method: ${method}`);
    }
  } catch (error) {
    log(`Error: ${error.message}`);
    return {
      jsonrpc: '2.0',
      id,
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
        log(`Sending: ${JSON.stringify(response)}`);
        console.log(JSON.stringify(response));
      } catch (error) {
        log(`Parse error: ${error.message}`);
        console.log(JSON.stringify({
          jsonrpc: '2.0',
          id: null,
          error: { code: -32700, message: 'Parse error' }
        }));
      }
    }
  }
});

process.stdin.on('end', () => {
  log('Connection closed');
  process.exit(0);
});

log('MCP Bridge Simple started'); 