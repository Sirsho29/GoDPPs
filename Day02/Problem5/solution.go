package problem5

import "fmt"

func Solution() {
	var n int

	fmt.Println("Enter a number :")
	fmt.Scanf("%d", &n)

	sum := n * (n + 1) / 2

	fmt.Println("Sum is :", sum)
}
