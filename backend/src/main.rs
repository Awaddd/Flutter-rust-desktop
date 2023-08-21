mod database;
mod services {
  pub mod books;
}

mod models {
  pub mod book;
}

use std::net::SocketAddr;
use axum::{Router, response::{Html, IntoResponse}, routing::get};

use crate::services::books::BookService;

#[tokio::main]
async fn main() {
    println!("Hello, world!");

    let app = Router::new()
      .route("/", get(base_route))
      .route("/books", get(books));

    let addr = SocketAddr::from(([127, 0, 0, 1], 8080));

    println!("Listening on {addr}\n");

    axum::Server::bind(&addr).serve(app.into_make_service()).await.unwrap();
}

async fn base_route() -> impl IntoResponse {
  Html(String::from("Hello World! Connected"))
}

async fn books()  -> impl IntoResponse {
  // currently does not return anything
  let books = BookService::get_books().await;
  print!("books {:?}", books);
}