CREATE TABLE library_books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    published_year INT,
    copies_available INT,
    price DECIMAL(10,2)
);

/*
Create a simple index on the author column.
Create a composite index on category and published_year.
Create a UNIQUE index on title.
Drop the index created on author.
Create a FULLTEXT index on title and author.*/

create index idx_author on library_books(author);
create index idx_category_pubyear on library_books(category,published_year);
create unique index idx_unq_title on library_books(title);
drop index idx_category_pubyear on library_books;
create fulltext index full_txt on library_books(author,title);
select  * from library_books where match(author) against("copy 1");

/*
Create a composite index on author and category in the library_books table.
Create a unique index on isbn in the library_books table.
Drop the composite index you created in Task 1.
Create a full-text index on title and description in the library_books table.
Create an index on published_year in the library_books table.
*/

create index idx_author_catgry on library_books(author,category);
create unique index idx_unq on library_books(price);
drop index idx_category_pubyear on library_books;
create fulltext index idx_flltxt_title_desc on library_books(title,category);
create index idx_pubyear on library_books(published_year);

show indexes from library_books;


