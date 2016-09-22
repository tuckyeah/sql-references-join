INSERT INTO authors (name) -- 'name' is the target column we'll be entering into
SELECT DISTINCT author
FROM books
ORDER BY author;
