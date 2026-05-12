--Total Stock Available
SELECT p.product_name, s.quantity
FROM products p
JOIN stock s ON p.product_id = s.product_id;

--Total Sales Revenue
SELECT SUM(quantity * sale_price) AS total_revenue
FROM sales;

--Low Stock Alert
SELECT p.product_name, s.quantity
FROM products p
JOIN stock s ON p.product_id = s.product_id
WHERE s.quantity < 10;

--Best Selling Products
SELECT p.product_name,
       SUM(s.quantity) AS total_sold
FROM sales s
JOIN products p ON p.product_id = s.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

--Supplier Purchase Report
SELECT sup.supplier_name,
       SUM(p.quantity * p.purchase_price) AS total_purchase
FROM purchases p
JOIN suppliers sup ON sup.supplier_id = p.supplier_id
GROUP BY sup.supplier_name;

