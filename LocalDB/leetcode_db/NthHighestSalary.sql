-- https://leetcode.com/problems/nth-highest-salary/
DROP TABLE IF EXISTS Employee;

Create table If Not Exists Employee (Id int, Salary int);
Truncate table Employee;
insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');


CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
	IF N <= 0 THEN
		RETURN;
	END IF;

	RETURN QUERY (
		SELECT DISTINCT e.salary
		FROM employee e
		ORDER BY e.salary DESC
		OFFSET N - 1
		LIMIT 1
	);
END;
$$ LANGUAGE plpgsql;


SELECT NthHighestSalary(0);