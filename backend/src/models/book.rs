use std::error::Error;
use axum::Json;
use sqlx::Row;
use serde::{Serialize, Deserialize};
use uuid::Uuid;

#[derive(Debug, Serialize, Deserialize)]
pub struct Book {
  pub title: String,
  pub author: String,
  pub isbn: String,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct BookPartial {
  pub title: String,
  pub author: String,
}

impl Book {
  pub fn new(book: BookPartial) -> Book {
    Book {
      title: book.title,
      author: book.author,
      isbn: Uuid::new_v4().to_string(),
    }
  }

  pub fn from_axum(book: Json<Book>) -> Book {
    Book {
      title: book.title.to_string(),
      author: book.author.to_string(),
      isbn: book.isbn.to_string(),
    }
  }

  // db functions
  pub async fn read(pool: &sqlx::PgPool) -> Result<Book, Box<dyn Error>> {
    let query = sqlx::query("SELECT title, author, isbn FROM book");
    
    let row = query.fetch_one(pool).await?;
  
    let book = Book {
      title: row.get("title"),
      author: row.get("author"),
      isbn: row.get("isbn"),
    };
  
    Ok(book)
  }
  
  pub async fn read_all(pool: &sqlx::PgPool) -> Result<Vec<Book>, Box<dyn Error>> {
    let query = sqlx::query("SELECT title, author, isbn FROM book");
  
    let rows = query.fetch_all(pool).await?;
  
    let mut books = vec![];
  
    for row in rows.iter() {
      let book = Book {
        title: row.get("title"),
        author: row.get("author"),
        isbn: row.get("isbn"),
      };
  
      books.push(book);
    }
  
    Ok(books)
  }

  pub async fn create(book: &Book, pool: &sqlx::PgPool) -> Result<(), Box<dyn Error>> {
    let query = "INSERT INTO book (title, author, isbn) VALUES ($1, $2, $3)";
  
    sqlx::query(query)
      .bind(&book.title)
      .bind(&book.author)
      .bind(&book.isbn)
      .execute(pool)
      .await?;

    Ok(())
  }
  
  pub async fn update(book: &Book, pool: &sqlx::PgPool) -> Result<(), Box<dyn Error>> {
    let query = "UPDATE book SET title = $1, author = $2 WHERE isbn = $3";
  
    sqlx::query(query)
      .bind(&book.title)
      .bind(&book.author)
      .bind(&book.isbn)
      .execute(pool)
      .await?;
  
    Ok(())
  }

  pub async fn delete(isbn: &String, pool: &sqlx::PgPool) -> Result<(), Box<dyn Error>> {
    let query = "DELETE FROM book WHERE isbn = $1";

    sqlx::query(query).bind(&isbn).execute(pool).await?;

    Ok(())
  }
}

impl BookPartial {
  pub fn new(book: Json<BookPartial>) -> BookPartial {
    BookPartial {
      title: book.title.to_string(),
      author: book.author.to_string(),
    }
  }
}
