#!/bin/bash

RUSTC_BOOTSTRAP=1 RUSTFLAGS="-C link-arg=-Wl,-allow-multiple-definition -C link-arg=/usr/lib/x86_64-linux-gnu/liblzma.a -C relocation-model=static -C target-feature=+crt-static" cargo build --target x86_64-unknown-linux-gnu --release
