CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(100)
);

INSERT INTO customers (customer_id, name, email) VALUES
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', 'bob@example.com'),
(3, 'Charlie', 'charlie@example.com'),
(4, 'Diana', 'diana@example.com');

CREATE TABLE order_pack (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10,2)
);

INSERT INTO order_pack (order_id, customer_id, order_date, total_amount) VALUES
(101, 1, '2025-01-10', 250.00),
(102, 1, '2025-02-15', 100.00),
(103, 2, '2025-01-12', 300.00),
(104, 4, '2025-03-01', 150.00),
(105, 2, '2025-01-20', 200.00);

CREATE TABLE employee_det (
  employee_id INT PRIMARY KEY,
  name VARCHAR(50),
  dept_id INT
);

INSERT INTO employee_det (employee_id, name, dept_id) VALUES
(1, 'Emma', 101),
(2, 'Liam', 102),
(3, 'Noah', NULL),
(4, 'Olivia', 104);

CREATE TABLE departments (
  id INT PRIMARY KEY,
  dept_name VARCHAR(50)
);

INSERT INTO departments (id, dept_name) VALUES
(101, 'Sales'),
(102, 'Marketing'),
(103, 'HR');

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  name VARCHAR(50),
  price DECIMAL(10,2),
  category VARCHAR(50)
);

INSERT INTO products (product_id, name, price, category) VALUES
(1, 'Pen', 10.00, 'Stationery'),
(2, 'Notebook', 150.00, 'Stationery'),
(3, 'Pencil', 5.00, 'Stationery'),
(4, 'Eraser', 7.00, 'Stationery'),
(5, 'Marker', 80.00, 'Stationery');




show tables;
select * from employee_det;
select* from departments;
select*from customers;
select*from order_pack;
select * from products;
/*
Join customers with orders.
Join employees with departments.
Join orders with customers, show order_id and customer name.
Join products with orders (assume future order-product link).
Join departments with employees, showing all departments and their employees.
*/

select customers.*,order_pack.* from order_pack join customers  on customers.customer_id=order_pack.customer_id ;
select  departments.*,employee_det.* from employee_det join departments on  employee_det.dept_id=departments.id;
select c.name,p.order_id from customers as c join order_pack p on c.customer_id=p.customer_id;
select order_pack.* , products.* from order_pack join products ;
select e.name ,d.dept_name from departments as d join employee_det as e on e.dept_id=d.id;

/*
Join orders with customers and return only those orders where the total amount is greater than 200.
Join employees with departments, and return employee name and department name for only those who belong to the 'Sales' department.
Join departments with employees, and return all departments, even those with no employees.
Join orders with customers, group by customer, and return the total number of orders placed by each customer.
Join orders with customers, and return only those customers who placed more than 2 orders.*/

select o.* from order_pack as o join customers as c on c.customer_id=o.customer_id where o.total_amount>200;
select e.name,d.dept_name from employee_det as e join departments as d on e.dept_id=d.id where d.dept_name="Sales";
select d.dept_name,e.name from departments as d left join employee_det as e on d.id=e.dept_id;
select c.name , count(o.order_id) as order_count from customers as c join order_pack as o on c.customer_id = o.customer_id group by c.name;
select c.name from customers as c join order_pack as o on c.customer_id = o.customer_id group by c.name having count(o.order_id)>2;

/*
Join orders with customers, and return each customer’s name, total number of orders, and total amount spent, but only for customers who have spent more than 500 in total.
Get a list of departments with more than one employee, showing department name and employee count.
Return the top 2 customers who have placed the most number of orders, showing name and order count.
List all departments and how many employees are in each — including departments that have zero employees.
List customers and the date of their latest order using a join between customers and orders.*/

select c.name,count(o.order_id) as order_count,sum(o.total_amount) as spent_amount from customers as c join order_pack as o on c.customer_id=o.customer_id group by c.name having sum(o.total_amount)>500;
select d.dept_name,count(e.name) from employee_det as e join departments d on e.dept_id=d.id group by d.dept_name having count(distinct e.name)>1;
select c.name,count(o.order_id) as order_count from order_pack as o join customers as c on c.customer_id=o.customer_id group by c.name order by order_count desc limit 2;
select d.dept_name,count(e.name) from departments as d left join employee_det as e on e.dept_id=d.id group by d.dept_name;
select c.name,max(o.order_date) from customers as c join order_pack as o on c.customer_id=o.customer_id group by c.name;


