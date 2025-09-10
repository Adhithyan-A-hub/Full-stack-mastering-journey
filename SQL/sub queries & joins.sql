-- Table: Departments
CREATE TABLE Departments(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50),
    manager_id INT
);

INSERT INTO Departments VALUES
(1, 'HR', 'New York', 101),
(2, 'IT', 'Chicago', 102),
(3, 'Sales', 'New York', 103),
(4, 'Marketing', 'Chicago', NULL);

-- Table: Employees
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Employees VALUES
(101, 'Alice', 1, 6000),
(102, 'Bob', 2, 8000),
(103, 'Charlie', 3, 7500),
(104, 'David', 2, 5000),
(105, 'Eva', 3, 9000),
(106, 'Frank', 2, 7000),
(107, 'Grace', 4, 6500);

-- Table: Customers
CREATE TABLE Customers (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(50)
);

INSERT INTO Customers VALUES
(201, 'John'),
(202, 'Mary'),
(203, 'Paul'),
(204, 'Linda');

-- Table: Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    cust_id INT,
    order_date DATE,
    FOREIGN KEY (cust_id) REFERENCES Customers(cust_id)
);

INSERT INTO Orders VALUES
(301, 201, '2025-01-05'),
(302, 201, '2025-02-10'),
(303, 202, '2025-03-15'),
(304, 203, '2025-04-20');

-- Table: Products
CREATE TABLE Products (
    prod_id INT PRIMARY KEY,
    prod_name VARCHAR(50),
    category VARCHAR(50),
    supplier_id INT,
    price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(401, 'Laptop', 'Electronics', 501, 1200),
(402, 'Mouse', 'Electronics', 501, 25),
(403, 'Keyboard', 'Electronics', 502, 45),
(404, 'Shirt', 'Clothing', 503, 30),
(405, 'Jeans', 'Clothing', 503, 50),
(406, 'Jacket', 'Clothing', 504, 90),
(407, 'Tablet', 'Electronics', 502, 350);

-- Table: OrderDetails
CREATE TABLE OrderDetails (
    order_id INT,
    prod_id INT,
    quantity INT,
    PRIMARY KEY (order_id, prod_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (prod_id) REFERENCES Products(prod_id)
);

INSERT INTO OrderDetails VALUES
(301, 401, 1),
(301, 402, 2),
(302, 404, 3),
(303, 403, 1),
(304, 401, 1),
(304, 405, 2);

-- Table: Suppliers
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50)
);

INSERT INTO Suppliers VALUES
(501, 'TechSource'),
(502, 'GadgetWorld'),
(503, 'FashionHub'),
(504, 'StyleCorner');

show tables;
select * from customers;
select * from departments;
select * from employees;
select * from orderdetails;
select * from orderdetails;
select * from orders;
select * from products;
select * from suppliers;

-- Beginner tasks --

/* Retrieve all columns of employees whose salary is greater than the average salary.
Get the names of customers who placed at least one order.
Find the departments that have more than 5 employees.
List the products that have a price higher than the cheapest product in their category.
Show the employee(s) who earn the highest salary.*/

select * from employees where salary>(select avg(salary) from employees);
select cust_name from customers where cust_id in ( select cust_id from orders );
select dept_name from departments where dept_id in (select dept_id from employees group by dept_id having	count(emp_name)>5) ;
select prod_name,price from products as p where price>(select min(price) from products where category=p.category);
select emp_name,salary from employees	where salary=(select max(salary) as max_sal from employees);

/*Find customers who have never placed an order.
Get the names of employees whose department is located in "New York".
Retrieve all orders placed by the customer who has the maximum total spending.
Show the product(s) with a price above the average price of all products in the same supplier.
List the departments that do not have any managers.*/

select cust_name from customers where cust_id NOT IN (select distinct cust_id from orders );
select emp_name from employees where  dept_id In (select dept_id from departments where location = "New York");

select max(price_of_order) from
 (select order_id,sum(price*quantity) as price_of_order from orderdetails join products on orderdetails.prod_id=products.prod_id group by order_id) 
 as sub_sub_query;

select cust_id,order_id,order_date from orders where cust_id = (select cust_id from orderdetails as od 
join orders as o on od.order_id = o.order_id 
join products as p on od.prod_id = p.prod_id
group by cust_id  order by sum(price*quantity) desc limit 1 );

select prod_name from products  as p 
join (select avg(p.price) as Sup_avg ,p.supplier_id  from products as p join suppliers as s on p.supplier_id=s.supplier_id group by p.supplier_id ) as a 
on p.supplier_id = a.supplier_id
 where price>sup_avg;

select * from departments left join employees on manager_id=emp_id where manager_id is null;

/*Get the employee(s) who earn more than the average salary of their department.
Find customers who ordered every product in a specific category (you choose the category).
Retrieve the top 3 highest-priced products in each category.
Show suppliers who provide only products priced above the average product price.
List employees whose salary is above the company average but below the maximum salary.*/

select emp_name from employees as e join (select d.dept_id ,avg( e.salary) as dept_AVG_salary from departments as d join employees as e on d.dept_id = e.dept_id  group by d.dept_id) as d on d.dept_id = e.dept_id where e.salary > d.dept_AVG_salary;
select cust_id from Orders o
join OrderDetails od ON o.order_id = od.order_id
join Products p ON od.prod_id = p.prod_id
where category = 'Electronics'
group by  cust_id having COUNT(distinct p.prod_id) = (
    select COUNT(*) 
    from Products 
    where category = 'Electronics');

select supplier_name from suppliers where supplier_id not in (select supplier_id from products where price <= (select avg(price) from products));

select* from employees  where salary > (select avg(salary) from employees) and salary < (select max(salary) from employees); 







