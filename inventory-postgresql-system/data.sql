INSERT INTO categories (category_name)
VALUES
('Electronics'),
('Clothing'),
('Home Appliances');

INSERT INTO products (product_name, category_id, unit_price)
VALUES
('Laptop Dell i5', 1, 65000),
('Smartphone Samsung A54', 1, 30000),
('T-Shirt Cotton', 2, 500),
('Microwave Oven', 3, 12000);

INSERT INTO suppliers (supplier_name, phone, city)
VALUES
('Tech World Ltd', '01710000001', 'Dhaka'),
('Fashion Hub', '01710000002', 'Chittagong');

INSERT INTO stock (product_id, quantity)
VALUES
(1, 10),
(2, 20),
(3, 100),
(4, 5);

INSERT INTO purchases (supplier_id, product_id, quantity, purchase_price)
VALUES
(1, 1, 5, 60000),
(1, 2, 10, 28000);

INSERT INTO sales (product_id, quantity, sale_price)
VALUES
(1, 2, 70000),
(3, 10, 600);