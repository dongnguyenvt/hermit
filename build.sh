#!/bin/bash

#rustup override set stable
RUSTC_BOOTSTRAP=1 RUSTFLAGS="-C link-arg=-llzma" cargo build --release

# build test binary
go build -o testbin/thread ./testbin/thread.go
go build -o testbin/printtime ./testbin/printtime.go
