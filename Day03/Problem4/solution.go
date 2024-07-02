package problem4

import "fmt"

func Solution() {
	var num int

	fmt.Println("Enter an integer:")
	fmt.Scanf("%d", &num)

	for i := 1; i <= 10; i++ {
		fmt.Printf("%d * %d = %d\n", num, i, num*i)
	}
}
