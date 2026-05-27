-- https://leetcode.com/problems/second-highest-salary/description/
DROP TABLE IF EXISTS Employee;

Create table If Not Exists Employee (id int, salary int);
Truncate table Employee;
insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '100');
insert into Employee (id, salary) values ('3', '300');


SELECT * FROM employee;


SELECT MAX(salary) AS "SecondHighestSalary"
FROM employee
WHERE salary <> (SELECT MAX(salary) FROM employee);