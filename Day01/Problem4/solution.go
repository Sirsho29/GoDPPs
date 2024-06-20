package problem4

import "fmt"

func Solution() {
	var num1, num2, choice int

	fmt.Println("Enter the first number: ")
	fmt.Scanf("%d", &num1)

	fmt.Println("Enter the second number: ")
	fmt.Scanf("%d", &num2)

	fmt.Println("Enter operator: \n1: +\n2: -\n3: *\n4: /")
	fmt.Scanf("%d", &choice)

	switch choice {
	case 1:
		fmt.Println("Result:", num1+num2)
	case 2:
		fmt.Println("Result:", num1-num2)
	case 3:
		fmt.Println("Result:", num1*num2)
	case 4:
		fmt.Println("Result:", num1/num2)
	default:
		fmt.Println("Invalid choice")

	}
}
