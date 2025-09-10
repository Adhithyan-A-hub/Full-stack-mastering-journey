drop database task_achvmn;

-- Create database
CREATE DATABASE ecommerce_demo;
USE ecommerce_demo;

-- Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    status ENUM('Active','Inactive'),
    join_date DATE
);

INSERT INTO customers (customer_name, email, status, join_date) VALUES
('John Doe', 'john@example.com', 'Active', '2024-01-15'),
('Jane Smith', 'jane@example.com', 'Active', '2024-06-10'),
('Mark Brown', 'mark@example.com', 'Inactive', '2023-11-05'),
('Lisa White', 'lisa@example.com', 'Active', '2024-07-25'),
('Tom Black', 'tom@example.com', 'Inactive', '2023-09-01');

-- Products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT,
    status ENUM('Active','Inactive')
);

INSERT INTO products (product_name, category, price, stock_quantity, status) VALUES
('Laptop', 'Electronics', 60000.00, 12, 'Active'),
('Phone', 'Electronics', 30000.00, 50, 'Active'),
('Tablet', 'Electronics', 20000.00, 5, 'Active'),
('Shoes', 'Fashion', 3000.00, 100, 'Active'),
('Watch', 'Fashion', 5000.00, 2, 'Inactive');

-- Orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10,2),
    order_date DATE,
    status ENUM('Delivered','Pending','Cancelled'),
    employee_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders (customer_id, product_id, quantity, total_amount, order_date, status, employee_id) VALUES
(1, 1, 1, 60000.00, '2024-07-20', 'Delivered', 1),
(1, 2, 2, 60000.00, '2024-07-21', 'Pending', 2),
(2, 3, 1, 20000.00, '2024-07-18', 'Delivered', 1),
(3, 4, 3, 9000.00, '2024-06-05', 'Cancelled', 3),
(4, 5, 1, 5000.00, '2024-07-25', 'Delivered', 2),
(5, 1, 1, 60000.00, '2024-07-10', 'Pending', 3);

-- Payments table
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(50),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO payments (order_id, payment_date, payment_method, amount) VALUES
(1, '2024-07-20', 'Credit Card', 60000.00),
(3, '2024-07-18', 'UPI', 20000.00),
(5, '2024-07-25', 'Cash', 5000.00);


/*	
Create a view named active_customers that contains only active customers.
Create a view named customer_contacts showing only customer names and emails.
Create a view named high_value_orders containing orders above a specific total amount.
Create a view named order_details_view combining orders and customers information.
Create a view named product_sales_summary showing each product’s total sold quantity.*/

create  view active_usrs AS select  customer_name  from customers where status="Active";
create view customer_contacts As select customer_name,email from customers;
create view high_value_orders As select * from orders where total_amount > 10000;
create or replace view order_details_view AS select o.order_id,o.product_id, quantity, total_amount, order_date, o.status, employee_id,c.customer_id,customer_name from orders o join customers c on o.customer_id = c.customer_id;
create or replace view product_sales_summary AS select p.product_id,count(o.order_id) as no_of_orders,sum(o.quantity) as sold_quantity,sum(o.total_amount) as total_sold_price from products p join orders o on p.product_id = o.product_id group by product_id;

/*
Replace the active_customers view to include their joining date.
Display the SQL definition of order_details_view.
Create an updatable view named customer_basic_info containing only IDs, names, and emails.
Update a customer’s email through the customer_basic_info view.
Drop the high_value_orders view.*/

create or replace  view active_usrs AS select  customer_name,join_date  from customers where status="Active";
select create view order_details_view;
create or replace view customer_basic_info AS select customer_id,customer_name,join_date,email from customers;
update  customer_basic_info set email="john3@gamil.com" where customer_id = 1;
drop view  high_value_orders;

/*
+Create a view named monthly_sales showing total sales amount for each month.
Create a view named employee_orders showing orders handled by each employee.
Create a view named top_customers listing customers with the highest number of orders.
Create a view named low_stock_products listing products below a certain stock quantity.
Create a view named delivered_orders containing only orders with status “Delivered”.*/

create or replace view monthly_sales as select monthname(order_date) as month ,sum(total_amount) as sales_per_month from orders group by monthname(order_date) ;
create or replace view employee_orders as select employee_id,group_concat(order_id) as orders_handled from orders group by employee_id;
create or replace view top_customers as select customer_name,c.customer_id,count(order_ID) as order_count from orders o join customers c on o.customer_id = c.customer_id group by c.customer_id; 
create or replace view low_stock_view as select * from products where stock_quantity<20;
create or replace view delivered_order as select * from orders where status="delivered";

/*
Create a view named category_sales_summary showing total sales per product category.
Create a view named recent_customers showing customers who joined in the last 30 days.
Create a view named inactive_customers listing customers without any orders.
Create a view named order_payment_details joining orders and payments.
Create a view named sales_leaderboard listing products in descending order of quantity sold.*/

create or replace view category_sales_summary as select category,sum(quantity) as total_sales from orders o join products p on o.product_id and p.product_id group by category;
create view recent_customers as select * from customers where datediff(join_date,curdate())<30;
create or replace view inactive_customers as select c.*,o.order_id from customers c  left join orders o on o.customer_id = c.customer_id where o.order_id is null ;
create or replace  view order_payment_details as select o.*,p.payment_id,p.payment_date,p.payment_method,p.amount from orders o join payments p on o.order_id = p.order_id;
create view sales_leaderBoard as select p.*,sum(quantity) as sold_quantity from products p join orders o on o.product_id = p.product_id group by p.product_id order by sold_quantity desc;
select * from   sales_leaderBoard  ;


