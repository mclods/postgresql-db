-- https://leetcode.com/problems/department-highest-salary/
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

Create table If Not Exists Employee (id int, name varchar(255), salary int, departmentId int);
Create table If Not Exists Department (id int, name varchar(255));
Truncate table Employee;
insert into Employee (id, name, salary, departmentId) values ('1', 'Joe', '70000', '1');
insert into Employee (id, name, salary, departmentId) values ('2', 'Jim', '90000', '1');
insert into Employee (id, name, salary, departmentId) values ('3', 'Henry', '80000', '2');
insert into Employee (id, name, salary, departmentId) values ('4', 'Sam', '60000', '2');
insert into Employee (id, name, salary, departmentId) values ('5', 'Max', '90000', '1');
Truncate table Department;
insert into Department (id, name) values ('1', 'IT');
insert into Department (id, name) values ('2', 'Sales');


SELECT d.name AS department, e1.name AS employee, e1.salary AS salary
FROM employee e1
INNER JOIN department d
ON e1.departmentId = d.id
WHERE e1.salary = (
	SELECT MAX(e2.salary)
	FROM employee e2
	WHERE e2.departmentId = e1.departmentId
);
