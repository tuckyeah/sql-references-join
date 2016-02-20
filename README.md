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

## Putting the 'Relation' in 'Relational Database'

In conversations about Postgres, SQL and the like,
 you may hear the term **_relational database_** thrown around.
In the previous material on SQL,
 you learned how to create, modify, and destroy rows and tables.
How do 'relationships' (whatever that means) fit into that context?

Suppose that we had two separate tables of information in our database,
`developers` and `lunches` (see below).
Each developer brings their own lunch,
 and none of them want to eat each others' lunches,
 so we have to make sure that each lunch lines up with the right developer.
How might we do that?

**developers**

| id | given_name | surname  | favorite language |
|:--:|:----------:|:--------:|:-----------------:|
|  1 | Antony     | Donovan  | C                 |
|  2 | Jason      | Weeks    | JavaScript        |
|  3 | Jeff       | Horn     | Ruby              |
|  4 | Matt       | Brendzel | LOLCODE           |

**lunches**

| id | main_course                          | side_dish          |
|:--:|:------------------------------------:|:------------------:|
|  1 | salmon and tuna sushi rolls          | chili              |
|  2 | cheese sandwich on gluten-free bread | salad              |
|  3 | roast beef sandwich                  | chips              |
|  4 | chicken sandwich                     | steamed vegetables |

What if we were to put nametags on each of the lunches,
 so that we could know which developer brought which lunch?

**lunches**

| id | developer | main_course                          | side_dish          |
|:--:|:---------:|:------------------------------------:|:------------------:|
|  1 | Jeff      | salmon and tuna sushi rolls          | chili              |
|  2 | Antony    | cheese sandwich on gluten-free bread | salad              |
|  3 | Matt      | roast beef sandwich                  | chips              |
|  4 | Jason     | chicken sandwich                     | steamed vegetables |

We've now associated (i.e. related)
 each `lunch` record with a `developer` record.
But what if another developer with a duplicate name joins the mix?
It might be better to use something unique, like the `id` column, instead.

| id | developer_id | main_course                          | side_dish          |
|:--:|:------------:|:------------------------------------:|:------------------:|
|  1 |            3 | salmon and tuna sushi rolls          | chili              |
|  2 |            1 | cheese sandwich on gluten-free bread | salad              |
|  3 |            4 | roast beef sandwich                  | chips              |
|  4 |            2 | chicken sandwich                     | steamed vegetables |

The `developer_id` column refers to data in the `developers` table,
 but it's actually a column in the `lunches` table.
This is what's known as a **foreign key**.

In terms of actual implementation in an **RDBMS**
 ( _relational database management system_ ),
 a column can be defined as holding foreign keys
 using a modifier on a table definition called a **constraint**.
Some examples of constraints are below.

-   NOT NULL
-   UNIQUE
-   PRIMARY KEY
-   FOREIGN KEY
-   CHECK

Each of these constraints allows you to put some bounds
on the values that can be put into specific columns.
The FOREIGN KEY constraint in particular makes sure that
 values in that column are always valid `id` values
 in the table that the column refers to.

When adding a FOREIGN KEY constraint to a column,
 an INDEX constraint is also usually added to that same column
 in order to speed access to matched rows.
 The combination of FOREIGN KEY and INDEX tells the RDBMS
 how you intend to use the tables you've related.

In the 'developers and lunches' example,
one lunch was associated with one developer.
This is called a **1 to 1** relationship.
However, there are several other possible arangements,
including **1 to (0 or 1)**, **1 to (0+)**, and **(0+) to (0+)**.
The last two are frequently called 'one-to-many' and 'many-to-many';
we'll look at the first of these now, and the second in later materials.

## Create a Database

### Code Along : Create a Database

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

## Create a Foreign Key

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

### Demo : Create a Foreign Key

We'll add a place of birth to people which references a city in the city table.
We'll use born_in_id as the column name, rather than city_id,
 as this is a more semantic name for the column.

### Code Along : Create a Foreign Key

We'll create an addresses table which references the cities table.
Then we'll add a reference from the people table to the addresses table.

### Practice : Create a Foreign Key

We'll add an owner reference to the pets table.

---

## Explicit Relationships Between Different Tables

We'll update or insert rows with appropriate values.
Note that a foreign key constraint will disallow invalid values
 in the referencing column.

-   [UPDATE](http://www.postgresql.org/docs/9.4/static/sql-update.html) -
 detailed documentation of PostgreSQL's version of the SQL `UPDATE` command.
-   [INSERT](http://www.postgresql.org/docs/9.4/static/sql-insert.html) -
 detailed documentation of PostgreSQL's version of the
  SQL `INSERT INTO` command.

### Demo : Explicit Relationships Between Different Tables

We'll set the place of birth for some people.

### Code Along : Explicit Relationships Between Different Tables

We'll insert an address associated with Somerville.
Then we'll bulk load addresses and connect some of them to cities.
After that, we'll set some people's current addresses.

### Practice : Explicit Relationships Between Different Tables

We'll set the owner reference for some pets.
Pick at least two people to be folks with too many pets.

---

## Retrieving Rows Across Related Tables

The `join` allows queries to return associated data from two tables as
 a single row.

-   [Joins Between Tables](http://www.postgresql.org/docs/9.4/static/tutorial-join.html) -
 An introduction to querying multiple tables
-   [SELECT](http://www.postgresql.org/docs/9.4/static/sql-select.html) -
 detailed documentation of PostgreSQL's version of the SQL `SELECT` command.

### Demo : Retrieving Rows Across Related Tables

We'll count all the people by place of birth.
Then we'll look at information about people born in a particular city or cities.

### Code Along : Retrieving Rows Across Related Tables

We'll query people, the associated addresses,
 and the cities associated with those addresses.

### Practice : Retrieving Rows Across Related Tables

Let's check for hoarders.
That's anyone with more than 3 dogs, 4 birds, 5, cats, or 20 fish.

---
