![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

# An Introduction to PostgreSQL Foreign Keys

## Instructions

Fork and clone this repository.

## Objectives

By the end of this lesson, students should be able to:

-   Add a foreign key reference to an existing table.
-   Create a table with a foreign key reference.
-   Insert a row which includes a reference to the id of a row in another table.
-   Update a row setting a reference to the id of a row in another table.
-   Retrieve rows from two tables using a `JOIN` condition

## Prerequisites

-   [An introduction to relational databases](https://github.com/ga-wdi-boston/sql-crud)

## Introduction

We've been talking about relational databases but haven't yet
 specified what constitutes a relationship.

In an RDBMS, relationships between tables are specified with a `FOREIGN KEY`
 constraint on a column in one table that `REFERENCES` the `PRIMARY KEY`
 constraint on the `id` column of another table.
An `INDEX` is usually added to the foreign key column
 to speed access to matched rows.

This reference and index tells the RDBMS how you intend to use related tables.

There are a number of standard cardinalities for relationships:
 1-to-1, 1-to-(0 or 1), 1-to-(0 or more), and (0 or more)-to-(0 or more).
The last two are more frequently called 1-to-many and many-to-many.
We'll look at this last type of relationship in a following lesson.

## Create a database

### Code along

We'll use `sql-join` as the working database.  We'll create it using the **[CREATE DATABASE](http://www.postgresql.org/docs/9.4/static/sql-createdatabase.html)** command with `sql-crud` specified as the template.

```bash
psql
```

```sql
psql (9.4.5)
Type "help" for help.

and=> CREATE DATABASE "sql-join" TEMPLATE "sql-crud";
CREATE DATABASE
and=> \c sql-join
You are now connected to database "sql-join" as user "and".
sql-join=>
```

---

## Create a foreign key

We'll use the convention that a foreign key should be named for the singular of
 the table referenced with the column referenced appended after an underscore.
So, if we're adding a reference to the `cities` table and its `id` column we'll
 create a column called `city_id`.  This convention should not be followed when
 there is a semantically superior name available.

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

### Demonstration

We'll add a place of birth to people which references a city in the city table.
We'll use born_in_id as the column name, rather than city_id,
 as this is a more semantic name for the column.

### Code along

We'll create an addresses table which references the cities table.
Then we'll add a reference from the people table to the addresses table.

### Practice

We'll add an owner reference to the pets table.

---

## Creating explicit relationships between rows in different tables

We'll update or insert rows with appropriate values.
Note that a foreign key constraint will disallow invalid values
 in the referencing column.

-   [UPDATE](http://www.postgresql.org/docs/9.4/static/sql-update.html) -
 detailed documentation of PostgreSQL's version of the SQL `UPDATE` command.
-   [INSERT](http://www.postgresql.org/docs/9.4/static/sql-insert.html) -
 detailed documentation of PostgreSQL's version of the
  SQL `INSERT INTO` command.

### Demonstration

We'll set the place of birth for some people.

### Code along

We'll insert an address associated with Somerville.
Then we'll bulk load addresses and connect some of them to cities.
After that, we'll set some people's current addresses.

### Practice

We'll set the owner reference for some pets.
Pick at least two people to be folks with too many pets.

---

## Retrieving rows from two related tables

The `join` allows queries to return associated data from two tables as
 a single row.

-   [Joins Between Tables](http://www.postgresql.org/docs/9.4/static/tutorial-join.html) -
 An introduction to querying multiple tables
-   [SELECT](http://www.postgresql.org/docs/9.4/static/sql-select.html) -
 detailed documentation of PostgreSQL's version of the SQL `SELECT` command.

### Demonstration

We'll count all the people by place of birth.
Then we'll look at information about people born in a particular city or cities.

### Code along

We'll query people, the associated addresses,
 and the cities associated with those addresses.

### Practice

Let's check for hoarders.
That's anyone with more than 3 dogs, 4 birds, 5, cats, or 20 fish.

---
