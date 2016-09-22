[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# An Introduction to PostgreSQL Foreign Key References

In the previous material on SQL we used the phrase "relational database" but
didn't delve into what that means.

We'll begin to cover the topic of "relationships" in database terms now.

## Prerequisites

-   [An introduction to relational databases](https://github.com/ga-wdi-boston/sql-crud)

## Objectives

By the end of this, developers should be able to:

-   Add a foreign key reference to an existing table.
-   Update a row setting a reference to the id of a row in another table.
-   Insert a row which includes a reference to the id of a row in another table.
-   Retrieve rows from two tables using a `JOIN` condition

## Preparation

1.  [Fork and clone](https://github.com/ga-wdi-boston/meta/wiki/ForkAndClone)
    this repository.
1.  Create a new branch, `training`, for your work.
1.  Install dependencies if necessary.

## Modeling relationships

Previously we created tables to hold books for a library, patients for a clinic,
and ingredients for a cookbook.

-   In our library, authors are stored as attributes of books.  Does that make
sense?
-   Who does our clinic need to care for the patients?
-   And what does our cookbook need that includes ingredients?

Let's model (diagram) these new objects (things) and their relationship to our
existing objects (things).

## Creating related tables

### Demonstration: Create and populate an authors table

We'll create SQL scripts in `scripts/library` to add an `authors` table and
populate it from data in the `books` table.

### Code along: Create and populate a doctors table

We'll create scripts in `scripts/clinic` to add a `doctors` table and populate
it from `data/doctors.csv`.

### Lab: Create and populate a recipes table

We'll create scripts in `scripts/cookbook` to add a `recipes` table and populate
using `INSERT` statements.

## Adding references from one table to another

Conventionally, a foreign key reference is named for the singular of the name of
the table being referenced, with the column being referenced appended after an
underscore. So if we're adding a reference to the `cities` table and its `id`
column we'll create a column called `city_id`. However, _this convention should
not be followed when there is a semantically superior name available._

Can you give an example of when this convention isn't appropriate?

### Demonstration: Add an author reference to books

We'll create scripts in `scripts/library` to

-   reference the `id` column of the `authors` table from the `books` table.
-   populate the author reference in the `books` table.
-   remove the `author` column from the books table.

### Code along: Add a doctor reference to patients

We'll create scripts in `scripts/clinic` to

-   reference the `id` column of the `doctors` table from the `patients` table.
-   populate the doctor reference in the `patients` table for a few patients.

### Lab: Add a recipe reference to ingredients

We'll create scripts in `scripts/cookbook` to

-   reference the `id` column of the `recipes` table from the `ingredients`
 table.
-   populate the recipe reference in the `ingredients` table for a few
 ingredients.

Does this relationship seem adequate for handling actual recipes?  Why or why
not?

## Retrieving rows from related tables

### Demonstration: Retrieve information about authors and books

We'll create scripts in `scripts/library` to retrieve books by a set of authors
and authors of certain books.

What happens if we try to `DELETE` an author?

### Code along: Retrieve information about doctors and patients

We'll create scripts in `scripts/clinic` to retrieve patients of certain doctors
and doctors for some patients.

### Lab: Retrieve information about recipes and ingredients

We'll create scripts in `scripts/cookbook` to retrieve ingredients for a recipe.

Later we'll see how to connect multiple recipes to the same ingredients.

## Additional Resources

-   [Constraints](http://www.postgresql.org/docs/9.4/static/ddl-constraints.html) -
 An overview of the variety of constraints that PostgreSQL provides.
-   [CREATE TABLE](http://www.postgresql.org/docs/9.4/static/sql-createtable.html) -
 detailed documentation of PostgreSQL's version of
 the SQL `CREATE TABLE` command.
-   [ALTER TABLE](http://www.postgresql.org/docs/9.4/static/sql-altertable.html) -
 detailed documentation of PostgreSQL's version of the
 SQL `ALTER TABLE` command.
-   [Index Introduction](http://www.postgresql.org/docs/9.4/static/indexes-intro.html) -
 The introductory section of the chapter on indexes in PostgreSQL.
-   [CREATE INDEX](http://www.postgresql.org/docs/9.4/static/sql-createindex.html) -
 detailed documentation of PostgreSQL's version of the
  SQL `CREATE INDEX` command.
-   [UPDATE](http://www.postgresql.org/docs/9.4/static/sql-update.html) -
 detailed documentation of PostgreSQL's version of the SQL `UPDATE` command.
-   [INSERT](http://www.postgresql.org/docs/9.4/static/sql-insert.html) -
 detailed documentation of PostgreSQL's version of the
  SQL `INSERT INTO` command.
-   [Joins Between Tables](http://www.postgresql.org/docs/9.4/static/tutorial-join.html) -
 An introduction to querying multiple tables
-   [SELECT](http://www.postgresql.org/docs/9.4/static/sql-select.html) -
 detailed documentation of PostgreSQL's version of the SQL `SELECT` command.

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
