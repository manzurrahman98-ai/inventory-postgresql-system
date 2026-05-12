--Product Full Details View
CREATE VIEW view_product_details AS
SELECT 
    p.product_id,
    p.product_name,
    c.category_name,
    p.unit_price,
    s.quantity AS stock_quantity,
    p.created_at
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN stock s ON p.product_id = s.product_id;

--Low Stock Alert View
CREATE VIEW view_low_stock AS
SELECT 
    p.product_name,
    s.quantity
FROM products p
JOIN stock s ON p.product_id = s.product_id
WHERE s.quantity < 10;

--Sales Revenue View
CREATE VIEW view_sales_revenue AS
SELECT 
    p.product_name,
    SUM(s.quantity * s.sale_price) AS total_revenue
FROM sales s
JOIN products p ON p.product_id = s.product_id
GROUP BY p.product_name;

--Best Selling Products View
CREATE VIEW view_best_selling_products AS
SELECT 
    p.product_name,
    SUM(s.quantity) AS total_sold
FROM sales s
JOIN products p ON p.product_id = s.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

--Supplier Purchase Summary View
CREATE VIEW view_supplier_purchases AS
SELECT 
    sup.supplier_name,
    SUM(p.quantity * p.purchase_price) AS total_purchase_value
FROM purchases p
JOIN suppliers sup ON sup.supplier_id = p.supplier_id
GROUP BY sup.supplier_name;

--Stock Movement Overview
CREATE VIEW view_stock_overview AS
SELECT 
    p.product_name,
    s.quantity,
    CASE 
        WHEN s.quantity = 0 THEN 'OUT OF STOCK'
        WHEN s.quantity < 10 THEN 'LOW STOCK'
        ELSE 'STOCK OK'
    END AS stock_status
FROM stock s
JOIN products p ON p.product_id = s.product_id;

--Purchase History View
CREATE VIEW view_purchase_history AS
SELECT 
    pr.purchase_id,
    sup.supplier_name,
    p.product_name,
    pr.quantity,
    pr.purchase_price,
    (pr.quantity * pr.purchase_price) AS total_cost,
    pr.purchase_date
FROM purchases pr
JOIN suppliers sup ON sup.supplier_id = pr.supplier_id
JOIN products p ON p.product_id = pr.product_id;

--Sales History View
CREATE VIEW view_sales_history AS
SELECT 
    s.sale_id,
    p.product_name,
    s.quantity,
    s.sale_price,
    (s.quantity * s.sale_price) AS total_sale,
    s.sale_date
FROM sales s
JOIN products p ON p.product_id = s.product_id;

--Materialized View
CREATE MATERIALIZED VIEW mv_daily_sales AS
SELECT 
    DATE(sale_date) AS sale_day,
    SUM(quantity * sale_price) AS total_sales
FROM sales
GROUP BY DATE(sale_date);