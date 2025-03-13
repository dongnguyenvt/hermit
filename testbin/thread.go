package main

import (
	"fmt"
	"runtime"
	"sync"
	"syscall"
)

func printThreadInfo(wg *sync.WaitGroup) {
	defer wg.Done()

	// Lock this goroutine to an OS thread
	runtime.LockOSThread()
	defer runtime.UnlockOSThread()

	// Get the Goroutine ID (via stack trace)
	buf := make([]byte, 1024)
	n := runtime.Stack(buf, false)

	// Get the OS thread ID
	tid := syscall.Gettid()

	fmt.Printf("Goroutine ID: %s", buf[:n])
	fmt.Printf("OS Thread ID: %d\n", tid)
}

func main() {
	var wg sync.WaitGroup
	wg.Add(1)

	go printThreadInfo(&wg)

	wg.Wait()
	fmt.Println("Main thread exiting.")
}
