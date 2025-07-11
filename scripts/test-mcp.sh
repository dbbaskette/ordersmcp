#!/bin/bash

# ==============================================================================
# ORDERS MCP SERVER - MCP TESTING SCRIPT
# ==============================================================================
# Test the Orders MCP Server tools and endpoints

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# ==============================================================================
# CONFIGURATION
# ==============================================================================

# Default configuration
SERVER_URL="http://localhost:8080"
TIMEOUT=30
VERBOSE="false"

# ==============================================================================
# FUNCTIONS
# ==============================================================================

show_help() {
    echo "Orders MCP Server Testing Script"
    echo ""
    echo "Usage: $0 [OPTIONS] [COMMAND]"
    echo ""
    echo "Options:"
    echo "  -s, --server URL     Server URL (default: http://localhost:8080)"
    echo "  -t, --timeout SEC    Timeout in seconds (default: 30)"
    echo "  -v, --verbose        Verbose output"
    echo "  -h, --help           Show this help message"
    echo ""
    echo "Commands:"
    echo "  health              Check server health"
    echo "  capabilities        Test MCP capabilities endpoint"
    echo "  tools               Test MCP tools endpoint"
    echo "  customer-orders     Test getCustomerOrders tool"
    echo "  order-details       Test getOrderDetails tool"
    echo "  all                 Run all tests (default)"
    echo ""
    echo "Examples:"
    echo "  $0                  # Run all tests"
    echo "  $0 health           # Check server health only"
    echo "  $0 -v tools         # Test tools with verbose output"
    echo "  $0 -s http://localhost:8081 all  # Test different port"
}

check_prerequisites() {
    print_info "🔍 Checking prerequisites..."
    
    # Check if curl is available
    if ! command -v curl &> /dev/null; then
        print_error "❌ curl not found. Please install curl."
        exit 1
    fi
    
    # Check if jq is available (optional)
    if ! command -v jq &> /dev/null; then
        print_warning "⚠️  jq not found. JSON output will be raw."
    fi
    
    print_success "✅ Prerequisites check passed"
}

wait_for_server() {
    print_info "⏳ Waiting for server to be ready..."
    local attempts=0
    local max_attempts=10
    
    while [[ $attempts -lt $max_attempts ]]; do
        if curl -s -f "$SERVER_URL/actuator/health" > /dev/null 2>&1; then
            print_success "✅ Server is ready"
            return 0
        fi
        
        attempts=$((attempts + 1))
        print_info "Attempt $attempts/$max_attempts - waiting..."
        sleep 3
    done
    
    print_error "❌ Server is not responding after $max_attempts attempts"
    return 1
}

format_json() {
    if command -v jq &> /dev/null; then
        jq '.'
    else
        cat
    fi
}

test_health() {
    print_info "🏥 Testing server health..."
    
    local response=$(curl -s -f "$SERVER_URL/actuator/health" 2>/dev/null)
    local status=$?
    
    if [[ $status -eq 0 ]]; then
        print_success "✅ Health check passed"
        if [[ "$VERBOSE" == "true" ]]; then
            echo "$response" | format_json
        fi
        return 0
    else
        print_error "❌ Health check failed"
        return 1
    fi
}

test_mcp_capabilities() {
    print_info "🔧 Testing MCP capabilities..."
    
    local response=$(curl -s -f "$SERVER_URL/mcp/capabilities" 2>/dev/null)
    local status=$?
    
    if [[ $status -eq 0 ]]; then
        print_success "✅ MCP capabilities test passed"
        if [[ "$VERBOSE" == "true" ]]; then
            echo "$response" | format_json
        fi
        return 0
    else
        print_error "❌ MCP capabilities test failed"
        return 1
    fi
}

test_mcp_tools() {
    print_info "🛠️  Testing MCP tools discovery..."
    
    local response=$(curl -s -f "$SERVER_URL/mcp/tools" 2>/dev/null)
    local status=$?
    
    if [[ $status -eq 0 ]]; then
        print_success "✅ MCP tools discovery test passed"
        if [[ "$VERBOSE" == "true" ]]; then
            echo "$response" | format_json
        fi
        
        # Check if our tools are present
        if echo "$response" | grep -q "getCustomerOrders"; then
            print_success "✅ getCustomerOrders tool found"
        else
            print_warning "⚠️  getCustomerOrders tool not found"
        fi
        
        if echo "$response" | grep -q "getOrderDetails"; then
            print_success "✅ getOrderDetails tool found"
        else
            print_warning "⚠️  getOrderDetails tool not found"
        fi
        
        return 0
    else
        print_error "❌ MCP tools discovery test failed"
        return 1
    fi
}

test_customer_orders() {
    print_info "👤 Testing getCustomerOrders tool..."
    
    local payload='{"tool": "getCustomerOrders", "arguments": {"customerId": 1}}'
    
    local response=$(curl -s -f -X POST \
        -H "Content-Type: application/json" \
        -d "$payload" \
        "$SERVER_URL/mcp/tools/call" 2>/dev/null)
    local status=$?
    
    if [[ $status -eq 0 ]]; then
        print_success "✅ getCustomerOrders tool test passed"
        if [[ "$VERBOSE" == "true" ]]; then
            echo "$response" | format_json
        fi
        return 0
    else
        print_error "❌ getCustomerOrders tool test failed"
        return 1
    fi
}

test_order_details() {
    print_info "📋 Testing getOrderDetails tool..."
    
    local payload='{"tool": "getOrderDetails", "arguments": {"customerId": 1, "orderId": 1}}'
    
    local response=$(curl -s -f -X POST \
        -H "Content-Type: application/json" \
        -d "$payload" \
        "$SERVER_URL/mcp/tools/call" 2>/dev/null)
    local status=$?
    
    if [[ $status -eq 0 ]]; then
        print_success "✅ getOrderDetails tool test passed"
        if [[ "$VERBOSE" == "true" ]]; then
            echo "$response" | format_json
        fi
        return 0
    else
        print_error "❌ getOrderDetails tool test failed"
        return 1
    fi
}

run_all_tests() {
    print_info "🧪 Running all MCP tests..."
    
    local failed=0
    
    # Wait for server to be ready
    if ! wait_for_server; then
        return 1
    fi
    
    # Run all tests
    test_health || failed=$((failed + 1))
    test_mcp_capabilities || failed=$((failed + 1))
    test_mcp_tools || failed=$((failed + 1))
    test_customer_orders || failed=$((failed + 1))
    test_order_details || failed=$((failed + 1))
    
    echo ""
    if [[ $failed -eq 0 ]]; then
        print_success "🎉 All tests passed!"
        return 0
    else
        print_error "❌ $failed test(s) failed"
        return 1
    fi
}

# ==============================================================================
# MAIN EXECUTION
# ==============================================================================

parse_arguments() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            -s|--server)
                SERVER_URL="$2"
                shift 2
                ;;
            -t|--timeout)
                TIMEOUT="$2"
                shift 2
                ;;
            -v|--verbose)
                VERBOSE="true"
                shift
                ;;
            -h|--help)
                show_help
                exit 0
                ;;
            health|capabilities|tools|customer-orders|order-details|all)
                COMMAND="$1"
                shift
                ;;
            *)
                print_error "❌ Unknown option: $1"
                show_help
                exit 1
                ;;
        esac
    done
}

main() {
    local COMMAND=${COMMAND:-all}
    
    # Parse command line arguments
    parse_arguments "$@"
    
    print_info "🧪 Orders MCP Server Testing"
    print_info "Server: $SERVER_URL"
    print_info "Command: $COMMAND"
    print_info "Timeout: ${TIMEOUT}s"
    echo ""
    
    # Check prerequisites
    check_prerequisites
    
    # Run the specified command
    case $COMMAND in
        health)
            wait_for_server && test_health
            ;;
        capabilities)
            wait_for_server && test_mcp_capabilities
            ;;
        tools)
            wait_for_server && test_mcp_tools
            ;;
        customer-orders)
            wait_for_server && test_customer_orders
            ;;
        order-details)
            wait_for_server && test_order_details
            ;;
        all)
            run_all_tests
            ;;
        *)
            print_error "❌ Unknown command: $COMMAND"
            show_help
            exit 1
            ;;
    esac
}

main "$@" 