package problem2

import "fmt"

func Solution() {

	fmt.Println("Enter a non-negative integer:")

	var num int
	fmt.Scanf("%d", &num)
	sum := 0

	for num > 0 {
		sum += num % 10
		num /= 10
	}

	fmt.Println("Sum of digits:", sum)
}
