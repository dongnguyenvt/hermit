#!/bin/bash

go build -o testbin/thread ./testbin/thread.go
go build -o testbin/printtime ./testbin/printtime.go
go build -o testbin/rand ./testbin/rand.go
gcc -o testbin/tsc -Os -static testbin/tsc.c
