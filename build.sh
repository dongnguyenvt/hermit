#!/bin/bash

RUSTC_BOOTSTRAP=1 RUSTFLAGS="-C link-arg=-llzma" cargo build --target x86_64-unknown-linux-gnu --release