-- Insert sample customers (50 customers with 5-digit IDs and diverse email domains)
INSERT INTO customers (customer_id, email, first_name, last_name, phone, created_at, updated_at) VALUES
(12345, 'mike.rodriguez@gmail.com', 'Mike', 'Rodriguez', '555-0101', '2023-01-15 10:00:00', '2023-01-15 10:00:00'),
(23456, 'sarah.chen@yahoo.com', 'Sarah', 'Chen', '555-0102', '2023-01-20 11:00:00', '2023-01-20 11:00:00'),
(34567, 'david.kim@outlook.com', 'David', 'Kim', '555-0103', '2023-02-01 12:00:00', '2023-02-01 12:00:00'),
(45678, 'emily.patel@hotmail.com', 'Emily', 'Patel', '555-0104', '2023-02-10 13:00:00', '2023-02-10 13:00:00'),
(56789, 'james.wilson@icloud.com', 'James', 'Wilson', '555-0105', '2023-02-15 14:00:00', '2023-02-15 14:00:00'),
(67890, 'lisa.garcia@protonmail.com', 'Lisa', 'Garcia', '555-0106', '2023-03-01 15:00:00', '2023-03-01 15:00:00'),
(78901, 'robert.thomas@live.com', 'Robert', 'Thomas', '555-0107', '2023-03-10 16:00:00', '2023-03-10 16:00:00'),
(89012, 'anna.lee@aol.com', 'Anna', 'Lee', '555-0108', '2023-03-15 17:00:00', '2023-03-15 17:00:00'),
(90123, 'chris.martinez@me.com', 'Chris', 'Martinez', '555-0109', '2023-04-01 18:00:00', '2023-04-01 18:00:00'),
(11234, 'jessica.brown@fastmail.com', 'Jessica', 'Brown', '555-0110', '2023-04-10 19:00:00', '2023-04-10 19:00:00'),
(22345, 'michael.davis@tutanota.com', 'Michael', 'Davis', '555-0111', '2023-04-15 20:00:00', '2023-04-15 20:00:00'),
(33456, 'amanda.miller@zoho.com', 'Amanda', 'Miller', '555-0112', '2023-05-01 21:00:00', '2023-05-01 21:00:00'),
(44567, 'daniel.anderson@yandex.com', 'Daniel', 'Anderson', '555-0113', '2023-05-10 22:00:00', '2023-05-10 22:00:00'),
(55678, 'rachel.taylor@mail.com', 'Rachel', 'Taylor', '555-0114', '2023-05-15 23:00:00', '2023-05-15 23:00:00'),
(66789, 'kevin.jackson@rocketmail.com', 'Kevin', 'Jackson', '555-0115', '2023-06-01 10:00:00', '2023-06-01 10:00:00'),
(77890, 'stephanie.white@rediffmail.com', 'Stephanie', 'White', '555-0116', '2023-06-10 11:00:00', '2023-06-10 11:00:00'),
(88901, 'ryan.harris@inbox.com', 'Ryan', 'Harris', '555-0117', '2023-06-15 12:00:00', '2023-06-15 12:00:00'),
(99012, 'nicole.martin@hushmail.com', 'Nicole', 'Martin', '555-0118', '2023-07-01 13:00:00', '2023-07-01 13:00:00'),
(11123, 'brandon.garcia@dispostable.com', 'Brandon', 'Garcia', '555-0119', '2023-07-10 14:00:00', '2023-07-10 14:00:00'),
(22234, 'ashley.rodriguez@guerrillamail.com', 'Ashley', 'Rodriguez', '555-0120', '2023-07-15 15:00:00', '2023-07-15 15:00:00'),
(33345, 'tyler.lewis@10minutemail.com', 'Tyler', 'Lewis', '555-0121', '2023-08-01 16:00:00', '2023-08-01 16:00:00'),
(44456, 'samantha.lee@mailinator.com', 'Samantha', 'Lee', '555-0122', '2023-08-10 17:00:00', '2023-08-10 17:00:00'),
(55567, 'jordan.walker@tempmail.org', 'Jordan', 'Walker', '555-0123', '2023-08-15 18:00:00', '2023-08-15 18:00:00'),
(66678, 'lauren.hall@sharklasers.com', 'Lauren', 'Hall', '555-0124', '2023-09-01 19:00:00', '2023-09-01 19:00:00'),
(77789, 'alex.allen@mailnesia.com', 'Alex', 'Allen', '555-0125', '2023-09-10 20:00:00', '2023-09-10 20:00:00'),
(88890, 'hannah.young@yopmail.com', 'Hannah', 'Young', '555-0126', '2023-09-15 21:00:00', '2023-09-15 21:00:00'),
(99901, 'cody.hernandez@spam4.me', 'Cody', 'Hernandez', '555-0127', '2023-10-01 22:00:00', '2023-10-01 22:00:00'),
(11012, 'brittany.king@maildrop.cc', 'Brittany', 'King', '555-0128', '2023-10-10 23:00:00', '2023-10-10 23:00:00'),
(22123, 'eric.wright@getairmail.com', 'Eric', 'Wright', '555-0129', '2023-10-15 10:00:00', '2023-10-15 10:00:00'),
(33234, 'kayla.lopez@mailcatch.com', 'Kayla', 'Lopez', '555-0130', '2023-11-01 11:00:00', '2023-11-01 11:00:00'),
(44345, 'marcus.hill@mailnull.com', 'Marcus', 'Hill', '555-0131', '2023-11-05 12:00:00', '2023-11-05 12:00:00'),
(55456, 'taylor.scott@mailinator.net', 'Taylor', 'Scott', '555-0132', '2023-11-10 13:00:00', '2023-11-10 13:00:00'),
(66567, 'madison.green@mailinator.org', 'Madison', 'Green', '555-0133', '2023-11-15 14:00:00', '2023-11-15 14:00:00'),
(77678, 'corey.adams@mailinator.com', 'Corey', 'Adams', '555-0134', '2023-11-20 15:00:00', '2023-11-20 15:00:00'),
(88789, 'alexis.baker@mailinator.net', 'Alexis', 'Baker', '555-0135', '2023-11-25 16:00:00', '2023-11-25 16:00:00'),
(99890, 'dylan.gonzalez@mailinator.org', 'Dylan', 'Gonzalez', '555-0136', '2023-12-01 17:00:00', '2023-12-01 17:00:00'),
(10901, 'sydney.nelson@mailinator.com', 'Sydney', 'Nelson', '555-0137', '2023-12-05 18:00:00', '2023-12-05 18:00:00'),
(22012, 'trevor.carter@mailinator.net', 'Trevor', 'Carter', '555-0138', '2023-12-10 19:00:00', '2023-12-10 19:00:00'),
(33123, 'morgan.mitchell@mailinator.org', 'Morgan', 'Mitchell', '555-0139', '2023-12-15 20:00:00', '2023-12-15 20:00:00'),
(44234, 'casey.perez@mailinator.com', 'Casey', 'Perez', '555-0140', '2023-12-20 21:00:00', '2023-12-20 21:00:00'),
(55345, 'riley.roberts@mailinator.net', 'Riley', 'Roberts', '555-0141', '2023-12-25 22:00:00', '2023-12-25 22:00:00'),
(66456, 'quinn.turner@mailinator.org', 'Quinn', 'Turner', '555-0142', '2023-12-30 23:00:00', '2023-12-30 23:00:00'),
(77567, 'avery.phillips@mailinator.com', 'Avery', 'Phillips', '555-0143', '2024-01-05 10:00:00', '2024-01-05 10:00:00'),
(88678, 'blake.campbell@mailinator.net', 'Blake', 'Campbell', '555-0144', '2024-01-10 11:00:00', '2024-01-10 11:00:00'),
(99789, 'parker.parker@mailinator.org', 'Parker', 'Parker', '555-0145', '2024-01-15 12:00:00', '2024-01-15 12:00:00'),
(10890, 'reese.evans@mailinator.com', 'Reese', 'Evans', '555-0146', '2024-01-20 13:00:00', '2024-01-20 13:00:00'),
(21901, 'drew.edwards@mailinator.net', 'Drew', 'Edwards', '555-0147', '2024-01-25 14:00:00', '2024-01-25 14:00:00'),
(33012, 'emery.collins@mailinator.org', 'Emery', 'Collins', '555-0148', '2024-01-30 15:00:00', '2024-01-30 15:00:00'),
(44123, 'finley.stewart@mailinator.com', 'Finley', 'Stewart', '555-0149', '2024-02-05 16:00:00', '2024-02-05 16:00:00'),
(55234, 'sawyer.sanchez@mailinator.net', 'Sawyer', 'Sanchez', '555-0150', '2024-02-10 17:00:00', '2024-02-10 17:00:00');

-- Insert sample addresses (first 10 customers)
INSERT INTO addresses (address_id, customer_id, address_type, first_name, last_name, company, address_line1, address_line2, city, state, postal_code, country, phone, is_default, created_at, updated_at) VALUES
(1, 12345, 'BOTH', 'Mike', 'Rodriguez', NULL, '123 Main St', 'Apt 4B', 'New York', 'NY', '10001', 'USA', '555-0101', TRUE, '2023-01-15 10:00:00', '2023-01-15 10:00:00'),
(2, 23456, 'BOTH', 'Sarah', 'Chen', NULL, '456 Oak Ave', NULL, 'Los Angeles', 'CA', '90210', 'USA', '555-0102', TRUE, '2023-01-20 11:00:00', '2023-01-20 11:00:00'),
(3, 34567, 'BOTH', 'David', 'Kim', NULL, '789 Pine Rd', NULL, 'Chicago', 'IL', '60601', 'USA', '555-0103', TRUE, '2023-02-01 12:00:00', '2023-02-01 12:00:00'),
(4, 45678, 'BOTH', 'Emily', 'Patel', NULL, '321 Elm St', NULL, 'Houston', 'TX', '77001', 'USA', '555-0104', TRUE, '2023-02-10 13:00:00', '2023-02-10 13:00:00'),
(5, 56789, 'BOTH', 'James', 'Wilson', NULL, '654 Maple Ave', NULL, 'Phoenix', 'AZ', '85001', 'USA', '555-0105', TRUE, '2023-02-15 14:00:00', '2023-02-15 14:00:00'),
(6, 67890, 'BOTH', 'Lisa', 'Garcia', NULL, '987 Cedar Ln', 'Unit 2C', 'Miami', 'FL', '33101', 'USA', '555-0106', TRUE, '2023-03-01 15:00:00', '2023-03-01 15:00:00'),
(7, 78901, 'BOTH', 'Robert', 'Thomas', NULL, '147 Birch Dr', NULL, 'Seattle', 'WA', '98101', 'USA', '555-0107', TRUE, '2023-03-10 16:00:00', '2023-03-10 16:00:00'),
(8, 89012, 'BOTH', 'Anna', 'Lee', NULL, '258 Spruce Way', 'Apt 5D', 'Denver', 'CO', '80201', 'USA', '555-0108', TRUE, '2023-03-15 17:00:00', '2023-03-15 17:00:00'),
(9, 90123, 'BOTH', 'Chris', 'Martinez', NULL, '369 Willow St', NULL, 'Austin', 'TX', '73301', 'USA', '555-0109', TRUE, '2023-04-01 18:00:00', '2023-04-01 18:00:00'),
(10, 11234, 'BOTH', 'Jessica', 'Brown', NULL, '741 Aspen Ct', 'Suite 3B', 'Portland', 'OR', '97201', 'USA', '555-0110', TRUE, '2023-04-10 19:00:00', '2023-04-10 19:00:00');

-- Insert sample products (Bicycles and Bicycle Parts)
INSERT INTO products (product_id, sku, name, description, category_id, price, sale_price, stock_quantity, is_active, created_at, updated_at) VALUES
-- Complete Bicycles
(1, 'BIKE-001', 'Trek Domane SL 6', 'Carbon road bike with Shimano Ultegra groupset', 1, 3499.99, 3299.99, 15, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 'BIKE-002', 'Specialized Stumpjumper', 'Full-suspension mountain bike with SRAM GX', 1, 2899.99, NULL, 12, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(3, 'BIKE-003', 'Cannondale Synapse', 'Endurance road bike with disc brakes', 1, 2199.99, 1999.99, 20, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(4, 'BIKE-004', 'Giant Defy Advanced', 'Carbon endurance bike with electronic shifting', 1, 4299.99, NULL, 8, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(5, 'BIKE-005', 'Santa Cruz Hightower', 'Trail mountain bike with carbon frame', 1, 3799.99, 3599.99, 10, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(6, 'BIKE-006', 'Cervélo S5', 'Aero road bike for racing', 1, 5499.99, NULL, 5, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(7, 'BIKE-007', 'Yeti SB130', 'Enduro mountain bike with 130mm travel', 1, 4199.99, 3999.99, 7, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(8, 'BIKE-008', 'Pinarello Dogma F12', 'Professional road racing bike', 1, 8999.99, NULL, 3, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(9, 'BIKE-009', 'Ibis Ripmo', 'All-mountain bike with carbon frame', 1, 3299.99, 3099.99, 14, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(10, 'BIKE-010', 'Scott Addict RC', 'Lightweight climbing bike', 1, 3799.99, NULL, 9, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- Wheels and Tires
(11, 'WHEEL-001', 'Zipp 404 Firecrest', 'Carbon aero wheelset with ceramic bearings', 2, 1899.99, 1699.99, 25, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(12, 'WHEEL-002', 'Enve SES 3.4', 'Carbon climbing wheelset', 2, 2199.99, NULL, 18, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(13, 'WHEEL-003', 'DT Swiss XRC 1200', 'Carbon mountain bike wheelset', 2, 899.99, 799.99, 30, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(14, 'TIRE-001', 'Continental GP5000', 'High-performance road tire, 700x25c', 2, 89.99, 79.99, 100, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(15, 'TIRE-002', 'Michelin Power Cup', 'Tubeless road tire, 700x28c', 2, 94.99, NULL, 85, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(16, 'TIRE-003', 'Maxxis Minion DHF', 'Downhill mountain bike tire, 29x2.5', 2, 79.99, 69.99, 120, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(17, 'TIRE-004', 'Schwalbe Pro One', 'Tubeless road tire, 700x30c', 2, 99.99, NULL, 75, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- Drivetrain Components
(18, 'GROUP-001', 'Shimano Dura-Ace Di2', 'Electronic 12-speed road groupset', 3, 2499.99, 2299.99, 12, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(19, 'GROUP-002', 'SRAM Red eTap AXS', 'Wireless electronic road groupset', 3, 2199.99, NULL, 15, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(20, 'GROUP-003', 'Shimano XTR Di2', 'Electronic mountain bike groupset', 3, 1899.99, 1699.99, 20, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(21, 'CASS-001', 'Shimano CS-R9100', '11-speed cassette, 11-30T', 3, 299.99, NULL, 45, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(22, 'CASS-002', 'SRAM XG-1299', '12-speed cassette, 10-33T', 3, 349.99, 329.99, 38, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(23, 'CHAIN-001', 'Shimano HG-901', '11-speed chain with quick link', 3, 49.99, 44.99, 200, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(24, 'CHAIN-002', 'SRAM PC-1170', '12-speed chain with PowerLock', 3, 54.99, NULL, 180, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- Brakes and Brake Parts
(25, 'BRAKE-001', 'Shimano XTR BR-M9100', 'Hydraulic disc brake set', 4, 399.99, 379.99, 30, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(26, 'BRAKE-002', 'SRAM Code RSC', '4-piston hydraulic brake set', 4, 449.99, NULL, 25, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(27, 'ROTOR-001', 'Shimano RT-MT900', 'Centerlock rotor, 160mm', 4, 89.99, 79.99, 80, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(28, 'ROTOR-002', 'SRAM Centerline X', 'Centerlock rotor, 180mm', 4, 94.99, NULL, 70, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(29, 'PAD-001', 'Shimano L03A', 'Sintered brake pads for XTR', 4, 29.99, 24.99, 150, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(30, 'PAD-002', 'SRAM Organic', 'Organic brake pads for Code', 4, 34.99, NULL, 120, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- Suspension Components
(31, 'FORK-001', 'RockShox Pike Ultimate', '160mm travel air fork', 5, 899.99, 849.99, 15, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(32, 'FORK-002', 'Fox 36 Factory', '170mm travel air fork', 5, 999.99, NULL, 12, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(33, 'SHOCK-001', 'RockShox Super Deluxe', 'Air rear shock, 200x57mm', 5, 449.99, 419.99, 20, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(34, 'SHOCK-002', 'Fox Float X2', 'Air rear shock, 230x65mm', 5, 549.99, NULL, 18, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- Cockpit Components
(35, 'BAR-001', 'Enve SES Road', 'Carbon road handlebar, 42cm', 6, 299.99, 279.99, 40, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(36, 'BAR-002', 'Renthal Fatbar', 'Aluminum mountain handlebar, 780mm', 6, 89.99, NULL, 60, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(37, 'STEM-001', 'Thomson Elite', 'Aluminum stem, 100mm', 6, 79.99, 69.99, 80, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(38, 'STEM-002', 'Ritchey WCS', 'Carbon stem, 110mm', 6, 129.99, NULL, 50, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(39, 'SEAT-001', 'Fizik Antares', 'Carbon road saddle', 6, 249.99, 229.99, 35, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(40, 'SEAT-002', 'WTB Volt', 'Mountain bike saddle', 6, 89.99, NULL, 70, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- Pedals and Cleats
(41, 'PEDAL-001', 'Shimano SPD-SL', 'Road clipless pedals', 7, 199.99, 179.99, 45, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(42, 'PEDAL-002', 'Shimano XT SPD', 'Mountain clipless pedals', 7, 149.99, NULL, 55, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(43, 'CLEAT-001', 'Shimano SPD-SL Cleats', 'Road cleats, 6-degree float', 7, 29.99, 24.99, 200, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(44, 'CLEAT-002', 'Shimano SPD Cleats', 'Mountain cleats, multi-release', 7, 19.99, NULL, 250, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- Tools and Maintenance
(45, 'TOOL-001', 'Park Tool Master Kit', 'Complete bike repair tool set', 8, 299.99, 279.99, 25, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(46, 'TOOL-002', 'Feedback Sports Pro', 'Bike repair stand', 8, 199.99, NULL, 30, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(47, 'LUBE-001', 'Finish Line Dry Lube', 'Chain lubricant, 4oz', 8, 12.99, 10.99, 150, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(48, 'LUBE-002', 'Muc-Off Bio Degreaser', 'Bike cleaner, 500ml', 8, 14.99, NULL, 120, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),

-- Accessories
(49, 'LIGHT-001', 'Garmin Varia RTL515', 'Radar taillight', 9, 199.99, 179.99, 40, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(50, 'LIGHT-002', 'Lezyne Macro Drive', 'Front light, 1000 lumens', 9, 89.99, NULL, 60, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(51, 'COMP-001', 'Garmin Edge 530', 'GPS bike computer', 9, 299.99, 279.99, 35, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(52, 'COMP-002', 'Wahoo Elemnt Bolt', 'GPS bike computer', 9, 249.99, NULL, 45, TRUE, '2023-01-01 00:00:00', '2023-01-01 00:00:00');

-- Insert sample orders (Bicycle-themed orders with realistic data)
INSERT INTO orders (order_id, customer_id, order_number, order_date, status, subtotal, tax_amount, shipping_amount, total_amount, shipping_address_id, billing_address_id, payment_method, payment_status, notes, created_at, updated_at) VALUES
-- Customer 12345 (Mike Rodriguez): 4 orders
(1, 12345, 'ORD-2023-001', '2023-02-01 10:00:00', 'DELIVERED', 3499.99, 280.00, 25.99, 3805.98, 1, 1, 'CREDIT_CARD', 'PAID', NULL, '2023-02-01 10:00:00', '2023-02-01 10:00:00'),
(2, 12345, 'ORD-2023-045', '2023-05-15 14:30:00', 'DELIVERED', 1899.99, 152.00, 15.99, 2067.98, 1, 1, 'CREDIT_CARD', 'PAID', NULL, '2023-05-15 14:30:00', '2023-05-15 14:30:00'),
(3, 12345, 'ORD-2023-089', '2023-08-22 16:45:00', 'SHIPPED', 299.99, 24.00, 8.99, 332.98, 1, 1, 'PAYPAL', 'PAID', NULL, '2023-08-22 16:45:00', '2023-08-22 16:45:00'),
(4, 12345, 'ORD-2023-156', '2023-11-10 09:20:00', 'PROCESSING', 89.99, 7.20, 5.99, 103.18, 1, 1, 'CREDIT_CARD', 'PAID', NULL, '2023-11-10 09:20:00', '2023-11-10 09:20:00'),

-- Customer 23456 (Sarah Chen): 3 orders
(5, 23456, 'ORD-2023-012', '2023-03-10 11:00:00', 'DELIVERED', 2899.99, 232.00, 20.99, 3152.98, 2, 2, 'CREDIT_CARD', 'PAID', NULL, '2023-03-10 11:00:00', '2023-03-10 11:00:00'),
(6, 23456, 'ORD-2023-067', '2023-07-05 13:20:00', 'DELIVERED', 449.99, 36.00, 9.99, 495.98, 2, 2, 'BANK_TRANSFER', 'PAID', NULL, '2023-07-05 13:20:00', '2023-07-05 13:20:00'),
(7, 23456, 'ORD-2023-134', '2023-10-15 15:45:00', 'SHIPPED', 199.99, 16.00, 7.99, 223.98, 2, 2, 'PAYPAL', 'PAID', NULL, '2023-10-15 15:45:00', '2023-10-15 15:45:00'),

-- Customer 34567 (David Kim): 2 orders
(8, 34567, 'ORD-2023-034', '2023-04-18 15:30:00', 'DELIVERED', 2199.99, 176.00, 18.99, 2394.98, 3, 3, 'CREDIT_CARD', 'PAID', NULL, '2023-04-18 15:30:00', '2023-04-18 15:30:00'),
(9, 34567, 'ORD-2023-178', '2023-12-05 12:10:00', 'DELIVERED', 79.99, 6.40, 5.99, 92.38, 3, 3, 'CREDIT_CARD', 'PAID', NULL, '2023-12-05 12:10:00', '2023-12-05 12:10:00'),

-- Customer 45678 (Emily Patel): 5 orders
(10, 45678, 'ORD-2023-023', '2023-03-25 09:15:00', 'DELIVERED', 4299.99, 344.00, 25.99, 4669.98, 4, 4, 'PAYPAL', 'PAID', NULL, '2023-03-25 09:15:00', '2023-03-25 09:15:00'),
(11, 45678, 'ORD-2023-056', '2023-06-12 12:45:00', 'DELIVERED', 899.99, 72.00, 9.99, 981.98, 4, 4, 'CREDIT_CARD', 'PAID', NULL, '2023-06-12 12:45:00', '2023-06-12 12:45:00'),
(12, 45678, 'ORD-2023-078', '2023-07-28 14:20:00', 'CANCELLED', 149.99, 12.00, 6.99, 168.98, 4, 4, 'CREDIT_CARD', 'REFUNDED', 'Customer requested cancellation', '2023-07-28 14:20:00', '2023-07-28 14:20:00'),
(13, 45678, 'ORD-2023-101', '2023-09-14 10:30:00', 'DELIVERED', 2499.99, 200.00, 20.99, 2720.98, 4, 4, 'PAYPAL', 'PAID', NULL, '2023-09-14 10:30:00', '2023-09-14 10:30:00'),
(14, 45678, 'ORD-2023-189', '2023-12-20 16:30:00', 'PROCESSING', 299.99, 24.00, 8.99, 332.98, 4, 4, 'CREDIT_CARD', 'PAID', NULL, '2023-12-20 16:30:00', '2023-12-20 16:30:00'),

-- Customer 56789 (James Wilson): 3 orders
(15, 56789, 'ORD-2023-038', '2023-04-22 16:00:00', 'DELIVERED', 3799.99, 304.00, 25.99, 4129.98, 5, 5, 'CREDIT_CARD', 'PAID', NULL, '2023-04-22 16:00:00', '2023-04-22 16:00:00'),
(16, 56789, 'ORD-2023-092', '2023-08-30 11:45:00', 'SHIPPED', 199.99, 16.00, 7.99, 223.98, 5, 5, 'BANK_TRANSFER', 'PAID', NULL, '2023-08-30 11:45:00', '2023-08-30 11:45:00'),
(17, 56789, 'ORD-2023-145', '2023-11-25 14:15:00', 'DELIVERED', 89.99, 7.20, 5.99, 103.18, 5, 5, 'CREDIT_CARD', 'PAID', NULL, '2023-11-25 14:15:00', '2023-11-25 14:15:00'),

-- Customer 67890 (Lisa Garcia): 2 orders
(18, 67890, 'ORD-2023-202', '2023-05-10 13:30:00', 'DELIVERED', 5499.99, 440.00, 30.99, 5970.98, 6, 6, 'CREDIT_CARD', 'PAID', NULL, '2023-05-10 13:30:00', '2023-05-10 13:30:00'),
(19, 67890, 'ORD-2023-167', '2023-10-08 10:20:00', 'DELIVERED', 349.99, 28.00, 9.99, 387.98, 6, 6, 'PAYPAL', 'PAID', NULL, '2023-10-08 10:20:00', '2023-10-08 10:20:00'),

-- Customer 78901 (Robert Thomas): 4 orders
(20, 78901, 'ORD-2023-203', '2023-06-15 11:45:00', 'DELIVERED', 4199.99, 336.00, 25.99, 4561.98, 7, 7, 'CREDIT_CARD', 'PAID', NULL, '2023-06-15 11:45:00', '2023-06-15 11:45:00'),
(21, 78901, 'ORD-2023-123', '2023-08-20 16:30:00', 'DELIVERED', 899.99, 72.00, 9.99, 981.98, 7, 7, 'CREDIT_CARD', 'PAID', NULL, '2023-08-20 16:30:00', '2023-08-20 16:30:00'),
(22, 78901, 'ORD-2023-204', '2023-11-12 09:15:00', 'SHIPPED', 199.99, 16.00, 7.99, 223.98, 7, 7, 'PAYPAL', 'PAID', NULL, '2023-11-12 09:15:00', '2023-11-12 09:15:00'),
(23, 78901, 'ORD-2023-198', '2023-12-28 14:45:00', 'PROCESSING', 149.99, 12.00, 6.99, 168.98, 7, 7, 'CREDIT_CARD', 'PAID', NULL, '2023-12-28 14:45:00', '2023-12-28 14:45:00'),

-- Customer 89012 (Anna Lee): 1 order
(24, 89012, 'ORD-2023-205', '2023-07-22 12:00:00', 'DELIVERED', 3299.99, 264.00, 20.99, 3584.98, 8, 8, 'CREDIT_CARD', 'PAID', NULL, '2023-07-22 12:00:00', '2023-07-22 12:00:00'),

-- Customer 90123 (Chris Martinez): 3 orders
(25, 90123, 'ORD-2023-112', '2023-08-05 15:20:00', 'DELIVERED', 3799.99, 304.00, 25.99, 4129.98, 9, 9, 'CREDIT_CARD', 'PAID', NULL, '2023-08-05 15:20:00', '2023-08-05 15:20:00'),
(26, 90123, 'ORD-2023-206', '2023-11-15 10:30:00', 'DELIVERED', 299.99, 24.00, 8.99, 332.98, 9, 9, 'PAYPAL', 'PAID', NULL, '2023-11-15 10:30:00', '2023-11-15 10:30:00'),
(27, 90123, 'ORD-2023-201', '2023-12-30 13:45:00', 'SHIPPED', 89.99, 7.20, 5.99, 103.18, 9, 9, 'CREDIT_CARD', 'PAID', NULL, '2023-12-30 13:45:00', '2023-12-30 13:45:00'),

-- Customer 11234 (Jessica Brown): 2 orders
(28, 11234, 'ORD-2023-207', '2023-09-18 14:10:00', 'DELIVERED', 2499.99, 200.00, 20.99, 2720.98, 10, 10, 'CREDIT_CARD', 'PAID', NULL, '2023-09-18 14:10:00', '2023-09-18 14:10:00'),
(29, 11234, 'ORD-2023-208', '2023-12-10 11:25:00', 'DELIVERED', 199.99, 16.00, 7.99, 223.98, 10, 10, 'PAYPAL', 'PAID', NULL, '2023-12-10 11:25:00', '2023-12-10 11:25:00');

-- Insert sample order details (Bicycle-themed order details)
INSERT INTO order_details (detail_id, order_id, product_id, product_name, product_sku, product_description, quantity, unit_price, discount_amount, line_total, created_at) VALUES
-- Order 1 (Mike Rodriguez - Complete bike)
(1, 1, 1, 'Trek Domane SL 6', 'BIKE-001', 'Carbon road bike with Shimano Ultegra groupset', 1, 3499.99, 0.00, 3499.99, '2023-02-01 10:00:00'),

-- Order 2 (Mike Rodriguez - Wheelset)
(2, 2, 11, 'Zipp 404 Firecrest', 'WHEEL-001', 'Carbon aero wheelset with ceramic bearings', 1, 1899.99, 0.00, 1899.99, '2023-05-15 14:30:00'),

-- Order 3 (Mike Rodriguez - Tires)
(3, 3, 14, 'Continental GP5000', 'TIRE-001', 'High-performance road tire, 700x25c', 2, 89.99, 0.00, 179.98, '2023-08-22 16:45:00'),
(4, 3, 15, 'Michelin Power Cup', 'TIRE-002', 'Tubeless road tire, 700x28c', 2, 94.99, 0.00, 189.98, '2023-08-22 16:45:00'),

-- Order 4 (Mike Rodriguez - Chain)
(5, 4, 23, 'Shimano HG-901', 'CHAIN-001', '11-speed chain with quick link', 1, 49.99, 0.00, 49.99, '2023-11-10 09:20:00'),

-- Order 5 (Sarah Chen - Mountain bike)
(6, 5, 2, 'Specialized Stumpjumper', 'BIKE-002', 'Full-suspension mountain bike with SRAM GX', 1, 2899.99, 0.00, 2899.99, '2023-03-10 11:00:00'),

-- Order 6 (Sarah Chen - Brake set)
(7, 5, 25, 'Shimano XTR BR-M9100', 'BRAKE-001', 'Hydraulic disc brake set', 1, 399.99, 0.00, 399.99, '2023-03-10 11:00:00'),

-- Order 7 (Sarah Chen - Brake pads)
(8, 6, 29, 'Shimano L03A', 'PAD-001', 'Sintered brake pads for XTR', 2, 29.99, 0.00, 59.98, '2023-07-05 13:20:00'),

-- Order 8 (Sarah Chen - Tires)
(9, 7, 16, 'Maxxis Minion DHF', 'TIRE-003', 'Downhill mountain bike tire, 29x2.5', 2, 79.99, 0.00, 159.98, '2023-10-15 15:45:00'),

-- Order 9 (David Kim - Endurance bike)
(10, 8, 3, 'Cannondale Synapse', 'BIKE-003', 'Endurance road bike with disc brakes', 1, 2199.99, 0.00, 2199.99, '2023-04-18 15:30:00'),

-- Order 10 (David Kim - Tires)
(11, 9, 14, 'Continental GP5000', 'TIRE-001', 'High-performance road tire, 700x25c', 2, 89.99, 0.00, 179.98, '2023-12-05 12:10:00'),

-- Order 11 (Emily Patel - High-end bike)
(12, 10, 4, 'Giant Defy Advanced', 'BIKE-004', 'Carbon endurance bike with electronic shifting', 1, 4299.99, 0.00, 4299.99, '2023-03-25 09:15:00'),

-- Order 12 (Emily Patel - Wheelset)
(13, 11, 12, 'Enve SES 3.4', 'WHEEL-002', 'Carbon climbing wheelset', 1, 899.99, 0.00, 899.99, '2023-06-12 12:45:00'),

-- Order 13 (Emily Patel - Cancelled order)
(14, 12, 43, 'Shimano SPD-SL Cleats', 'CLEAT-001', 'Road cleats, 6-degree float', 1, 29.99, 0.00, 29.99, '2023-07-28 14:20:00'),

-- Order 14 (Emily Patel - Groupset)
(15, 13, 18, 'Shimano Dura-Ace Di2', 'GROUP-001', 'Electronic 12-speed road groupset', 1, 2499.99, 0.00, 2499.99, '2023-09-14 10:30:00'),

-- Order 15 (Emily Patel - Pedals)
(16, 14, 41, 'Shimano SPD-SL', 'PEDAL-001', 'Road clipless pedals', 1, 299.99, 0.00, 299.99, '2023-12-20 16:30:00'),

-- Order 16 (James Wilson - Mountain bike)
(17, 15, 5, 'Santa Cruz Hightower', 'BIKE-005', 'Trail mountain bike with carbon frame', 1, 3799.99, 0.00, 3799.99, '2023-04-22 16:00:00'),

-- Order 17 (James Wilson - Saddle)
(18, 16, 40, 'WTB Volt', 'SEAT-002', 'Mountain bike saddle', 1, 199.99, 0.00, 199.99, '2023-08-30 11:45:00'),

-- Order 18 (James Wilson - Chain)
(19, 17, 24, 'SRAM PC-1170', 'CHAIN-002', '12-speed chain with PowerLock', 1, 89.99, 0.00, 89.99, '2023-11-25 14:15:00'),

-- Order 19 (Lisa Garcia - Racing bike)
(20, 18, 6, 'Cervélo S5', 'BIKE-006', 'Aero road bike for racing', 1, 5499.99, 0.00, 5499.99, '2023-05-10 13:30:00'),

-- Order 20 (Lisa Garcia - GPS computer)
(21, 19, 51, 'Garmin Edge 530', 'COMP-001', 'GPS bike computer', 1, 349.99, 0.00, 349.99, '2023-10-08 10:20:00'),

-- Order 21 (Robert Thomas - Enduro bike)
(22, 20, 7, 'Yeti SB130', 'BIKE-007', 'Enduro mountain bike with 130mm travel', 1, 4199.99, 0.00, 4199.99, '2023-06-15 11:45:00'),

-- Order 22 (Robert Thomas - Fork)
(23, 21, 31, 'RockShox Pike Ultimate', 'FORK-001', '160mm travel air fork', 1, 899.99, 0.00, 899.99, '2023-08-20 16:30:00'),

-- Order 23 (Robert Thomas - Handlebar)
(24, 22, 36, 'Renthal Fatbar', 'BAR-002', 'Aluminum mountain handlebar, 780mm', 1, 199.99, 0.00, 199.99, '2023-11-12 09:15:00'),

-- Order 24 (Robert Thomas - Brake pads)
(25, 23, 30, 'SRAM Organic', 'PAD-002', 'Organic brake pads for Code', 2, 34.99, 0.00, 69.98, '2023-12-28 14:45:00'),

-- Order 25 (Anna Lee - All-mountain bike)
(26, 24, 9, 'Ibis Ripmo', 'BIKE-009', 'All-mountain bike with carbon frame', 1, 3299.99, 0.00, 3299.99, '2023-07-22 12:00:00'),

-- Order 26 (Chris Martinez - Climbing bike)
(27, 25, 10, 'Scott Addict RC', 'BIKE-010', 'Lightweight climbing bike', 1, 3799.99, 0.00, 3799.99, '2023-08-05 15:20:00'),

-- Order 27 (Chris Martinez - Saddle)
(28, 26, 39, 'Fizik Antares', 'SEAT-001', 'Carbon road saddle', 1, 299.99, 0.00, 299.99, '2023-11-15 10:30:00'),

-- Order 28 (Chris Martinez - Tires)
(29, 27, 17, 'Schwalbe Pro One', 'TIRE-004', 'Tubeless road tire, 700x30c', 2, 99.99, 0.00, 199.98, '2023-12-30 13:45:00'),

-- Order 29 (Jessica Brown - Groupset)
(30, 28, 19, 'SRAM Red eTap AXS', 'GROUP-002', 'Wireless electronic road groupset', 1, 2499.99, 0.00, 2499.99, '2023-09-18 14:10:00'),

-- Order 30 (Jessica Brown - Handlebar)
(31, 29, 35, 'Enve SES Road', 'BAR-001', 'Carbon road handlebar, 42cm', 1, 199.99, 0.00, 199.99, '2023-12-10 11:25:00'); 