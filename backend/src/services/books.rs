use crate::{models::book::{Book, BookPartial}, database::start_db};

pub struct BookService {}

impl BookService {
  pub async fn get_books() -> Result<Vec<Book>, String> {
    let pool = start_db().await.map_err(|_| String::from("Failed to connect to database"))?;
  
    let books = Book::read_all(&pool).await;
  
    match books {
      Ok(arr) => Ok(arr),
      Err(_) => Err(String::from("Failed to fetch books"))
    }
  }
  
  pub async fn add_book(book: BookPartial) -> Result<Book, String> {
    let pool = start_db().await.map_err(|_| String::from("Failed to connect to database"))?;
  
    let new_book = Book::new(book);
  
    match Book::create(&new_book, &pool).await {
      Ok(_) => Ok(new_book),
      Err(_) => Err(String::from("Could not add book"))
    }
  }

  pub async fn delete_book(isbn: &String) -> Result<String, String> {
    let pool = start_db().await.map_err(|_| String::from("Failed to connect to database"))?;

    match Book::delete(&isbn, &pool).await {
      Ok(_) => Ok(isbn.to_string()),
      Err(_) => Err(String::from("Could not delete book"))
    }
  }
}
