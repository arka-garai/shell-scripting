# Shell Scripting
A collection of Bash shell scripts demonstrating fundamental shell scripting concepts, file operations, and system automation.

## Requirements
- **Shell**: Bash
- **Operating System**: Linux/Unix (WSL: Ubuntu)

## Shell Scripting Basics

### Shebang
```bash
#!/bin/bash
```
The shebang tells the system which interpreter to use for executing the script.

### Variables
```bash
# Variable assignment (no spaces around =)
name="John"
age=25

# Using variables
echo "Name: $name"
echo "Age: ${age}"

# Read user input
read -p "Enter your name: " username
```

### Command Line Arguments
```bash
$0  # Script name
$1  # First argument
$2  # Second argument
$#  # Number of arguments
$@  # All arguments
$*  # All arguments as single string
```

### Conditionals
```bash
# if-else statement
if [ condition ]; then
    # commands
elif [ condition ]; then
    # commands
else
    # commands
fi

# Comparison operators
-eq  # Equal to
-ne  # Not equal to
-gt  # Greater than
-lt  # Less than
-ge  # Greater than or equal to
-le  # Less than or equal to

# String comparison
=    # Equal
!=   # Not equal
-z   # Empty string
-n   # Non-empty string

# File tests
-f   # File exists
-d   # Directory exists
-r   # Readable
-w   # Writable
-x   # Executable
```

### Loops
```bash
# for loop
for i in 1 2 3 4 5; do
    echo $i
done

# for loop with range
for i in {1..5}; do
    echo $i
done

# while loop
while [ condition ]; do
    # commands
done

# Reading file line by line
while read line; do
    echo $line
done < file.txt
```

### Case Statement
```bash
case $variable in
    pattern1)
        # commands
        ;;
    pattern2)
        # commands
        ;;
    *)
        # default case
        ;;
esac
```

### Functions
```bash
# Function definition
function_name() {
    # commands
    echo "Hello from function"
    return 0
}

# Calling function
function_name

# Function with parameters
greet() {
    echo "Hello $1"
}
greet "World"
```

### Arrays
```bash
# Array declaration
arr=(element1 element2 element3)

# Access elements
echo ${arr[0]}      # First element
echo ${arr[@]}      # All elements
echo ${#arr[@]}     # Array length

# Loop through array
for element in "${arr[@]}"; do
    echo $element
done
```

### Arithmetic Operations
```bash
# Using expr
result=$(expr 5 + 3)

# Using $(( ))
result=$((5 + 3))

# Using let
let result=5+3

# Using bc for floating point
result=$(echo "scale=2; 10/3" | bc)
```

### String Operations
```bash
# String length
${#string}

# Substring
${string:position:length}

# Case conversion
${string^^}  # Uppercase
${string,,}  # Lowercase

# String concatenation
str1="Hello"
str2="World"
result="$str1 $str2"
```

### Input/Output
```bash
# Echo
echo "Hello World"
echo -e "Line1\nLine2"  # Enable escape sequences
echo -n "No newline"     # No trailing newline

# Read
read variable
read -p "Prompt: " variable
read -s password  # Silent input
```

### File Operations
```bash
# Create file
touch filename

# Read file
cat filename
while read line; do echo $line; done < filename

# Write to file
echo "text" > file      # Overwrite
echo "text" >> file     # Append

# File permissions
chmod 755 file
chmod +x file
```

### Common Commands
```bash
date              # Current date and time
cal               # Calendar
wc -l file        # Line count
sort file         # Sort file contents
grep pattern file # Search pattern
cut -d: -f1       # Cut fields
awk '{print $1}'  # Process text
sed 's/old/new/'  # Stream editor
```

### Escape Sequences
```bash
\n  # Newline
\t  # Tab
\\  # Backslash
\"  # Double quote
```

### Special Variables
```bash
$$  # Current process ID
$?  # Exit status of last command
$!  # Process ID of last background command
```

## Project Structure
```
shell-scripting/
├── p2.sh          # Date, time and calendar display
├── p3.sh          # Addition of two numbers
├── p4.sh          # Find largest among three numbers
├── p5.sh          # Time-based greeting message
├── p6.sh          # Fetch specific line from file
├── p7.sh          # Array sorting in ascending order
├── p8.sh          # File permission management
├── p9.sh          # Date difference calculator
├── p10.sh         # Command line arguments and case conversion
├── p11.sh         # Student record operations with grep
├── p12.sh         # Area calculation using functions
├── p13.sh         # System information display
├── p14.sh         # Arithmetic operations using command line
├── p15.sh         # Digital clock display
├── p16.sh         # Read and sort city names
├── record.txt     # Student records data file
├── t1.txt         # Text file for operations
└── t2.txt         # Text file for operations
```

## 📋 Scripts

- **p2.sh** - Print Today's Date, Current Time and Calendar
- **p3.sh** - Add Two Numbers with User Input
- **p4.sh** - Find Largest Number Among Three Numbers
- **p5.sh** - Display Greeting Message Based on System Time
- **p6.sh** - Fetch mth Line from File and Store in Another File
- **p7.sh** - Sort Array Elements in Ascending Order
- **p8.sh** - Display and Change File Permissions
- **p9.sh** - Calculate Date Difference Between Two Dates
- **p10.sh** - Count Command Line Arguments and Convert to Uppercase
- **p11.sh** - Perform Operations on Student Record File
- **p12.sh** - Calculate Area of Rectangle, Circle and Triangle Using Functions
- **p13.sh** - Display System Information
- **p14.sh** - Perform Arithmetic Operations Using Command Line Arguments
- **p15.sh** - Display a Digital Clock
- **p16.sh** - Read Five City Names and Sort Them

## 🚀 Execution

### Make script executable:
```bash
chmod +x script.sh
```

### Run a script:
```bash
./p2.sh
# or
bash p2.sh
# or
sh p2.sh
```

### Run with arguments:
```bash
./p14.sh 10 5 +
```

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Add more shell scripting examples
- Improve existing scripts
- Add documentation
- Report issues

## 📄 License

This project is open source and available for educational purposes.

---
<div align="center">
  <sub>Built with 💻 by <a href="https://github.com/arka-garai">Arka Garai</a></sub>
</div>
