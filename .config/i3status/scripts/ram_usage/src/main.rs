use std::{io, process};

fn main() -> io::Result<()> {
    let stdout = process::Command::new("free").arg("-m").output()?.stdout;

    let output: Vec<&str> = std::str::from_utf8(stdout.as_slice())
        .map_err(|err| io::Error::new(io::ErrorKind::InvalidData, err.to_string()))?
        .split("\n")
        .filter_map(|line| {
            if line.len() == 0 {
                return None;
            }
            return Some(line.trim());
        })
        .collect();
    dbg!(&output);

    let mem: Vec<u32> = output[1]
        .split(" ")
        .filter_map(|c| {
            if c.len() == 0 {
                return None;
            }
            return match c.parse::<u32>() {
                Ok(num) => Some(num),
                Err(_) => None,
            };
        })
        .collect();
    dbg!(&mem);

    let swap: Vec<u32> = output[2]
        .split(" ")
        .filter_map(|c| {
            if c.len() == 0 {
                return None;
            }
            return match c.parse::<u32>() {
                Ok(n) => Some(n),
                Err(_) => None,
            };
        })
        .collect();
    let swap = swap[1].math(swap[0]);
    let mem = mem[1].math(mem[0]);

    println!("MEM {:.2}%|SWAP {:.2}%", mem, swap);

    return Ok(());
}

trait Percentage {
    fn math(&self, other: u32) -> f32;
}

impl Percentage for u32 {
    fn math(&self, other: u32) -> f32 {
        return (*self as f32) * 100.00 / (other as f32);
    }
}
