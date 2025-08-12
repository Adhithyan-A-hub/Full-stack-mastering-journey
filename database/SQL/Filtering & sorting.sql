create database task_achvmn;
use task_achvmn;
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    marks INT
);

INSERT INTO students (id, name, age, gender, marks) VALUES
(1, 'Alice', 18, 'Female', 88),
(2, 'Bob', 20, 'Male', 75),
(3, 'Charlie', 19, 'Male', 60),
(4, 'Diana', 21, 'Female', 92),
(5, 'Evan', 18, 'Male', 45),
(6, 'Fiona', 22, 'Female', 78),
(7, 'George', 23, 'Male', 90),
(8, 'Hannah', 20, 'Female', 66),
(9, 'Ivan', 21, 'Male', 54),
(10, 'Julia', 19, 'Female', 81);

select *from students;

/* Get all female students. */
/*Get all students with marks greater than 70.*/
/*Sort students by age in ascending order.*/
/*Get students aged 20.*/
/*Sort students by name alphabetically.*/

select * from students where gender="female";
select * from students where marks>70;
select * from students order by age asc;
select * from students where age=20;
select * from students order by `name` asc;

/*Get top 3 scoring students.
Get male students younger than 21 and sort by marks descending.
Get 2nd and 3rd top scorers using OFFSET.
Get all students between ages 19 and 22.
Get female students with marks between 70 and 90.*/

select*from students order by marks desc limit 3 ;
select*from students where gender="male" and age<21 order by marks desc;
select*from students order by marks desc limit 2 offset 1;
select*from students where age between 19 and 22;
select*from students where gender="female" and marks between 70 and 90;

/*Get students whose names start with 'A' and end with 'e', and marks above 70, sorted by name.
Show page 2 of students sorted by marks (2 per page).
Get the youngest student who scored more than 80.
List top 5 students with gender and marks, sorted by gender then marks.
Get average marks of male students above 18.*/

select *from students where `name` like 'A%' or 'name'  like '%e'and marks>70 order by name asc;
select*from students limit 2,2;
select*from students where marks>80 order by age asc limit 1;
select `name`,gender,marks from students limit 5;
select count(gender),gender,avg(marks) as avg_mark from students where gender="male" and age>18;

select*from students