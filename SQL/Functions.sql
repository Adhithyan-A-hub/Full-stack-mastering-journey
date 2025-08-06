use task_achvmn;
create table students_data(name varchar(15),marks int,DOB date,city varchar(20));
insert into students_data values
("Raja",80,'2004-02-19',"Cuddalore"),
("Ghandi",76,'2003-08-15',"Trichy"),
("Mohan",90,'2005-10-22',"Newyork"),
("Ambi",99,'2005-11-14',"PerumalSavadi"),
("Annian",35,'2004-07-17',"Saukarpetta"),
("Mark",50,'2004-08-31',"San Fransisco"),
("Elon",86,'2004-02-02',"Melburn"),
("Modi",87,'2004-05-25',"Nazrathpet"),
("Hitler",90,'2005-09-30',"Adolf street"),
("Obama",60,'2005-12-20',"Nigeria");

/* SQL FUNCTIONS MASTERING TASKS */

/*Show all student names in uppercase.
Show the total number of students.
Show the average marks of all students.
Show each student’s city name length.
Show each student’s birth year.*/

select upper(name) from students_data;
select count(*) from students_data;
select avg(marks) from students_data;
select city,length(city) as string_length from students_data;
select name,year(dob) as year_born from students_data;

/*Show names and whether salary is above 50000.
Show department-wise average salary only if it’s above 60000.
Show how many days ago each employee joined.
Show first 3 letters of each employee name in lowercase.
Round salaries to the nearest thousand.*/

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    department VARCHAR(50),
    joining_date DATE
);

INSERT INTO employees (id, name, salary, department, joining_date) VALUES
(1, 'Alice',    75000, 'HR',    '2021-06-15'),
(2, 'Bob',      48000, 'Sales', '2022-09-01'),
(3, 'Charlie',  62000, 'HR',    '2020-01-10'),
(4, 'David',    58000, 'IT',    '2023-03-05'),
(5, 'Eva',      82000, 'Sales', '2019-11-20'),
(6, 'Frank',    50000, 'IT',    '2022-12-30'),
(7, 'Grace',    92000, 'IT',    '2018-04-17'),
(8, 'Hitesh',   43000, 'HR',    '2024-02-10'),
(9, 'Irene',    67000, 'Sales', '2020-07-25'),
(10,'Jayanth',  55000, 'IT',    '2023-10-01');

/*Display each employee’s name, and whether their salary is more than ₹50,000 or not.
Show the average salary of each department, but only for departments where the average salary is above ₹60,000.
Show the number of days since each employee joined.
Display the first 3 letters of every employee’s name in lowercase.
Display each employee's name and their salary rounded to the nearest ₹1,000.*/

select name, if(salary>50000,"YES","NO") as salary_checker from employees; 
select department,round(avg(salary)) from employees  group by department having avg(salary)>60000;
select name,datediff(now(),joining_date) as No_of_working_days from employees;
select lower(substring(name,1,3)) from employees;
select name,round(salary) from employees;

/*Display each employee’s name, and their department name in reverse (backward).
Show only those employees who joined more than 2 years ago and have salary less than their department's average.
For each department, show the department name, total number of employees, total salary, and a label 'Lean Team' if employee count is less than 3, else 'Big Team'.
Show names of employees whose names have exactly 6 characters and start with a vowel.
Display each employee’s name, their joining year, and their salary rounded to the nearest 10,000.*/

select reverse(name),reverse(department) from employees;
select name from employees	 having salary<30000;
select department,count(name) as employees_no,sum(salary) as dep_salary,if(count(name)<3,"Lean Team","Big Team") as Team_size from employees group by department;
select name from employees where name like ("______") and ( name like ("a%") or name like("e%") or name like("i%") or name like("o%") or name like("u%") );
select name, year(joining_date),round(salary,-4) from employees;

