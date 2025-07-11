#!/usr/bin/env node

const https = require('https');
const http = require('http');

// MCP server is running on HTTP, not stdio
const MCP_SERVER_URL = 'http://localhost:8081';

// Function to send HTTP request to MCP server
async function sendMcpRequest(method, params = {}) {
    const message = {
        jsonrpc: "2.0",
        id: Math.floor(Math.random() * 1000),
        method: method,
        params: params
    };
    
    console.log('Sending:', JSON.stringify(message, null, 2));
    
    return new Promise((resolve, reject) => {
        const postData = JSON.stringify(message);
        
        const options = {
            hostname: 'localhost',
            port: 8081,
            path: '/mcp', // MCP endpoint
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Content-Length': Buffer.byteLength(postData)
            }
        };
        
        const req = http.request(options, (res) => {
            let data = '';
            res.on('data', (chunk) => {
                data += chunk;
            });
            res.on('end', () => {
                try {
                    const response = JSON.parse(data);
                    console.log('=== Received Response ===');
                    console.log(JSON.stringify(response, null, 2));
                    resolve(response);
                } catch (error) {
                    console.log('=== Raw Response ===');
                    console.log(data);
                    resolve(data);
                }
            });
        });
        
        req.on('error', (error) => {
            console.error('Request error:', error);
            reject(error);
        });
        
        req.write(postData);
        req.end();
    });
}

// Test the MCP server
async function testMcpServer() {
    console.log('Starting MCP HTTP test...\n');
    
    try {
        // Initialize MCP connection
        console.log('=== Initializing MCP Connection ===');
        const initResponse = await sendMcpRequest('initialize', {
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
        console.log('\n=== Listing Tools ===');
        const toolsResponse = await sendMcpRequest('tools/list', {});
        
        // If tools are available, test calling one
        if (toolsResponse.result && toolsResponse.result.tools && toolsResponse.result.tools.length > 0) {
            console.log('\n=== Available Tools ===');
            toolsResponse.result.tools.forEach(tool => {
                console.log(`- ${tool.name}: ${tool.description}`);
            });
            
            // Test calling the first available tool
            const firstTool = toolsResponse.result.tools[0];
            console.log(`\n=== Testing Tool Call: ${firstTool.name} ===`);
            const toolCallResponse = await sendMcpRequest('tools/call', {
                name: firstTool.name,
                arguments: {
                    customerId: 1
                }
            });
        } else {
            console.log('\n=== No Tools Available ===');
            console.log('The MCP server did not return any tools.');
        }
        
    } catch (error) {
        console.error('Test failed:', error);
    }
    
    console.log('\n=== Test Complete ===');
}

// Run the test
testMcpServer(); 