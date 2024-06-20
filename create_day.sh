#!/bin/bash

# Function to find the next day folder number
find_next_day_folder() {
    last_day_num=$(ls -d Day*/ 2>/dev/null | grep -E 'Day[0-9]+' | sort -V | tail -n 1 | grep -oE '[0-9]+')
    if [ -z "$last_day_num" ]; then
        next_day_num=1
    else
        next_day_num=$((last_day_num + 1))
    fi
    printf -v next_day_folder "Day%02d" "$next_day_num"
    echo "$next_day_folder"
}

# Function to create a new problem folder
create_problem_folder() {
    local day_folder="$1"
    next_problem_num=1

    # Create the new problem folder
    new_problem_folder="$day_folder/Problem$next_problem_num"
    mkdir -p "$new_problem_folder"

    # Create the problem.md and solution.go files
    problem_md_file="$new_problem_folder/problem.md"
    solution_go_file="$new_problem_folder/solution.go"
    touch "$problem_md_file"
    touch "$solution_go_file"

    # Add content to problem.md file
    echo "# $day_folder - GoDPPs

### Problem $next_problem_num: Your Problem Name here
**Description:**
Your problem statement here

**Objective:**
- Objective 1
- Objective 2
" > "$problem_md_file"

    # Add content to solution.go file
    echo "package problem$next_problem_num

func Solution() {
    // Your solution here
}
" > "$solution_go_file"

    echo "Created $new_problem_folder with problem.md and solution.go files."

    # Update main.go file
    main_go_file="$day_folder/main.go"
    import_statement="problem$next_problem_num \"github.com/sirsho29/GoDPPs/$day_folder/Problem$next_problem_num\""
    function_call="problem$next_problem_num.Solution()"

    if [ -f "$main_go_file" ]; then
        # Add import statement and function call
        awk -v import="$import_statement" -v call="$function_call" '
        BEGIN { import_added = 0; call_added = 0 }
        /^import \(/ { print; if (!import_added) { print import; import_added = 1; next } }
        /^func main\(\) \{/ { print; if (!call_added) { call_added = 1 } next }
        { print }
        END { if (call_added) { print "    " call } }
        ' "$main_go_file" > "$main_go_file.tmp" && mv "$main_go_file.tmp" "$main_go_file"

        awk 'NR==FNR { if($0 ~ /func main\(\) \{/) f=1; if(f && $0 ~ /^\}/) { print "    " call; f=0 }; print; next } 1' call="$function_call" "$main_go_file" > "$main_go_file.tmp" && mv "$main_go_file.tmp" "$main_go_file"
    else
        # Create main.go if it doesn't exist
        echo "package main

import (
    $import_statement
)

func main() {
    $function_call
}
" > "$main_go_file"
    fi

    echo "Updated $main_go_file to include the new solution function call."
}

# Function to create a new day folder
create_day_folder() {
    next_day_folder=$(find_next_day_folder)
    mkdir -p "$next_day_folder"

    # Initialize go module
    cd "$next_day_folder"
    go mod init "github.com/sirsho29/GoDPPs/$next_day_folder"
    cd ..

    # Create main.go file
    main_go_file="$next_day_folder/main.go"
    echo "package main

import (
    problem1 \"github.com/sirsho29/GoDPPs/$next_day_folder/Problem1\"
)

func main() {
    problem1.Solution()
}
" > "$main_go_file"

    echo "Created $next_day_folder with go.mod and main.go files."

    # Create the first problem folder
    create_problem_folder "$next_day_folder"

    echo "Updated $main_go_file to include the first problem function call."
}

# Create a new day folder
create_day_folder
