package problem3

import "fmt"

func Solution() {
	var num int
	fmt.Println("Enter an integer: ")
	_, err := fmt.Scanf("%d", &num)

	if err != nil {
		panic(err)
	}

	if num%2 == 0 {
		fmt.Println("Even")
	} else {
		fmt.Println("Odd")
	}

}
