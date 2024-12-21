-- Active: 1730295105050@@127.0.0.1@5432@example@public
/*
Table: RequestAccepted
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
Write a solution to find the people who have the most friends and the most friends number.
The test cases are generated so that only one person has the most friends.
The result format is in the following example.
Example 1:
Input: 
RequestAccepted table:
+--------------+-------------+-------------+
| requester_id | accepter_id | accept_date |
+--------------+-------------+-------------+
| 1            | 2           | 2016/06/03  |
| 1            | 3           | 2016/06/08  |
| 2            | 3           | 2016/06/08  |
| 3            | 4           | 2016/06/09  |
+--------------+-------------+-------------+
Output: 
+----+-----+
| id | num |
+----+-----+
| 3  | 3   |
+----+-----+
Explanation: 
The person with id 3 is a friend of people 1, 2, and 4, so he has three friends in total, which is the most number than any others.
Follow up: In the real world, multiple people could have the same most number of friends. Could you find all these people in this case?
*/

drop table if exists RequestAccepted;

Create table If Not Exists RequestAccepted (
    requester_id int not null,
    accepter_id int null,
    accept_date date null
);

Truncate table RequestAccepted;

-- Test case 1
insert into
    RequestAccepted (
        requester_id,
        accepter_id,
        accept_date
    )
values ('1', '2', '2016/06/03'),
    ('1', '3', '2016/06/08'),
    ('2', '3', '2016/06/08'),
    ('3', '4', '2016/06/09');

-- Test case 2
insert into
    RequestAccepted (
        requester_id,
        accepter_id,
        accept_date
    )
values (8, 4, '2016-10-10'),
    (4, 9, '2016-10-06'),
    (4, 10, '2016-08-11'),
    (4, 11, '2016-05-27'),
    (4, 14, '2016-11-14'),
    (15, 4, '2016-11-29'),
    (4, 18, '2016-07-12'),
    (4, 20, '2016-07-25'),
    (10, 13, '2016-02-01'),
    (10, 17, '2016-07-17'),
    (10, 21, '2016-02-15'),
    (23, 10, '2016-12-14'),
    (10, 25, '2016-02-23'),
    (10, 29, '2016-06-12'),
    (10, 30, '2016-07-28'),
    (10, 34, '2016-04-24'),
    (13, 11, '2016-09-04'),
    (16, 11, '2016-10-09'),
    (11, 18, '2016-08-19'),
    (11, 21, '2016-12-20'),
    (11, 24, '2016-09-28'),
    (27, 11, '2016-02-15'),
    (11, 31, '2016-01-17'),
    (33, 11, '2016-01-28'),
    (14, 17, '2016-06-28'),
    (20, 14, '2016-01-04'),
    (21, 14, '2016-04-09'),
    (14, 25, '2016-08-15'),
    (28, 14, '2016-01-07'),
    (14, 29, '2016-03-27'),
    (33, 14, '2016-08-28'),
    (34, 14, '2016-02-27'),
    (17, 19, '2016-01-11'),
    (17, 21, '2016-07-08'),
    (22, 17, '2016-04-28'),
    (23, 17, '2016-03-21'),
    (17, 24, '2016-01-21'),
    (17, 28, '2016-02-18'),
    (31, 17, '2016-03-30'),
    (17, 34, '2016-06-17');

-- Solution
select id, count(*) as num
from (
        select
            requester_id as id, accepter_id as friend_id
        from requestaccepted
        union all
        select
            accepter_id as id, requester_id as friend_id
        from requestaccepted
    ) as friendship
group by
    id
order by num desc
limit 1;