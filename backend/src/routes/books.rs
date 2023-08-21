use crate::services::books::BookService;
use axum::{Router, response::{Html, IntoResponse}, routing::get, extract::Path};


pub fn book_routes() -> Router {
  Router::new()
    .route("/books", get(books))
    .route("/book/:title", get(book))
}

async fn books()  -> impl IntoResponse {
  // currently does not return anything
  let books = BookService::get_books().await;
  print!("books {:?}", books);
}

async fn book(Path(title): Path<String>) -> impl IntoResponse {
  Html(format!("<strong>{}</strong>", title))
}