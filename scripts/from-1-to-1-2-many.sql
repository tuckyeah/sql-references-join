create table books(id serial primary key, title text, author text);
insert into books(title, author) values
  ('1984', 'George Orwell'),
  ('Animal Farm', 'George Orwell'),
  ('Starship Troopers', 'Robert Heinlein');
select distinct author from books;
create table authors(id serial primary key, name text);
insert into authors(name) select distinct author from books;
create index books_author_id_fk on books(author_id);
select b.title, a.name from books b inner join authors a on b.author = a.name;
alter table books add author_id integer references authors(id);
update books b set author_id = a.id from authors a where a.name = b.author;
alter table books drop column author;
select b.title, a.author
from books b
inner join author a
on b.author_id = a.id;
