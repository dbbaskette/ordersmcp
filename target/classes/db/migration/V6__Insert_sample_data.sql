-- Insert sample customers
INSERT INTO customers (email, first_name, last_name, phone) VALUES
('john.doe@example.com', 'John', 'Doe', '+1-555-0101'),
('jane.smith@example.com', 'Jane', 'Smith', '+1-555-0102'),
('bob.wilson@example.com', 'Bob', 'Wilson', '+1-555-0103'),
('alice.johnson@example.com', 'Alice', 'Johnson', '+1-555-0104'),
('charlie.brown@example.com', 'Charlie', 'Brown', '+1-555-0105');

-- Insert sample addresses
INSERT INTO addresses (customer_id, address_type, first_name, last_name, company, address_line1, address_line2, city, state, postal_code, country, phone, is_default) VALUES
(1, 'BOTH', 'John', 'Doe', 'Tech Corp', '123 Main St', 'Suite 100', 'New York', 'NY', '10001', 'USA', '+1-555-0101', TRUE),
(2, 'BOTH', 'Jane', 'Smith', 'Design Studio', '456 Oak Ave', NULL, 'Los Angeles', 'CA', '90210', 'USA', '+1-555-0102', TRUE),
(3, 'BOTH', 'Bob', 'Wilson', 'Consulting LLC', '789 Pine Rd', 'Apt 5B', 'Chicago', 'IL', '60601', 'USA', '+1-555-0103', TRUE),
(4, 'BOTH', 'Alice', 'Johnson', 'Marketing Inc', '321 Elm St', NULL, 'Houston', 'TX', '77001', 'USA', '+1-555-0104', TRUE),
(5, 'BOTH', 'Charlie', 'Brown', 'Freelance', '654 Maple Dr', 'Unit 3', 'Phoenix', 'AZ', '85001', 'USA', '+1-555-0105', TRUE);

-- Insert sample products
INSERT INTO products (sku, name, description, price, sale_price, stock_quantity, is_active) VALUES
('WH-001', 'Wireless Bluetooth Headphones', 'Premium noise-cancelling wireless headphones with 30-hour battery life', 149.99, 129.99, 50, TRUE),
('CC-002', 'USB-C Charging Cable', 'High-speed USB-C to USB-C cable, 6ft length', 19.99, 15.99, 200, TRUE),
('KB-003', 'Mechanical Gaming Keyboard', 'RGB mechanical keyboard with Cherry MX switches', 89.99, 79.99, 25, TRUE),
('MS-004', 'Wireless Gaming Mouse', 'High-precision wireless gaming mouse with 25K DPI sensor', 59.99, 49.99, 75, TRUE),
('MN-005', '4K Gaming Monitor', '27-inch 4K gaming monitor with 144Hz refresh rate', 399.99, 349.99, 10, TRUE),
('SP-006', 'Bluetooth Speaker', 'Portable waterproof Bluetooth speaker with 20-hour battery', 79.99, 69.99, 30, TRUE),
('TB-007', 'External SSD 1TB', 'Ultra-fast external SSD with USB 3.2 Gen 2', 129.99, 109.99, 40, TRUE),
('HD-008', 'Wireless Earbuds', 'True wireless earbuds with active noise cancellation', 199.99, 179.99, 60, TRUE);

-- Insert sample orders
INSERT INTO orders (customer_id, order_number, order_date, status, subtotal, tax_amount, shipping_amount, total_amount, payment_method, payment_status) VALUES
(1, 'ORD-2024-001234', '2024-01-15 10:30:00', 'SHIPPED', 299.98, 24.00, 9.99, 333.97, 'CREDIT_CARD', 'PAID'),
(2, 'ORD-2024-001235', '2024-01-16 14:20:00', 'DELIVERED', 159.98, 12.80, 0.00, 172.78, 'PAYPAL', 'PAID'),
(3, 'ORD-2024-001236', '2024-01-17 09:15:00', 'PROCESSING', 449.97, 36.00, 19.99, 505.96, 'CREDIT_CARD', 'PAID'),
(4, 'ORD-2024-001237', '2024-01-18 16:45:00', 'PENDING', 79.99, 6.40, 0.00, 86.39, 'BANK_TRANSFER', 'PENDING'),
(5, 'ORD-2024-001238', '2024-01-19 11:30:00', 'CONFIRMED', 329.98, 26.40, 9.99, 366.37, 'CREDIT_CARD', 'PAID');

-- Insert sample order details
INSERT INTO order_details (order_id, product_id, product_name, product_sku, product_description, quantity, unit_price, discount_amount, line_total) VALUES
-- Order 1: John Doe - Headphones and Cable
(1, 1, 'Wireless Bluetooth Headphones', 'WH-001', 'Premium noise-cancelling wireless headphones with 30-hour battery life', 2, 149.99, 0.00, 299.98),

-- Order 2: Jane Smith - Keyboard and Mouse
(2, 3, 'Mechanical Gaming Keyboard', 'KB-003', 'RGB mechanical keyboard with Cherry MX switches', 1, 89.99, 10.00, 79.99),
(2, 4, 'Wireless Gaming Mouse', 'MS-004', 'High-precision wireless gaming mouse with 25K DPI sensor', 1, 59.99, 10.00, 49.99),

-- Order 3: Bob Wilson - Monitor and SSD
(3, 5, '4K Gaming Monitor', 'MN-005', '27-inch 4K gaming monitor with 144Hz refresh rate', 1, 399.99, 50.00, 349.99),
(3, 7, 'External SSD 1TB', 'TB-007', 'Ultra-fast external SSD with USB 3.2 Gen 2', 1, 129.99, 20.00, 109.99),

-- Order 4: Alice Johnson - Speaker
(4, 6, 'Bluetooth Speaker', 'SP-006', 'Portable waterproof Bluetooth speaker with 20-hour battery', 1, 79.99, 10.00, 69.99),

-- Order 5: Charlie Brown - Earbuds and Cable
(5, 8, 'Wireless Earbuds', 'HD-008', 'True wireless earbuds with active noise cancellation', 1, 199.99, 20.00, 179.99),
(5, 2, 'USB-C Charging Cable', 'CC-002', 'High-speed USB-C to USB-C cable, 6ft length', 1, 19.99, 0.00, 19.99); 