#!/bin/bash

./target/release/hermit run --preemption-timeout 0 ./target/release/hello_race
./target/release/hermit run --preemption-timeout 0 testbin/thread
./target/release/hermit run --preemption-timeout 0 testbin/printtime
./target/release/hermit run --preemption-timeout 0 testbin/tsc
