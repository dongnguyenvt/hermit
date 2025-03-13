FROM rust:1.85.0-bookworm AS build

COPY . /build

RUN apt-get update && apt-get install -y libunwind-dev

RUN cd /build && ./static.sh

FROM scratch

COPY --from=build /build/target/x86_64-unknown-linux-gnu/release/hermit /hermit

ENTRYPOINT [ "/hermit" ]
