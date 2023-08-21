use axum::{response::{IntoResponse, Response}, http::StatusCode};

pub type Result<T> = core::result::Result<T, Error>;

#[derive(Debug)]
pub enum Error {
  DefaultError
}

impl IntoResponse for Error {
  fn into_response(self) -> Response {
    println!("{:?}", self);

    (StatusCode::INTERNAL_SERVER_ERROR, "UNHANDLED_CLIENT_ERORR").into_response()
  }
}