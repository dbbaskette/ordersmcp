#!/usr/bin/env node

/**
 * MCP Bridge for Orders Server
 * Connects Claude Desktop to Spring AI MCP Server via HTTP/SSE
 */

const http = require('http');
const https = require('https');

// Configuration
const SERVER_URL = 'http://localhost:8080';
const DEBUG = process.env.DEBUG === 'true';

// Logging function
function log(message) {
  if (DEBUG) {
    console.error(`[MCP-Bridge] ${message}`);
  }
}

// MCP Server implementation
class MCPServer {
  constructor() {
    this.tools = [
      {
        name: 'getCustomerOrders',
        description: 'Get all orders for a specific customer',
        inputSchema: {
          type: 'object',
          properties: {
            customerId: {
              type: 'number',
              description: 'The customer ID to get orders for'
            }
          },
          required: ['customerId']
        }
      },
      {
        name: 'getOrderDetails',
        description: 'Get detailed information about a specific order',
        inputSchema: {
          type: 'object',
          properties: {
            customerId: {
              type: 'number',
              description: 'The customer ID'
            },
            orderId: {
              type: 'number',
              description: 'The order ID'
            }
          },
          required: ['customerId', 'orderId']
        }
      }
    ];
  }

  async handleRequest(request) {
    log(`Received request: ${JSON.stringify(request)}`);
    
    try {
      switch (request.method) {
        case 'initialize':
          return this.handleInitialize(request);
        case 'tools/list':
          return this.handleToolsList(request);
        case 'tools/call':
          return this.handleToolCall(request);
        default:
          throw new Error(`Unknown method: ${request.method}`);
      }
    } catch (error) {
      log(`Error handling request: ${error.message}`);
      return {
        jsonrpc: '2.0',
        id: request.id,
        error: {
          code: -32603,
          message: error.message
        }
      };
    }
  }

  handleInitialize(request) {
    return {
      jsonrpc: '2.0',
      id: request.id,
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
  }

  handleToolsList(request) {
    return {
      jsonrpc: '2.0',
      id: request.id,
      result: {
        tools: this.tools
      }
    };
  }

  async handleToolCall(request) {
    const { name, arguments: args } = request.params;
    
    log(`Calling tool: ${name} with args: ${JSON.stringify(args)}`);
    
    try {
      let result;
      
      if (name === 'getCustomerOrders') {
        result = await this.callSpringAITool('getCustomerOrders', args.customerId);
      } else if (name === 'getOrderDetails') {
        result = await this.callSpringAITool('getOrderDetails', args.customerId, args.orderId);
      } else {
        throw new Error(`Unknown tool: ${name}`);
      }
      
      return {
        jsonrpc: '2.0',
        id: request.id,
        result: {
          content: [
            {
              type: 'text',
              text: JSON.stringify(result, null, 2)
            }
          ],
          isError: false
        }
      };
    } catch (error) {
      log(`Error calling tool: ${error.message}`);
      return {
        jsonrpc: '2.0',
        id: request.id,
        error: {
          code: -32603,
          message: `Tool call failed: ${error.message}`
        }
      };
    }
  }

  async callSpringAITool(toolName, ...args) {
    return new Promise((resolve, reject) => {
      // Simulate calling the Spring AI tool
      // In a real implementation, this would make HTTP requests to the Spring AI server
      
      const mockData = {
        getCustomerOrders: {
          1: {
            customer: { id: 1, name: 'John Doe' },
            orders: [
              { id: 1, orderNumber: 'ORD-2023-001', total: 150.00, status: 'DELIVERED' },
              { id: 2, orderNumber: 'ORD-2023-002', total: 75.50, status: 'PROCESSING' },
              { id: 3, orderNumber: 'ORD-2023-003', total: 200.00, status: 'SHIPPED' }
            ]
          },
          2: {
            customer: { id: 2, name: 'Jane Smith' },
            orders: [
              { id: 4, orderNumber: 'ORD-2023-004', total: 99.99, status: 'DELIVERED' },
              { id: 5, orderNumber: 'ORD-2023-005', total: 125.00, status: 'PROCESSING' }
            ]
          }
        },
        getOrderDetails: {
          '1-1': {
            order: { id: 1, orderNumber: 'ORD-2023-001', total: 150.00, status: 'DELIVERED' },
            customer: { id: 1, name: 'John Doe', email: 'john@example.com' },
            items: [
              { product: 'Laptop', quantity: 1, price: 150.00 }
            ]
          }
        }
      };
      
      if (toolName === 'getCustomerOrders') {
        const result = mockData.getCustomerOrders[args[0]];
        if (result) {
          resolve(result);
        } else {
          reject(new Error(`Customer ${args[0]} not found`));
        }
      } else if (toolName === 'getOrderDetails') {
        const key = `${args[0]}-${args[1]}`;
        const result = mockData.getOrderDetails[key];
        if (result) {
          resolve(result);
        } else {
          reject(new Error(`Order ${args[1]} for customer ${args[0]} not found`));
        }
      }
    });
  }
}

// Main execution
async function main() {
  const server = new MCPServer();
  
  log('Starting MCP Bridge...');
  
  // Set up JSON-RPC communication over stdio
  let buffer = '';
  
  process.stdin.on('data', async (chunk) => {
    buffer += chunk.toString();
    
    // Process complete JSON-RPC messages
    let newlineIndex;
    while ((newlineIndex = buffer.indexOf('\n')) !== -1) {
      const line = buffer.slice(0, newlineIndex);
      buffer = buffer.slice(newlineIndex + 1);
      
      if (line.trim()) {
        try {
          const request = JSON.parse(line);
          log(`Received raw request: ${line}`);
          
          // Handle Claude Desktop specific messages
          if (request.error) {
            log(`Received error message from Claude Desktop: ${JSON.stringify(request)}`);
            // Claude Desktop sent an error, acknowledge it
            continue;
          }
          
          // Validate basic JSON-RPC structure
          if (!request.jsonrpc || request.jsonrpc !== '2.0') {
            log(`Invalid JSON-RPC version: ${request.jsonrpc}, ignoring`);
            continue;
          }
          
          if (!request.method) {
            log(`Missing method in request, ignoring: ${JSON.stringify(request)}`);
            continue;
          }
          
          const response = await server.handleRequest(request);
          const responseStr = JSON.stringify(response);
          log(`Sending response: ${responseStr}`);
          console.log(responseStr);
        } catch (error) {
          log(`Error processing request: ${error.message}`);
          log(`Raw line was: ${line}`);
          
          // Try to extract ID if possible
          let requestId = null;
          try {
            const partialRequest = JSON.parse(line);
            requestId = partialRequest.id || null;
          } catch (e) {
            // Ignore parsing errors for ID extraction
          }
          
          const errorResponse = {
            jsonrpc: '2.0',
            id: requestId,
            error: {
              code: -32700,
              message: `Parse error: ${error.message}`
            }
          };
          console.log(JSON.stringify(errorResponse));
        }
      }
    }
  });
  
  process.stdin.on('end', () => {
    log('Input stream ended');
    process.exit(0);
  });
  
  log('MCP Bridge ready');
}

// Handle process cleanup
process.on('SIGINT', () => {
  log('Received SIGINT, shutting down...');
  process.exit(0);
});

process.on('SIGTERM', () => {
  log('Received SIGTERM, shutting down...');
  process.exit(0);
});

// Start the server
main().catch((error) => {
  log(`Fatal error: ${error.message}`);
  process.exit(1);
}); 