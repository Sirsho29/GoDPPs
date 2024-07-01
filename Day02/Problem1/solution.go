package problem1

import "fmt"

func Solution() {
	var name string
	fmt.Print("Enter your name: ")
	fmt.Scanln(&name)
	fmt.Println("Hello, " + name + "!")
}
