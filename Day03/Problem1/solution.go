package problem1

import "fmt"

func Solution() {
	var str string

	fmt.Println("Enter a string:")
	fmt.Scanln(&str)

	var rev string

	for i := 0; i < len(str); i++ {
		// print each character in reverse order
		rev += string(str[len(str)-i-1])
	}

	fmt.Println("Reversed string:", rev)

}
