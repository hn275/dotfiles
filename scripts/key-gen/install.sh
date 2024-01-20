rm -fr ./target
cargo build --release
ln -Pf ./target/release/key-gen $HOME/.local/bin/key-gen
