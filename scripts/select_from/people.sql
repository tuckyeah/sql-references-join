-- read rows of data about people
SELECT COUNT(*) as num, gender
FROM people
GROUP BY gender
HAVING num > 1202;

SELECT COUNT(*)
FROM people
WHERE dob BETWEEN '1990-01--1' AND '1999-12-31'
GROUP BY SUBSTR(dob, 1, 4)
ORDER BY SUBSTR(dob, 1, 4);

SELECT id, surname, dob
FROM people
WHERE given_name LIKE 'Sam%'
;
