/*
Table: Products

+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| product_id       | int     |
| product_name     | varchar |
| product_category | varchar |
+------------------+---------+
product_id is the primary key (column with unique values) for this table.
This table contains data about the company's products.
 

Table: Orders

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| order_date    | date    |
| unit          | int     |
+---------------+---------+
This table may have duplicate rows.
product_id is a foreign key (reference column) to the Products table.
unit is the number of products ordered in order_date.
 

Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Products table:
+-------------+-----------------------+------------------+
| product_id  | product_name          | product_category |
+-------------+-----------------------+------------------+
| 1           | Leetcode Solutions    | Book             |
| 2           | Jewels of Stringology | Book             |
| 3           | HP                    | Laptop           |
| 4           | Lenovo                | Laptop           |
| 5           | Leetcode Kit          | T-shirt          |
+-------------+-----------------------+------------------+
Orders table:
+--------------+--------------+----------+
| product_id   | order_date   | unit     |
+--------------+--------------+----------+
| 1            | 2020-02-05   | 60       |
| 1            | 2020-02-10   | 70       |
| 2            | 2020-01-18   | 30       |
| 2            | 2020-02-11   | 80       |
| 3            | 2020-02-17   | 2        |
| 3            | 2020-02-24   | 3        |
| 4            | 2020-03-01   | 20       |
| 4            | 2020-03-04   | 30       |
| 4            | 2020-03-04   | 60       |
| 5            | 2020-02-25   | 50       |
| 5            | 2020-02-27   | 50       |
| 5            | 2020-03-01   | 50       |
+--------------+--------------+----------+
Output: 
+--------------------+---------+
| product_name       | unit    |
+--------------------+---------+
| Leetcode Solutions | 130     |
| Leetcode Kit       | 100     |
+--------------------+---------+
Explanation: 
Products with product_id = 1 is ordered in February a total of (60 + 70) = 130.
Products with product_id = 2 is ordered in February a total of 80.
Products with product_id = 3 is ordered in February a total of (2 + 3) = 5.
Products with product_id = 4 was not ordered in February 2020.
Products with product_id = 5 is ordered in February a total of (50 + 50) = 100.
*/

create table if not exists products (product_id int, product_name varchar(40), product_category varchar(40));
create table if not exists orders (product_id int, order_date date, unit int);
delete from products;
insert into products (product_id, product_name, product_category) values ('1', 'leetcode solutions', 'book');
insert into products (product_id, product_name, product_category) values ('2', 'jewels of stringology', 'book');
insert into products (product_id, product_name, product_category) values ('3', 'hp', 'laptop');
insert into products (product_id, product_name, product_category) values ('4', 'lenovo', 'laptop');
insert into products (product_id, product_name, product_category) values ('5', 'leetcode kit', 't-shirt');
delete from orders;
insert into orders (product_id, order_date, unit) values ('1', '2020-02-05', '60');
insert into orders (product_id, order_date, unit) values ('1', '2020-02-10', '70');
insert into orders (product_id, order_date, unit) values ('2', '2020-01-18', '30');
insert into orders (product_id, order_date, unit) values ('2', '2020-02-11', '80');
insert into orders (product_id, order_date, unit) values ('3', '2020-02-17', '2');
insert into orders (product_id, order_date, unit) values ('3', '2020-02-24', '3');
insert into orders (product_id, order_date, unit) values ('4', '2020-03-01', '20');
insert into orders (product_id, order_date, unit) values ('4', '2020-03-04', '30');
insert into orders (product_id, order_date, unit) values ('4', '2020-03-04', '60');
insert into orders (product_id, order_date, unit) values ('5', '2020-02-25', '50');
insert into orders (product_id, order_date, unit) values ('5', '2020-02-27', '50');
insert into orders (product_id, order_date, unit) values ('5', '2020-03-01', '50');

-- Query
select product_name,
	sum(unit) as unit
from Products
join Orders using(product_id)
where order_date between '2020-02-01' and '2020-02-29'
group by product_name
having sum(unit) >= 100;