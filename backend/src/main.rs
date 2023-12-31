mod database;
mod services {
  pub mod books;
}

mod routes {
  pub mod books;
  pub mod index;
}

mod models {
  pub mod book;
}

mod utils {
  pub mod error;
}

use std::net::SocketAddr;
use axum::Router;

pub use self::utils::error::{Error, Result};

use crate::routes::{books::book_routes, index::base_routes};

#[tokio::main]
async fn main() {
    let app = Router::new()
      .merge(base_routes())
      .merge(book_routes());

    let addr = SocketAddr::from(([127, 0, 0, 1], 8080));
    println!("Listening on {addr}\n");
    axum::Server::bind(&addr).serve(app.into_make_service()).await.unwrap();
}
