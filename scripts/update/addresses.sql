-- update addresses table
UPDATE addresses AS a
  SET city_id = c.id
    FROM cities AS c
      WHERE c.id = a.id AND city_id IS NULL
;
UPDATE addresses AS a
  SET city_id = c.id
    FROM cities AS c
      WHERE (c.id+236) = a.id AND city_id IS NULL
;
