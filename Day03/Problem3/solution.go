package problem3

import (
	"fmt"
	"strings"
)

func Solution() {
	var str string
	fmt.Println("Enter a string:")
	fmt.Scanln(&str)
	count := 0
	for i := 0; i < len(str); i++ {
		if strings.ToLower(string(str[i])) == "a" || strings.ToLower(string(str[i])) == "e" || strings.ToLower(string(str[i])) == "i" || strings.ToLower(string(str[i])) == "o" || strings.ToLower(string(str[i])) == "u" {
			count++
		}
	}

	if count == 0 {
		fmt.Println("No vowels found.")
	} else {
		fmt.Println("Number of vowels:", count)
	}
}
