package problem5

import (
	"fmt"
	"math"
)

func Solution() {
	var radius int

	fmt.Scanf("%d", &radius)

	area := math.Pi * math.Pow(float64(radius), 2)

	fmt.Println("Area is:", area)
}
