package main

import (
	"fmt"
	"net"
)

func main() {
	listener, err := net.Listen("tcp", ":0")
	if err != nil {
		panic(err)
	}

	fmt.Print(listener.Addr().(*net.TCPAddr).Port)
}
