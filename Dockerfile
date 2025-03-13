FROM golang:1.23 AS build

COPY . /build

RUN apt-get update && apt-get install -y libunwind-dev && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh /dev/stdin -y --default-toolchain 1.85.0 --profile minimal

RUN cd /build && . "$HOME/.cargo/env" && \
    ./static.sh

FROM scratch

COPY --from=build /build/target/x86_64-unknown-linux-gnu/release/hermit /hermit
