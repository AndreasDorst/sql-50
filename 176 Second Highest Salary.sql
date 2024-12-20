/*
Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
Example 2:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+
*/

-- Create table Employee
Create table If Not Exists Employee (id int, salary int);
Truncate table Employee;

-- Dataset 1
insert into Employee (id, salary)
values
('1', '100'),
('2', '200'),
('3', '300');

-- Dataset 2
insert into Employee (id, salary) values (1, 100);

-- Dataset
insert into Employee (id, salary)
values 
('1', '100'),
('2', '200');

-- Dataset 8
insert into Employee (id, salary)
values
('1', '100'),
('2', '100');

-- Test query
select dense_rank() over (order by salary desc) as rank,
    salary
from Employee;

-- Query
with rankedEmployee as (
    select dense_rank() over (order by salary desc) as rank,
        salary
    from Employee
)
select (
    select salary
    from rankedEmployee
    where rank = 2
    limit 1
) as SecondHighestSalary;


-- Second solution
select (
    select distinct salary
    from Employee
    order by salary desc
    limit 1 offset 1
) as SecondHighestSalary;