create table book (
  title varchar not null,
  author varchar not null,
  isbn varchar not null
);

create unique index book_isbn_indx on book(isbn);