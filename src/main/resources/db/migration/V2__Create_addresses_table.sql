-- Create addresses table
CREATE TABLE addresses (
    address_id BIGINT PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    address_type VARCHAR(20) NOT NULL CHECK (address_type IN ('SHIPPING', 'BILLING', 'BOTH')),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    company VARCHAR(255),
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    is_default BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create index for customer lookups
CREATE INDEX idx_addresses_customer_id ON addresses(customer_id);

-- Create index for address type
CREATE INDEX idx_addresses_type ON addresses(address_type);

-- Create index for default addresses
CREATE INDEX idx_addresses_default ON addresses(customer_id, is_default); 