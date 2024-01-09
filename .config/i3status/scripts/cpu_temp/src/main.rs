use std::{io, process};

fn main() -> io::Result<()> {
    let acpi = process::Command::new("acpi")
        .arg("-t")
        .stdout(process::Stdio::piped())
        .spawn()
        .unwrap();

    let cmd = process::Command::new("awk")
        .arg("{ print $4 }")
        .stdin(process::Stdio::from(acpi.stdout.unwrap()))
        .stdout(process::Stdio::piped())
        .output()
        .unwrap();

    let mut out: f32 = 0.0;
    std::str::from_utf8(&cmd.stdout)
        .unwrap()
        .split("\n")
        .for_each(|temp| {
            if let Ok(n) = temp.parse::<f32>() {
                if n > out {
                    out = n;
                }
            };
        });

    println!("TEMP {:.2}C", out);
    return Ok(());
}
