use std::{error::Error};
use std::env;

const DEFAULT_FLAG: &str = "flag{DEFAULT_FLAG_PLEASE_SET_ONE}";

fn main() -> Result<(), Box<dyn Error>> {
    let flag = env::var("FLAG").unwrap_or_else(|_| DEFAULT_FLAG.to_string());

    println!("Hello from Rust!");
    println!("{}", flag);

    Ok(())
}
