use Task_achvmn;


CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer VARCHAR(50),
    product VARCHAR(50),
    amount INT
);

INSERT INTO orders (customer, product, amount) VALUES
('Alice', 'Apple', 100),
('Bob', 'Orange', 150),
('Alice', 'Banana', 80),
('Bob', 'Apple', 120),
('Charlie', 'Banana', 50),
('Alice', 'Apple', 60),
('Charlie', 'Orange', 70),
('Bob', 'Banana', 90),
('Alice', 'Orange', 40),
('Charlie', 'Apple', 110);

/*Count how many orders each customer made.
Show total amount spent by each customer.
Find the highest amount spent by each customer.
Show total amount spent per customer per product.
List customers who spent more than 200 in total.*/

select customer,count(customer) as orders from orders group by customer;
select customer,sum(amount) as Total_amount from orders group by customer;
select customer,max(amount) from orders group by customer;
select customer,product,sum(amount) as tottal_spent from orders group by customer,product;
select customer from orders group by customer having sum(amount)>200;

/*Show the average amount each customer spent on each product.
Display total orders per product, ordered by total orders descending.
List all products that were ordered by more than 2 customers.
Find customers who ordered more than one type of product.
Show the total amount spent on each product by all customers combined.*/

select customer,product,round(avg(amount)) as avg_amount from orders group by customer,product;
select product,count(product) as Total_orders from orders group by product order by total_orders desc;
select product,count(customer) as orders from orders group by product having orders>2 ;
select customer,count(distinct product) as prod_type from orders group by customer having prod_type>1 ;
select product,sum(amount) as amount_spent from orders group by product;

/*
Find customers who ordered at least 3 different products, and show the total amount they spent.
Find the top 3 customers who spent the most in total — order them by total amount descending.
For each product, show the number of unique customers who ordered it, only include products that were ordered by more than 2 customers.
List each customer and the maximum single purchase amount they made — only include those whose max amount is greater than the overall average amount.
Find all products whose total order count is greater than the average order count per product.*/

select customer,sum(amount)from orders group by customer having count(distinct product)>2;
select customer,sum(amount) as total_spent from orders group by customer order by total_spent desc limit 3;
select product,count(distinct customer) as ordered from orders group by product having ordered>2;
select customer,max(amount) as max_spent,avg(amount) as avg_amount from orders group by customer having max_spent>avg(amount);
select product from orders group by product having count(customer)>(select avg(count_no)as sub from(select count(customer)  as count_no from orders group by product) as sub );

select *from orders