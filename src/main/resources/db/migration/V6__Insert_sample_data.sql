-- Insert sample customers (30 customers)
INSERT INTO customers (customer_id, email, first_name, last_name, phone, created_at, updated_at) VALUES
(1, 'john.doe@email.com', 'John', 'Doe', '555-0101', '2023-01-15 10:00:00', '2023-01-15 10:00:00'),
(2, 'jane.smith@email.com', 'Jane', 'Smith', '555-0102', '2023-01-20 11:00:00', '2023-01-20 11:00:00'),
(3, 'bob.johnson@email.com', 'Bob', 'Johnson', '555-0103', '2023-02-01 12:00:00', '2023-02-01 12:00:00'),
(4, 'alice.brown@email.com', 'Alice', 'Brown', '555-0104', '2023-02-10 13:00:00', '2023-02-10 13:00:00'),
(5, 'charlie.davis@email.com', 'Charlie', 'Davis', '555-0105', '2023-02-15 14:00:00', '2023-02-15 14:00:00'),
(6, 'diana.wilson@email.com', 'Diana', 'Wilson', '555-0106', '2023-03-01 15:00:00', '2023-03-01 15:00:00'),
(7, 'frank.miller@email.com', 'Frank', 'Miller', '555-0107', '2023-03-10 16:00:00', '2023-03-10 16:00:00'),
(8, 'grace.taylor@email.com', 'Grace', 'Taylor', '555-0108', '2023-03-15 17:00:00', '2023-03-15 17:00:00'),
(9, 'henry.anderson@email.com', 'Henry', 'Anderson', '555-0109', '2023-04-01 18:00:00', '2023-04-01 18:00:00'),
(10, 'ivy.thomas@email.com', 'Ivy', 'Thomas', '555-0110', '2023-04-10 19:00:00', '2023-04-10 19:00:00'),
(11, 'jack.jackson@email.com', 'Jack', 'Jackson', '555-0111', '2023-04-15 20:00:00', '2023-04-15 20:00:00'),
(12, 'kelly.white@email.com', 'Kelly', 'White', '555-0112', '2023-05-01 21:00:00', '2023-05-01 21:00:00'),
(13, 'leo.harris@email.com', 'Leo', 'Harris', '555-0113', '2023-05-10 22:00:00', '2023-05-10 22:00:00'),
(14, 'mia.martin@email.com', 'Mia', 'Martin', '555-0114', '2023-05-15 23:00:00', '2023-05-15 23:00:00'),
(15, 'noah.garcia@email.com', 'Noah', 'Garcia', '555-0115', '2023-06-01 10:00:00', '2023-06-01 10:00:00'),
(16, 'olivia.rodriguez@email.com', 'Olivia', 'Rodriguez', '555-0116', '2023-06-10 11:00:00', '2023-06-10 11:00:00'),
(17, 'paul.lewis@email.com', 'Paul', 'Lewis', '555-0117', '2023-06-15 12:00:00', '2023-06-15 12:00:00'),
(18, 'quinn.lee@email.com', 'Quinn', 'Lee', '555-0118', '2023-07-01 13:00:00', '2023-07-01 13:00:00'),
(19, 'ruby.walker@email.com', 'Ruby', 'Walker', '555-0119', '2023-07-10 14:00:00', '2023-07-10 14:00:00'),
(20, 'sam.hall@email.com', 'Sam', 'Hall', '555-0120', '2023-07-15 15:00:00', '2023-07-15 15:00:00'),
(21, 'tina.allen@email.com', 'Tina', 'Allen', '555-0121', '2023-08-01 16:00:00', '2023-08-01 16:00:00'),
(22, 'uma.young@email.com', 'Uma', 'Young', '555-0122', '2023-08-10 17:00:00', '2023-08-10 17:00:00'),
(23, 'victor.hernandez@email.com', 'Victor', 'Hernandez', '555-0123', '2023-08-15 18:00:00', '2023-08-15 18:00:00'),
(24, 'wendy.king@email.com', 'Wendy', 'King', '555-0124', '2023-09-01 19:00:00', '2023-09-01 19:00:00'),
(25, 'xavier.wright@email.com', 'Xavier', 'Wright', '555-0125', '2023-09-10 20:00:00', '2023-09-10 20:00:00'),
(26, 'yara.lopez@email.com', 'Yara', 'Lopez', '555-0126', '2023-09-15 21:00:00', '2023-09-15 21:00:00'),
(27, 'zoe.hill@email.com', 'Zoe', 'Hill', '555-0127', '2023-10-01 22:00:00', '2023-10-01 22:00:00'),
(28, 'adam.scott@email.com', 'Adam', 'Scott', '555-0128', '2023-10-10 23:00:00', '2023-10-10 23:00:00'),
(29, 'bella.green@email.com', 'Bella', 'Green', '555-0129', '2023-10-15 10:00:00', '2023-10-15 10:00:00'),
(30, 'carlos.adams@email.com', 'Carlos', 'Adams', '555-0130', '2023-11-01 11:00:00', '2023-11-01 11:00:00');

-- Insert sample addresses
INSERT INTO addresses (address_id, customer_id, address_type, first_name, last_name, company, address_line1, address_line2, city, state, postal_code, country, phone, is_default, created_at, updated_at) VALUES
(1, 1, 'BOTH', 'John', 'Doe', NULL, '123 Main St', 'Apt 4B', 'New York', 'NY', '10001', 'USA', '555-0101', TRUE, '2023-01-15 10:00:00', '2023-01-15 10:00:00'),
(2, 2, 'BOTH', 'Jane', 'Smith', NULL, '456 Oak Ave', NULL, 'Los Angeles', 'CA', '90210', 'USA', '555-0102', TRUE, '2023-01-20 11:00:00', '2023-01-20 11:00:00'),
(3, 3, 'BOTH', 'Bob', 'Johnson', NULL, '789 Pine Rd', NULL, 'Chicago', 'IL', '60601', 'USA', '555-0103', TRUE, '2023-02-01 12:00:00', '2023-02-01 12:00:00'),
(4, 4, 'BOTH', 'Alice', 'Brown', NULL, '321 Elm St', NULL, 'Houston', 'TX', '77001', 'USA', '555-0104', TRUE, '2023-02-10 13:00:00', '2023-02-10 13:00:00'),
(5, 5, 'BOTH', 'Charlie', 'Davis', NULL, '654 Maple Ave', NULL, 'Phoenix', 'AZ', '85001', 'USA', '555-0105', TRUE, '2023-02-15 14:00:00', '2023-02-15 14:00:00');

-- Insert sample products
INSERT INTO products (product_id, sku, name, description, category_id, price, sale_price, stock_quantity, is_active, created_at, updated_at) VALUES
(1, 'LAP-001', 'Gaming Laptop', 'High-performance gaming laptop with RTX graphics', 1, 1299.99, 1199.99, 50, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 'MON-001', '4K Monitor', '27-inch 4K UHD monitor with USB-C', 1, 399.99, NULL, 75, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 'KEY-001', 'Mechanical Keyboard', 'RGB mechanical keyboard with blue switches', 1, 129.99, 99.99, 100, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 'MOU-001', 'Gaming Mouse', 'Wireless gaming mouse with RGB lighting', 1, 79.99, NULL, 120, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(5, 'HEAD-001', 'Noise-Cancelling Headphones', 'Premium wireless headphones with ANC', 2, 299.99, 249.99, 60, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 'PHONE-001', 'Smartphone', 'Latest flagship smartphone with 5G', 2, 899.99, NULL, 40, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 'TAB-001', 'Tablet', '10-inch tablet with stylus support', 2, 499.99, 449.99, 80, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 'WATCH-001', 'Smart Watch', 'Fitness tracking smartwatch with GPS', 2, 199.99, NULL, 90, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 'SPEAK-001', 'Bluetooth Speaker', 'Portable waterproof Bluetooth speaker', 2, 59.99, 49.99, 150, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 'CAM-001', 'Webcam', '4K webcam with auto-focus', 1, 149.99, NULL, 70, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00');

-- Insert sample orders (varying numbers per customer)
INSERT INTO orders (order_id, customer_id, order_number, order_date, status, subtotal, tax_amount, shipping_amount, total_amount, shipping_address_id, billing_address_id, payment_method, payment_status, notes, created_at, updated_at) VALUES
-- Customer 1: 3 orders
(1, 1, 'ORD-2023-001', '2023-02-01 10:00:00', 'DELIVERED', 1299.99, 104.00, 15.99, 1419.98, 1, 1, 'CREDIT_CARD', 'PAID', NULL, '2023-02-01 10:00:00', '2023-02-01 10:00:00'),
(2, 1, 'ORD-2023-045', '2023-05-15 14:30:00', 'DELIVERED', 399.99, 32.00, 12.99, 444.98, 1, 1, 'CREDIT_CARD', 'PAID', NULL, '2023-05-15 14:30:00', '2023-05-15 14:30:00'),
(3, 1, 'ORD-2023-089', '2023-08-22 16:45:00', 'SHIPPED', 129.99, 10.40, 8.99, 149.38, 1, 1, 'PAYPAL', 'PAID', NULL, '2023-08-22 16:45:00', '2023-08-22 16:45:00'),
-- Customer 2: 2 orders
(4, 2, 'ORD-2023-012', '2023-03-10 11:00:00', 'DELIVERED', 959.98, 76.80, 19.99, 1056.77, 2, 2, 'CREDIT_CARD', 'PAID', NULL, '2023-03-10 11:00:00', '2023-03-10 11:00:00'),
(5, 2, 'ORD-2023-067', '2023-07-05 13:20:00', 'PROCESSING', 299.99, 24.00, 9.99, 333.98, 2, 2, 'BANK_TRANSFER', 'PENDING', NULL, '2023-07-05 13:20:00', '2023-07-05 13:20:00'),
-- Customer 3: 1 order
(6, 3, 'ORD-2023-034', '2023-04-18 15:30:00', 'DELIVERED', 579.98, 46.40, 14.99, 641.37, 3, 3, 'CREDIT_CARD', 'PAID', NULL, '2023-04-18 15:30:00', '2023-04-18 15:30:00'),
-- Customer 4: 4 orders
(7, 4, 'ORD-2023-023', '2023-03-25 09:15:00', 'DELIVERED', 199.99, 16.00, 7.99, 223.98, 4, 4, 'PAYPAL', 'PAID', NULL, '2023-03-25 09:15:00', '2023-03-25 09:15:00'),
(8, 4, 'ORD-2023-056', '2023-06-12 12:45:00', 'DELIVERED', 899.99, 72.00, 17.99, 989.98, 4, 4, 'CREDIT_CARD', 'PAID', NULL, '2023-06-12 12:45:00', '2023-06-12 12:45:00'),
(9, 4, 'ORD-2023-078', '2023-07-28 14:20:00', 'CANCELLED', 149.99, 12.00, 6.99, 168.98, 4, 4, 'CREDIT_CARD', 'REFUNDED', 'Customer requested cancellation', '2023-07-28 14:20:00', '2023-07-28 14:20:00'),
(10, 4, 'ORD-2023-101', '2023-09-14 10:30:00', 'DELIVERED', 499.99, 40.00, 13.99, 553.98, 4, 4, 'PAYPAL', 'PAID', NULL, '2023-09-14 10:30:00', '2023-09-14 10:30:00'),
-- Customer 5: 2 orders
(11, 5, 'ORD-2023-038', '2023-04-22 16:00:00', 'DELIVERED', 209.98, 16.80, 8.99, 235.77, 5, 5, 'CREDIT_CARD', 'PAID', NULL, '2023-04-22 16:00:00', '2023-04-22 16:00:00'),
(12, 5, 'ORD-2023-092', '2023-08-30 11:45:00', 'SHIPPED', 59.99, 4.80, 5.99, 70.78, 5, 5, 'BANK_TRANSFER', 'PAID', NULL, '2023-08-30 11:45:00', '2023-08-30 11:45:00');

-- Insert sample order details
INSERT INTO order_details (detail_id, order_id, product_id, product_name, product_sku, product_description, quantity, unit_price, discount_amount, line_total, created_at) VALUES
-- Order 1 details
(1, 1, 1, 'Gaming Laptop', 'LAP-001', 'High-performance gaming laptop with RTX graphics', 1, 1299.99, 0.00, 1299.99, '2023-02-01 10:00:00'),
-- Order 2 details
(2, 2, 2, '4K Monitor', 'MON-001', '27-inch 4K UHD monitor with USB-C', 1, 399.99, 0.00, 399.99, '2023-05-15 14:30:00'),
-- Order 3 details
(3, 3, 3, 'Mechanical Keyboard', 'KEY-001', 'RGB mechanical keyboard with blue switches', 1, 129.99, 0.00, 129.99, '2023-08-22 16:45:00'),
-- Order 4 details (multiple items)
(4, 4, 4, 'Gaming Mouse', 'MOU-001', 'Wireless gaming mouse with RGB lighting', 2, 79.99, 0.00, 159.98, '2023-03-10 11:00:00'),
(5, 4, 8, 'Smart Watch', 'WATCH-001', 'Fitness tracking smartwatch with GPS', 4, 199.99, 0.00, 799.96, '2023-03-10 11:00:00'),
-- Order 5 details
(6, 5, 5, 'Noise-Cancelling Headphones', 'HEAD-001', 'Premium wireless headphones with ANC', 1, 299.99, 0.00, 299.99, '2023-07-05 13:20:00'),
-- Order 6 details (multiple items)
(7, 6, 7, 'Tablet', 'TAB-001', '10-inch tablet with stylus support', 1, 499.99, 50.00, 449.99, '2023-04-18 15:30:00'),
(8, 6, 3, 'Mechanical Keyboard', 'KEY-001', 'RGB mechanical keyboard with blue switches', 1, 129.99, 0.00, 129.99, '2023-04-18 15:30:00'),
-- Order 7 details
(9, 7, 8, 'Smart Watch', 'WATCH-001', 'Fitness tracking smartwatch with GPS', 1, 199.99, 0.00, 199.99, '2023-03-25 09:15:00'),
-- Order 8 details
(10, 8, 6, 'Smartphone', 'PHONE-001', 'Latest flagship smartphone with 5G', 1, 899.99, 0.00, 899.99, '2023-06-12 12:45:00'),
-- Order 9 details
(11, 9, 10, 'Webcam', 'CAM-001', '4K webcam with auto-focus', 1, 149.99, 0.00, 149.99, '2023-07-28 14:20:00'),
-- Order 10 details
(12, 10, 7, 'Tablet', 'TAB-001', '10-inch tablet with stylus support', 1, 499.99, 0.00, 499.99, '2023-09-14 10:30:00'),
-- Order 11 details (multiple items)
(13, 11, 9, 'Bluetooth Speaker', 'SPEAK-001', 'Portable waterproof Bluetooth speaker', 2, 59.99, 10.00, 109.98, '2023-04-22 16:00:00'),
(14, 11, 4, 'Gaming Mouse', 'MOU-001', 'Wireless gaming mouse with RGB lighting', 1, 79.99, 0.00, 79.99, '2023-04-22 16:00:00'),
-- Order 12 details
(15, 12, 9, 'Bluetooth Speaker', 'SPEAK-001', 'Portable waterproof Bluetooth speaker', 1, 59.99, 0.00, 59.99, '2023-08-30 11:45:00'); 