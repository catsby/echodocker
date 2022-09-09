package main

import (
	"fmt"
	"os"
)

func main() {
	workspace := "not set"
	if tmp := os.Getenv("WP_WORKSPACE"); tmp != "" {
		workspace = tmp
	}
	fmt.Println("::::::::::::::::::::::::::::")
	fmt.Println("::::: Workspace:", workspace)
	fmt.Println("::::::::::::::::::::::::::::")
}
