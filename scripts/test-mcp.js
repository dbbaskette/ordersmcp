#!/usr/bin/env node

const { spawn } = require('child_process');
const readline = require('readline');

// Connect to the existing MCP server via stdio
// The server should be running on stdio transport by default
const mcpServer = spawn('java', ['-jar', 'target/orders-mcp-server-1.0.0.jar'], {
    stdio: ['pipe', 'pipe', 'pipe']
});

// Create readline interface for reading server output
const rl = readline.createInterface({
    input: mcpServer.stdout,
    terminal: false
});

let messageId = 1;

// Function to send MCP message
function sendMcpMessage(method, params = {}) {
    const message = {
        jsonrpc: "2.0",
        id: messageId++,
        method: method,
        params: params
    };
    
    console.log('Sending:', JSON.stringify(message, null, 2));
    mcpServer.stdin.write(JSON.stringify(message) + '\n');
}

// Listen for server responses
rl.on('line', (line) => {
    console.log('\n=== Raw MCP Response ===');
    console.log(line);
    try {
        const response = JSON.parse(line);
        console.log('=== Parsed MCP Response ===');
        console.log(JSON.stringify(response, null, 2));

        // Print all tool names from tools/list
        if (response.result && response.result.tools) {
            console.log('\n=== Available Tools (from tools/list) ===');
            response.result.tools.forEach(tool => {
                console.log(`- ${tool.name}: ${tool.description}`);
            });
        }

        // If we get a successful response to tools/list, call the tool
        if (response.id === 2 && response.result && response.result.tools) {
            console.log('\n=== Available Tools ===');
            response.result.tools.forEach(tool => {
                console.log(`- ${tool.name}: ${tool.description}`);
            });

            // Test calling the query_customer_orders tool
            setTimeout(() => {
                console.log('\n=== Testing Tool Call: query_customer_orders ===');
                sendMcpMessage('tools/call', {
                    name: 'query_customer_orders',
                    arguments: {
                        customerId: 1
                    }
                });
            }, 1000);
        }

        // If we get a response to the tool call
        if (response.id === 3 && response.result) {
            console.log('\n=== Tool Call Result ===');
            console.log(JSON.stringify(response.result, null, 2));
        }

    } catch (error) {
        console.log('=== Could not parse as JSON, raw output above ===');
    }
});

// Handle server errors
mcpServer.stderr.on('data', (data) => {
    console.log('Server Error:', data.toString());
});

// Start the test
console.log('Starting MCP server test...\n');

// Initialize MCP connection
console.log('=== Initializing MCP Connection ===');
sendMcpMessage('initialize', {
    protocolVersion: '2024-11-05',
    capabilities: {
        tools: {}
    },
    clientInfo: {
        name: 'test-client',
        version: '1.0.0'
    }
});

// List available tools
setTimeout(() => {
    console.log('\n=== Listing Tools ===');
    sendMcpMessage('tools/list', {});
}, 2000);

// End the test after a reasonable timeout
setTimeout(() => {
    console.log('\n=== Test Complete ===');
    mcpServer.kill();
    process.exit(0);
}, 10000); 