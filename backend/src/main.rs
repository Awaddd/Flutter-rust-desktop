mod database;
mod services {
  pub mod books;
}

mod models {
  pub mod book;
}

use std::error::Error;
use crate::services::books::BookService;

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error>> {
    println!("Hello, world!");

    let books = BookService::get_books().await;
    print!("books {:?}", books);

    Ok(())
}
