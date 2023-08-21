use crate::models::book::{Book, BookPartial};
use crate::{Error, Result};
use crate::services::books::BookService;
use axum::routing::post;
use axum::{Router, response::{Html, IntoResponse}, routing::get, extract::Path, Json};
use serde_json::{Value, json};

pub fn book_routes() -> Router {
  Router::new()
    .route("/books", get(books))
    .route("/book/:title", get(book))
    .route("/book", post(add_book))
}

async fn books() -> Result<Json<Value>> {
  // currently does not return anything
  let books = BookService::get_books().await;

  if let Ok(b) = books {
    let response = Json(json!({
      "data": {
        "books": b
      }
    }));
    
    Ok(response)
  } else {
    Err(Error::DefaultError)
  }

}

async fn book(Path(title): Path<String>) -> impl IntoResponse {
  Html(format!("<strong>{}</strong>", title))
}

async fn add_book(payload: Json<BookPartial>) -> Result<Json<Value>> {
  println!("Adding {} {}", payload.title, payload.author);

  let book = Book::new(BookPartial::new(payload));
  
  let body = Json(json!({
    "data": {
      "book": book
    }
  }));

  Ok(body)
}