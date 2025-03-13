package main

import (
	"crypto/rand"
	"fmt"
	"log"
	"math/big"
	mrand "math/rand/v2"
)

func main() {
	fmt.Println("Generating 5 random numbers using math/rand/v2:")
	for i := 0; i < 5; i++ {
		mathRandNum := mrand.IntN(100) // Random number between 0 and 99
		fmt.Printf("math/rand/v2 [%d]: %d\n", i+1, mathRandNum)
	}

	fmt.Println("\nGenerating 5 random numbers using crypto/rand:")
	for i := 0; i < 5; i++ {
		cryptoRandNum, err := rand.Int(rand.Reader, big.NewInt(100))
		if err != nil {
			log.Fatal("Error generating crypto/rand number:", err)
		}
		fmt.Printf("crypto/rand [%d]: %d\n", i+1, cryptoRandNum)
	}
}
