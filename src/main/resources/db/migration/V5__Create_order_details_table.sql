-- Create order_details table
CREATE TABLE order_details (
    detail_id BIGINT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    product_sku VARCHAR(100) NOT NULL,
    product_description TEXT,
    quantity INTEGER NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    discount_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    line_total DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Create index for order lookups
CREATE INDEX idx_order_details_order_id ON order_details(order_id);

-- Create index for product lookups
CREATE INDEX idx_order_details_product_id ON order_details(product_id);

-- Create index for product SKU lookups
CREATE INDEX idx_order_details_product_sku ON order_details(product_sku); 