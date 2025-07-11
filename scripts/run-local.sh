#!/bin/bash

# ==============================================================================
# ORDERS MCP SERVER - LOCAL RUN SCRIPT
# ==============================================================================
# Run the Orders MCP Server locally with H2 database for development/testing

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
SPRING_PROFILE="local"
SERVER_PORT="8080"
DEBUG_MODE="false"
CLEAN_BUILD="false"

# ==============================================================================
# FUNCTIONS
# ==============================================================================

show_help() {
    echo "Orders MCP Server Local Run Script"
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -p, --port PORT      Server port (default: 8080)"
    echo "  -d, --debug          Enable debug mode"
    echo "  -c, --clean          Clean build before running"
    echo "  -h, --help           Show this help message"
    echo ""
    echo "Note: The script will automatically kill any process using the specified port."
    echo ""
    echo "Examples:"
    echo "  $0                   # Run with defaults, auto-kill port 8080 conflicts"
    echo "  $0 -p 8081          # Run on port 8081, auto-kill port 8081 conflicts"
    echo "  $0 -d               # Run with debug mode"
    echo "  $0 -c -d            # Clean build + debug mode"
}

check_prerequisites() {
    print_info "🔍 Checking prerequisites..."
    
    # Check if we're in the right directory
    if [[ ! -f "pom.xml" ]]; then
        print_error "❌ No pom.xml found. Are you in the project root?"
        exit 1
    fi
    
    # Check if Maven is available
    if ! command -v mvn &> /dev/null; then
        print_error "❌ Maven not found. Please install Maven."
        exit 1
    fi
    
    # Check if Java is available
    if ! command -v java &> /dev/null; then
        print_error "❌ Java not found. Please install Java 21."
        exit 1
    fi
    
    print_success "✅ Prerequisites check passed"
}

check_and_free_port() {
    print_info "🔍 Checking if port $SERVER_PORT is available..."
    
    # Check if port is in use
    local pid=$(lsof -ti:$SERVER_PORT 2>/dev/null)
    
    if [[ -n "$pid" ]]; then
        print_warning "⚠️  Port $SERVER_PORT is in use by process $pid"
        print_info "🔪 Killing process $pid to free port $SERVER_PORT..."
        
        # Try graceful shutdown first
        if kill "$pid" 2>/dev/null; then
            print_info "Sent SIGTERM to process $pid, waiting 5 seconds..."
            sleep 5
            
            # Check if process is still running
            if kill -0 "$pid" 2>/dev/null; then
                print_warning "Process still running, forcing shutdown..."
                kill -9 "$pid" 2>/dev/null
            fi
        else
            print_warning "Failed to send SIGTERM, forcing shutdown..."
            kill -9 "$pid" 2>/dev/null
        fi
        
        # Wait a moment for port to be released
        sleep 2
        
        # Verify port is now free
        local check_pid=$(lsof -ti:$SERVER_PORT 2>/dev/null)
        if [[ -n "$check_pid" ]]; then
            print_error "❌ Failed to free port $SERVER_PORT (still in use by $check_pid)"
            exit 1
        else
            print_success "✅ Port $SERVER_PORT is now available"
        fi
    else
        print_success "✅ Port $SERVER_PORT is available"
    fi
}

clean_and_build() {
    if [[ "$CLEAN_BUILD" == "true" ]]; then
        print_info "🧹 Cleaning and building..."
        mvn clean package -DskipTests
        print_success "✅ Build completed"
    else
        print_info "📦 Ensuring application is built..."
        if [[ ! -f "target/"*.jar ]]; then
            print_warning "⚠️  No JAR file found. Building..."
            mvn package -DskipTests
        fi
        print_success "✅ Application ready"
    fi
}

show_startup_info() {
    print_info "🚀 Orders MCP Server Starting..."
    print_info "Profile: $SPRING_PROFILE"
    print_info "Port: $SERVER_PORT"
    print_info "Debug: $DEBUG_MODE"
    print_info "Database: H2 (in-memory)"
    echo ""
    print_info "🔗 Application URLs:"
    print_info "   Main: http://localhost:$SERVER_PORT"
    print_info "   Health: http://localhost:$SERVER_PORT/actuator/health"
    print_info "   H2 Console: http://localhost:$SERVER_PORT/h2-console"
    print_info "   MCP Server: http://localhost:$SERVER_PORT/mcp"
    echo ""
    print_info "💾 Database Connection (H2 Console):"
    print_info "   JDBC URL: jdbc:h2:mem:ordersdb"
    print_info "   User: sa"
    print_info "   Password: (leave empty)"
    echo ""
    print_warning "⚠️  Press Ctrl+C to stop the server"
    echo ""
}

run_application() {
    local java_opts=""
    
    if [[ "$DEBUG_MODE" == "true" ]]; then
        java_opts="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005"
        print_info "🐛 Debug mode enabled - attach debugger to port 5005"
    fi
    
    # Set environment variables for Spring Boot
    export SPRING_PROFILES_ACTIVE="$SPRING_PROFILE"
    export SERVER_PORT="$SERVER_PORT"
    
    # Run the application
    mvn spring-boot:run \
        -Dspring-boot.run.jvmArguments="$java_opts" \
        -Dspring-boot.run.arguments="--server.port=$SERVER_PORT --spring.profiles.active=$SPRING_PROFILE"
}

# ==============================================================================
# MAIN EXECUTION
# ==============================================================================

parse_arguments() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            -p|--port)
                SERVER_PORT="$2"
                shift 2
                ;;
            -d|--debug)
                DEBUG_MODE="true"
                shift
                ;;
            -c|--clean)
                CLEAN_BUILD="true"
                shift
                ;;
            -h|--help)
                show_help
                exit 0
                ;;
            *)
                print_error "❌ Unknown option: $1"
                show_help
                exit 1
                ;;
        esac
    done
}

cleanup() {
    print_info ""
    print_info "🛑 Shutting down Orders MCP Server..."
    print_success "✅ Server stopped"
}

main() {
    # Set up cleanup trap
    trap cleanup EXIT
    
    # Parse command line arguments
    parse_arguments "$@"
    
    print_info "🏗️  Orders MCP Server Local Development"
    print_info "Project: $(basename $(pwd))"
    echo ""
    
    # Check prerequisites
    check_prerequisites
    
    # Check and free port if needed
    check_and_free_port
    
    # Build if needed
    clean_and_build
    
    # Show startup information
    show_startup_info
    
    # Run the application
    run_application
}

main "$@" 