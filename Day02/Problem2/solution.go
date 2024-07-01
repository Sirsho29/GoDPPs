package problem2

import "fmt"

func Solution() {
	var c float64
	fmt.Scanf("%f", &c)
	f := (9 * c / 5) + 32
	fmt.Printf("Fahrenheit = %.2f", f)
}
