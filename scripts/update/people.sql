-- update rows of data about people
UPDATE people
SET weight = weight - 1
WHERE given_name LIKE 'Sam%'
;
