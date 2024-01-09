use std::{io, process};

fn main() -> io::Result<()> {
    let mpstat = process::Command::new("mpstat")
        .stdout(process::Stdio::piped())
        .spawn()?;

    let grep = process::Command::new("grep")
        .arg("all")
        .stdin(
            mpstat
                .stdout
                .ok_or_else(|| io::Error::new(io::ErrorKind::Interrupted, "can't pipe stdout"))?,
        )
        .stdout(process::Stdio::piped())
        .spawn()?;

    let usage = process::Command::new("awk")
        .arg("{ print $3 }") // the `%usr` column
        .stdin(
            grep.stdout
                .ok_or_else(|| io::Error::new(io::ErrorKind::Interrupted, "can't pipe stdout"))?,
        )
        .output()?
        .stdout;

    let output = std::str::from_utf8(usage.as_slice())
        .map_err(|err| io::Error::new(io::ErrorKind::InvalidData, err.to_string()))?
        .trim();
    println!("CPU {}%", output);

    return Ok(());
}
