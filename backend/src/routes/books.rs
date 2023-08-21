use crate::models::book::{Book, BookPartial};
use crate::{Error, Result};
use crate::services::books::BookService;
use axum::routing::{post, delete};
use axum::{Router, response::{Html, IntoResponse}, routing::get, extract::Path, Json};
use serde_json::{Value, json};

pub fn book_routes() -> Router {
  Router::new()
    .route("/books", get(books))
    .route("/book/:title", get(book))
    .route("/book", post(add_book))
    .route("/book/delete/:isbn", delete(delete_book))
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

  if let Ok(book) = BookService::add_book(BookPartial::new(payload)).await {
    let body = Json(json!({
      "data": {
        "book": book
      }
    }));

    Ok(body)
  } else {
    Err(Error::DefaultError)
  }
}

async fn delete_book(Path(isbn): Path<String>) -> Result<Json<Value>> {
  if let Ok(deleted_isbn) = BookService::delete_book(&isbn).await {
    let body = Json(json!({
      "deleted": deleted_isbn
    }));

    Ok(body)
  } else {
    Err(Error::DefaultError)
  }
}