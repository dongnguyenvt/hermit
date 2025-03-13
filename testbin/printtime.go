package main

import (
    "fmt"
    "time"
    "syscall"
)

func main() {
    // Using time.Now()
    currentTime := time.Now()
    fmt.Println("Using time.Now():")
    fmt.Println("Current time:", currentTime)
    fmt.Println("Formatted:", currentTime.Format("2006-01-02 15:04:05"))

    // Using syscall Gettimeofday
    var tv syscall.Timeval
    err := syscall.Gettimeofday(&tv)
    if err != nil {
        fmt.Println("Error getting syscall time:", err)
        return
    }

    // Convert to time.Time
    syscallTime := time.Unix(tv.Sec, tv.Usec*1000)

    fmt.Println("\nUsing syscall Gettimeofday:")
    fmt.Println("Unix timestamp (seconds):", tv.Sec)
    fmt.Println("Current time:", syscallTime)
    fmt.Println("Formatted:", syscallTime.Format("2006-01-02 15:04:05"))
}
