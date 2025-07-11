#!/bin/bash

# ==============================================================================
# ORDERS MCP SERVER - BUILD SCRIPT
# ==============================================================================
# Development build script for Orders MCP Server
# This script handles clean builds, testing, and packaging

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
# BUILD FUNCTIONS
# ==============================================================================

clean_build() {
    print_info "🧹 Cleaning previous builds..."
    mvn clean
    print_success "✅ Clean completed"
}

compile_only() {
    print_info "🔨 Compiling sources..."
    mvn compile
    print_success "✅ Compilation completed"
}

run_tests() {
    print_info "🧪 Running tests..."
    mvn test
    print_success "✅ Tests completed"
}

package_app() {
    print_info "📦 Packaging application..."
    mvn package
    print_success "✅ Packaging completed"
}

full_build() {
    print_info "🚀 Running full build (clean + compile + test + package)..."
    mvn clean package
    print_success "✅ Full build completed"
}

check_dependencies() {
    print_info "🔍 Checking for dependency updates..."
    mvn versions:display-dependency-updates
}

# ==============================================================================
# MAIN EXECUTION
# ==============================================================================

show_help() {
    echo "Orders MCP Server Build Script"
    echo ""
    echo "Usage: $0 [OPTION]"
    echo ""
    echo "Options:"
    echo "  clean      Clean previous builds"
    echo "  compile    Compile sources only"
    echo "  test       Run tests only"
    echo "  package    Package application"
    echo "  full       Full build (clean + compile + test + package)"
    echo "  check      Check for dependency updates"
    echo "  help       Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 full      # Full build"
    echo "  $0 compile   # Quick compilation check"
    echo "  $0 test      # Run tests only"
}

main() {
    local action=${1:-full}
    
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
    
    print_info "🏗️  Orders MCP Server Build Script"
    print_info "Project: $(basename $(pwd))"
    print_info "Action: $action"
    echo ""
    
    case $action in
        clean)
            clean_build
            ;;
        compile)
            compile_only
            ;;
        test)
            run_tests
            ;;
        package)
            package_app
            ;;
        full)
            full_build
            ;;
        check)
            check_dependencies
            ;;
        help|--help|-h)
            show_help
            ;;
        *)
            print_error "❌ Unknown action: $action"
            show_help
            exit 1
            ;;
    esac
    
    print_success "🎉 Build script completed successfully!"
}

main "$@" 