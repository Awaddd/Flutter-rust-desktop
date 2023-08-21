use axum::{Router, response::{Html, IntoResponse}, routing::get};

pub fn base_routes() -> Router {
  Router::new().route("/", get(base_route))
}

async fn base_route() -> impl IntoResponse {
  Html(String::from("Hello World! Connected"))
}