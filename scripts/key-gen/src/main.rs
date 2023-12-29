extern crate rand;
use base64::{engine, Engine as _};
use rand::RngCore;
use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();

    let mut char_count: usize = 32; // default to 32 bytes
    if args.len() == 2 {
        let feed_cout = &args[1];
        char_count = feed_cout
            .parse()
            .expect(format!("failed to convert {} to u8", args[1]).as_str());
    } else if args.len() != 1 {
        eprintln!("invalid args.");
        std::process::exit(1);
    }

    let mut buf = vec![0u8; ((char_count as f32) / 1.3) as usize];
    let mut rng = rand::thread_rng();
    rng.fill_bytes(&mut buf);

    let encoded = engine::general_purpose::STANDARD_NO_PAD.encode(&buf);
    println!("{}", encoded);
    std::process::exit(0);
}
