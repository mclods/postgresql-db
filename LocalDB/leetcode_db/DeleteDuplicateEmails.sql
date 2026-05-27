-- https://leetcode.com/problems/delete-duplicate-emails/
DROP TABLE IF EXISTS Person;

Create table If Not Exists Person (Id int, Email varchar(255));
Truncate table Person;
insert into Person (id, email) values ('1', 'john@example.com');
insert into Person (id, email) values ('2', 'bob@example.com');
insert into Person (id, email) values ('3', 'john@example.com');


DELETE FROM Person
WHERE id NOT IN (
	SELECT MIN(id)
	FROM Person
	GROUP BY email
);


SELECT * FROM Person;