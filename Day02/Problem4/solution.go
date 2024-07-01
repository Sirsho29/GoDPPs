package problem4

import "fmt"

func Solution() {
	var n int

	fmt.Println("Enter a number :")
	fmt.Scanf("%d", &n)

	for i := 0; i < n; i++ {
		fmt.Println(i + 1)
	}
}
