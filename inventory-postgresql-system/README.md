📦 Inventory Management System (PostgreSQL)








A fully structured PostgreSQL Inventory Management System designed for real-world business use cases, including stock tracking, sales, purchases, and analytics reporting.

🚀 Overview

This project simulates a real inventory system used in businesses to manage:

Products & categories
Stock levels
Suppliers
Purchases & sales
Business analytics reports

It is optimized for:

💼 Fiverr portfolio projects
📊 SQL analytics demonstrations
🧠 Learning relational database design
🏢 Backend database systems

inventory-postgresql-system/
│
├── schema.sql          # Database tables & relationships
├── data.sql            # Sample dataset (INSERT queries)
├── queries.sql         # Business analytics queries
├── views.sql           # Reporting views (dashboard layer)
├── procedures.sql      # Automation (triggers/functions)
└── README.md

⚙️ Setup Instructions
1️⃣ Create Database
CREATE DATABASE inventory_db;
2️⃣ Run Schema
Execute:
schema.sql
3️⃣ Insert Sample Data
data.sql
4️⃣ Run Queries
queries.sql
5️⃣ Load Views
views.sql
6️⃣ (Optional) Enable Automation
procedures.sql

🏗️ Database Schema

The system contains the following tables:

categories → Product categories
products → Product details
suppliers → Supplier information
stock → Inventory tracking
purchases → Purchase records
sales → Sales transactions
📊 Features
📦 Inventory Management
Product catalog system
Category-based organization
Stock quantity tracking
🛒 Sales & Purchase System
Purchase tracking
Sales recording
Revenue calculation
📉 Analytics & Reporting
Best-selling products
Low stock alerts
Supplier performance reports
Revenue analysis
⚡ Automation
Stock updates using triggers
Real-time inventory adjustments

📈 Example Queries
💰 Total Revenue
SELECT SUM(quantity * sale_price) AS total_revenue
FROM sales;
📉 Low Stock Alert
SELECT p.product_name, s.quantity
FROM products p
JOIN stock s ON p.product_id = s.product_id
WHERE s.quantity < 10;
🏆 Best Selling Products
SELECT p.product_name,
       SUM(s.quantity) AS total_sold
FROM sales s
JOIN products p ON p.product_id = s.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

🧠 Key Concepts Used
Relational database design (3NF normalization)
Primary & foreign keys
JOIN operations
Aggregation functions (SUM, COUNT, GROUP BY)
SQL Views (reporting layer)
Triggers & automation (PL/pgSQL)

📊 Business Value

This system can be used for:

Retail inventory management
E-commerce backend systems
Sales tracking dashboards
Business intelligence reporting

👨‍💻 Author

Manzur Rahman
Python • PostgreSQL • SQL • API Development • Automation

⭐ Support

If you like this project:

⭐ Star this repository
🍴 Fork it for learning
💼 Use it in your Fiverr portfolio

