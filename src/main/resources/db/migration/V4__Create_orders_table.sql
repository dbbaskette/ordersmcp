-- Create orders table
CREATE TABLE orders (
    order_id BIGINT PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    order_number VARCHAR(50) UNIQUE NOT NULL,
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL CHECK (status IN ('PENDING', 'CONFIRMED', 'PROCESSING', 'SHIPPED', 'DELIVERED', 'CANCELLED')),
    subtotal DECIMAL(10,2) NOT NULL,
    tax_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    shipping_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    total_amount DECIMAL(10,2) NOT NULL,
    shipping_address_id BIGINT,
    billing_address_id BIGINT,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(20) NOT NULL CHECK (payment_status IN ('PENDING', 'PAID', 'FAILED', 'REFUNDED')),
    notes TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (shipping_address_id) REFERENCES addresses(address_id),
    FOREIGN KEY (billing_address_id) REFERENCES addresses(address_id)
);

-- Create index for customer lookups
CREATE INDEX idx_orders_customer_id ON orders(customer_id);

-- Create index for order number lookups
CREATE INDEX idx_orders_order_number ON orders(order_number);

-- Create index for order date queries
CREATE INDEX idx_orders_order_date ON orders(order_date);

-- Create index for status queries
CREATE INDEX idx_orders_status ON orders(status);

-- Create index for payment status queries
CREATE INDEX idx_orders_payment_status ON orders(payment_status);

-- Create composite index for customer and date queries
CREATE INDEX idx_orders_customer_date ON orders(customer_id, order_date); 