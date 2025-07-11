-- Create products table
CREATE TABLE products (
    product_id BIGINT PRIMARY KEY,
    sku VARCHAR(100) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    category_id BIGINT,
    price DECIMAL(10,2) NOT NULL,
    sale_price DECIMAL(10,2),
    stock_quantity INTEGER NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create index for SKU lookups
CREATE INDEX idx_products_sku ON products(sku);

-- Create index for active products
CREATE INDEX idx_products_active ON products(is_active);

-- Create index for category lookups
CREATE INDEX idx_products_category ON products(category_id);

-- Create index for price range queries
CREATE INDEX idx_products_price ON products(price); 