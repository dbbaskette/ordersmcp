#!/usr/bin/env node

// To use: npm install eventsource
const EventSource = require('eventsource');
const http = require('http');

const SSE_URL = 'http://localhost:8081/mcp/sse';

// Send a JSON-RPC request to the MCP server
function sendMcpRequest(method, params = {}) {
    const message = {
        jsonrpc: "2.0",
        id: 1,
        method,
        params
    };
    const postData = JSON.stringify(message);
    const options = {
        hostname: 'localhost',
        port: 8081,
        path: '/mcp',
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Content-Length': Buffer.byteLength(postData)
        }
    };
    const req = http.request(options, (res) => {
        res.on('data', (chunk) => {
            console.log('Response:', chunk.toString());
        });
    });
    req.on('error', (e) => {
        console.error(`Problem with request: ${e.message}`);
    });
    req.write(postData);
    req.end();
}

// Listen for SSE events
const es = new EventSource(SSE_URL);
es.onmessage = function(event) {
    console.log('SSE Event:', event.data);
};
es.onerror = function(err) {
    console.error('SSE error:', err);
};

// Example: send a tool list request after a short delay
setTimeout(() => {
    sendMcpRequest('tools/list');
}, 1000); 