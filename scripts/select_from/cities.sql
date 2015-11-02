-- read rows of data about cities
SELECT name
FROM cities
WHERE country = 'US'
  OR country = 'UK'
;
