-- https://leetcode.com/problems/consecutive-numbers/description/

DROP TABLE IF EXISTS Logs;

Create table If Not Exists Logs (id int, num int);
Truncate table Logs;
insert into Logs (id, num) values ('1', '1');
insert into Logs (id, num) values ('2', '1');
insert into Logs (id, num) values ('3', '1');
insert into Logs (id, num) values ('4', '2');
insert into Logs (id, num) values ('5', '1');
insert into Logs (id, num) values ('6', '2');
insert into Logs (id, num) values ('7', '2');


WITH nums_prev_nums AS (
	SELECT id, num, LAG(num) OVER (ORDER BY id) AS prev_num
	FROM logs
),
nums_prev_nums_prev_prev_nums AS (
	SELECT num, prev_num, LAG(prev_num) OVER (ORDER BY id) AS prev_prev_num
	FROM nums_prev_nums
)
SELECT DISTINCT num AS consecutivenums
FROM nums_prev_nums_prev_prev_nums
WHERE num = prev_num AND prev_num = prev_prev_num;

