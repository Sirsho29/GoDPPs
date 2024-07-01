package problem3

import "fmt"

func Solution() {
	// Input two integers as input and prints the larger of the two numbers.
	var var1, var2 int

	fmt.Println("Enter two integers: ")
	fmt.Scanf("%d", &var1)
	fmt.Scanf("%d", &var2)

	if var1 > var2 {
		fmt.Printf("%d is larger", var1)
	} else {
		fmt.Printf("%d is larger", var2)
	}
}
