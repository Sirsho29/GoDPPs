package problem5

import (
	"fmt"
	"strconv"
	"strings"
)

func Solution() {
	var arrStr string
	var arr []int

	fmt.Println("Enter comma-separated integers:")
	fmt.Scanln(&arrStr)

	for _, s := range strings.Split(arrStr, ",") {
		numt, _ := strconv.Atoi(s)
		arr = append(arr, numt)
	}

	max := arr[0]

	for i := 1; i < len(arr); i++ {
		if arr[i] > max {
			max = arr[i]
		}
	}

	fmt.Println("Largest element:", max)
}
