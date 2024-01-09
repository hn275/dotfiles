use std::{
    io::{self, Error, ErrorKind},
    process::{Command, Stdio},
};

fn main() -> io::Result<()> {
    let df = Command::new("df")
        .arg("/")
        .stdout(Stdio::piped())
        .spawn()?
        .stdout
        .ok_or_else(|| Error::new(ErrorKind::Interrupted, "`df` returns nothing"))?;

    let awk = Command::new("awk")
        .arg("FNR == 2 { print $5 }")
        .stdin(df)
        .output()?
        .stdout;

    let used = std::str::from_utf8(awk.as_slice())
        .unwrap()
        .replace("\n", "");

    println!("SSD / {}", used);
    return Ok(());
}
