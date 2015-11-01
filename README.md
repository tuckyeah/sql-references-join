![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

# An Introduction to PostgreSQL Foreign Keys

## Instructions

Fork and clone this repository.

## Objectives

By the end of this lesson, students should be able to:

- Add a foreign key reference to an existing table.
- Create a table with a foreign key reference.
- Insert a row which includes a reference to the id of a row in another table.
- Update a row setting a reference to the id of a row in another table.
- Retrieve rows from two tables using a `JOIN` condition

## Prerequisites

- [An introduction to relational databases](https://github.com/ga-wdi-boston/sql-crud)

## Introduction

We've been talking about relational databases but haven't yet specified what constitutes a relationship.

In an RDBMS, relationships between tables are specified with a `FOREIGN KEY` constraint on a column in one table that `REFERENCES` the `PRIMARY KEY` constraint on the `id` column of another table.  An `INDEX` is usually added to the foreign key column to speed access to matched rows.

This reference and index tells the RDBMS how you intend to use related tables.

## Create a database

### Code along

We'll use `sql-join` as the working database.  We'll create it using the **[CREATE DATABASE](http://www.postgresql.org/docs/9.4/static/sql-createdatabase.html)** command with `sql-crud` specified as the template.

```bash
$ psql
```

```sql
psql (9.4.5)
Type "help" for help.

and=&#35; CREATE DATABASE "sql-join" TEMPLATE "sql-crud";
CREATE DATABASE
and=&#35; \c sql-join
You are now connected to database "sql-join" as user "and".
sql-join=&#35;
```

---

## Create a foreign key

- [Constraints](http://www.postgresql.org/docs/9.4/static/ddl-constraints.html) - An overview of the variety of constraints that PostgreSQL provides.
- [CREATE TABLE](http://www.postgresql.org/docs/9.4/static/sql-createtable.html) - detailed documentation of PostgreSQL's version of the SQL `CREATE TABLE` command.
- [ALTER TABLE](http://www.postgresql.org/docs/9.4/static/sql-altertable.html) - detailed documentation of PostgreSQL's version of the SQL `ALTER TABLE` command.
- [Index Introduction](http://www.postgresql.org/docs/9.4/static/indexes-intro.html) - The introductory section of the chapter on indexes in PostgreSQL.
- [CREATE INDEX](http://www.postgresql.org/docs/9.4/static/sql-createindex.html) - detailed documentation of PostgreSQL's version of the SQL `CREATE INDEX` command.

### Demonstration

### Code along

### Practice

---

## Creating an explicit relationship between rows in different tables

- [UPDATE](http://www.postgresql.org/docs/9.4/static/sql-update.html) - detailed documentation of PostgreSQL's version of the SQL `UPDATE` command.
- [INSERT](http://www.postgresql.org/docs/9.4/static/sql-insert.html) - detailed documentation of PostgreSQL's version of the SQL `INSERT INTO` command.

--

## Retrieving rows from two related tables

- [Joins Between Tables](http://www.postgresql.org/docs/9.4/static/tutorial-join.html) - An introduction to querying multiple tables
- [SELECT](http://www.postgresql.org/docs/9.4/static/sql-select.html) - detailed documentation of PostgreSQL's version of the SQL `SELECT` command.

### Demonstration

### Code along

### Practice

---

