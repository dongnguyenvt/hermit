#!/bin/bash

RUSTC_BOOTSTRAP=1 RUSTFLAGS="-C link-arg=-llzma" cargo build --target x86_64-unknown-linux-gnu --release

# build test binary
go build -o testbin/thread ./testbin/thread.go
go build -o testbin/printtime ./testbin/printtime.go
gcc -o testbin/tsc -Os -static testbin/tsc.c