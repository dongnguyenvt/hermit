#!/bin/bash

HERMIT_LOG_FILE=hermit.log ./target/release/hermit run ls --preemption-timeout 0 -- -la
