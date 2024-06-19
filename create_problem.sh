#!/bin/bash

# Function to create a new problem folder
create_problem_folder() {
    local day_folder="$1"

    # Check if the day folder exists
    if [ ! -d "$day_folder" ]; then
        echo "Error: Day folder '$day_folder' does not exist."
        exit 1
    fi

    # Find the last problem number
    last_problem_num=$(ls "$day_folder" | grep -E 'Problem[0-9]+' | sort -V | tail -n 1 | grep -oE '[0-9]+')
    if [ -z "$last_problem_num" ]; then
        next_problem_num=1
    else
        next_problem_num=$((last_problem_num + 1))
    fi

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

# Read the day folder name from stdin
read -p "Enter the day folder name (e.g., Day01): " day_folder

# Call the function to create the problem folder
create_problem_folder "$day_folder"
