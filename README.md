# Shell Scripting
A collection of Bash shell scripts demonstrating fundamental shell scripting concepts, file operations, and system automation.

## Requirements
- **Shell**: Bash
- **Operating System**: Linux (Arch Linux)

---

## Shell Scripting Reference

### Shebang
The shebang tells the system which interpreter to use. Always use `#!/usr/bin/env bash` for portability, or `#!/bin/bash` for an absolute path.

---

### Variables
Variable assignment requires no spaces around `=`. Variables are referenced with `$name` or `${name}`. Always quote variables unless they contain wildcards or command fragments to expand.

```
name="John"
echo "$name"
echo "${name}!"
```

Single quotes preserve literals (`'Hi $name'` prints `Hi $name`). Double quotes allow expansion (`"Hi $name"` prints `Hi John`).

To read user input: `read -p "Enter your name: " username`

---

### Command Line Arguments

| Variable | Description |
|----------|-------------|
| `$0` | Script name |
| `$1`, `$2` | First, second argument |
| `$#` | Number of arguments |
| `$@` | All arguments as separate strings |
| `$*` | All arguments as a single word |
| `$_` | Last argument of the previous command |

> **Note:** `$@` and `$*` behave identically unless quoted. Prefer `"$@"` for iterating arguments safely.

---

### Conditionals
Use `[[ ]]` (preferred over `[ ]`) for conditionals. `[[` is a built-in that returns `0` (true) or `1` (false). Any program that follows this convention (e.g. `grep`, `ping`) can be used as a condition.

**String conditions:**

| Condition | Description |
|-----------|-------------|
| `[[ -z STRING ]]` | Empty string |
| `[[ -n STRING ]]` | Not empty string |
| `[[ STRING == STRING ]]` | Equal |
| `[[ STRING != STRING ]]` | Not equal |
| `[[ STRING =~ STRING ]]` | Regex match |

**Numeric conditions:**

| Condition | Description |
|-----------|-------------|
| `[[ NUM -eq NUM ]]` | Equal |
| `[[ NUM -ne NUM ]]` | Not equal |
| `[[ NUM -lt NUM ]]` | Less than |
| `[[ NUM -le NUM ]]` | Less than or equal |
| `[[ NUM -gt NUM ]]` | Greater than |
| `[[ NUM -ge NUM ]]` | Greater than or equal |
| `(( NUM < NUM ))` | Numeric expression (alternative) |

**Logical operators:**

| Condition | Description |
|-----------|-------------|
| `[[ ! EXPR ]]` | Not |
| `[[ X && Y ]]` | And |
| `[[ X \|\| Y ]]` | Or |
| `[[ -o noclobber ]]` | If shell option is enabled |

**File conditions:**

| Condition | Description |
|-----------|-------------|
| `[[ -e FILE ]]` | Exists |
| `[[ -f FILE ]]` | Is a regular file |
| `[[ -d FILE ]]` | Is a directory |
| `[[ -r FILE ]]` | Readable |
| `[[ -w FILE ]]` | Writable |
| `[[ -x FILE ]]` | Executable |
| `[[ -h FILE ]]` | Is a symlink |
| `[[ -s FILE ]]` | Size > 0 bytes |
| `[[ FILE1 -nt FILE2 ]]` | FILE1 is newer than FILE2 |
| `[[ FILE1 -ot FILE2 ]]` | FILE2 is newer than FILE1 |
| `[[ FILE1 -ef FILE2 ]]` | Same file (inode) |

---

### Loops

**For loop (list):**
```
for i in /etc/rc.*; do
  echo "$i"
done
```

**For loop (range with optional step):**
```
for i in {1..5}; do echo "$i"; done
for i in {5..50..5}; do echo "$i"; done  # step of 5
```

**C-style for loop:**
```
for ((i = 0; i < 100; i++)); do echo "$i"; done
```

**While loop:**
```
while true; do
  # forever
done
```

**Reading a file line by line** (use `-r` to disable backslash interpretation):
```
while read -r line; do
  echo "$line"
done < file.txt
```

---

### Case Statement
```
case "$1" in
  start | up)
    echo "Starting..."
    ;;
  stop)
    echo "Stopping..."
    ;;
  *)
    echo "Usage: $0 {start|stop}"
    ;;
esac
```

---

### Functions

Functions can be defined with or without the `function` keyword. Parameters are accessed via `$1`, `$2`, etc. Use `local` for local variables. To return a value, `echo` it and capture with command substitution.

```
get_name() {
  local myresult="John"
  echo "$myresult"
}

result=$(get_name)
```

To raise an error, `return 1` and check with `if myfunc; then ... else ... fi`.

---

### Arrays

**Defining:**
```
Fruits=('Apple' 'Banana' 'Orange')
Fruits[0]="Apple"
```

**Accessing:**

| Expression | Description |
|------------|-------------|
| `${Fruits[0]}` | First element |
| `${Fruits[-1]}` | Last element |
| `${Fruits[@]}` | All elements (space-separated) |
| `${#Fruits[@]}` | Number of elements |
| `${Fruits[@]:3:2}` | Range (from index 3, length 2) |
| `${!Fruits[@]}` | All indices |

**Operations:**
```
Fruits+=('Watermelon')                   # Append
Fruits=("${Fruits[@]}" "Grape")          # Also append
Fruits=("${Fruits[@]/Ap*/}")             # Remove by regex
unset Fruits[2]                          # Remove one element
Fruits=("${Fruits[@]}" "${Veggies[@]}")  # Concatenate arrays
```

**Iteration:**
```
for i in "${Fruits[@]}"; do
  echo "$i"
done
```

---

### Dictionaries (Associative Arrays)

```
declare -A sounds
sounds[dog]="bark"
sounds[cow]="moo"

echo "${sounds[dog]}"   # bark
echo "${sounds[@]}"     # all values
echo "${!sounds[@]}"    # all keys
echo "${#sounds[@]}"    # number of elements
unset sounds[dog]       # delete key
```

**Iterate over values:** `for val in "${sounds[@]}"; do ...`
**Iterate over keys:** `for key in "${!sounds[@]}"; do ...`

---

### Parameter Expansion

**Basics:**
```
echo "${name/J/j}"      # substitution (first match)
echo "${name:0:2}"      # slice (position, length)
echo "${name:(-1)}"     # slice from right
echo "${food:-Cake}"    # default value if unset
```

**Path manipulation:**
```
str="/path/to/foo.cpp"
echo "${str%.cpp}"      # /path/to/foo        (remove suffix)
echo "${str##*/}"       # foo.cpp             (basename)
echo "${str%/*}"        # /path/to            (dirname)
echo "${str##*.}"       # cpp                 (extension)
echo "${str/foo/bar}"   # /path/to/bar.cpp    (replace)
```

**Substitution reference:**

| Expression | Description |
|------------|-------------|
| `${foo%suffix}` | Remove suffix |
| `${foo#prefix}` | Remove prefix |
| `${foo%%suffix}` | Remove long (greedy) suffix |
| `${foo##prefix}` | Remove long (greedy) prefix |
| `${foo/from/to}` | Replace first match |
| `${foo//from/to}` | Replace all matches |
| `${foo/#from/to}` | Replace prefix |
| `${foo/%from/to}` | Replace suffix |

**Default values:**

| Expression | Description |
|------------|-------------|
| `${foo:-val}` | Use `val` if `$foo` is unset or null |
| `${foo:=val}` | Set `$foo` to `val` if unset or null |
| `${foo:+val}` | Use `val` only if `$foo` is set |
| `${foo:?msg}` | Print error and exit if `$foo` is unset |

**Case manipulation:**
```
str="hello world!"
echo "${str^^}"    # HELLO WORLD!  (all uppercase)
echo "${str^}"     # Hello world!  (capitalize first)
str="HELLO WORLD!"
echo "${str,,}"    # hello world!  (all lowercase)
echo "${str,}"     # hELLO WORLD!  (lowercase first)
```

---

### Arithmetic Operations

```
result=$((5 + 3))
result=$(($RANDOM % 200))   # random number 0..199
result=$((a + 200))

declare -i count            # declare as integer
count+=1                    # increment

result=$(echo "scale=2; 10/3" | bc)  # floating point
```

---

### String Operations

| Expression | Description |
|------------|-------------|
| `${#string}` | String length |
| `${string:pos:len}` | Substring |
| `${string^^}` | All uppercase |
| `${string,,}` | All lowercase |

---

### Input / Output

```
echo "Hello World"
echo -e "Line1\nLine2"    # enable escape sequences
echo -n "no newline"      # suppress trailing newline

printf "Hello %s, I'm %s\n" Sven Olga
printf "1 + 1 = %d\n" 2
printf "Float: %f\n" 2

read variable
read -p "Prompt: " variable
read -s password            # silent (for passwords)
read -r ans                 # raw input (disables backslash behavior)
read -n 1 ans               # read exactly one character
```

---

### Redirection

```
python hello.py > output.txt         # stdout to file (overwrite)
python hello.py >> output.txt        # stdout to file (append)
python hello.py 2> error.log         # stderr to file
python hello.py 2>&1                 # stderr to stdout
python hello.py 2>/dev/null          # discard stderr
python hello.py &>/dev/null          # discard stdout and stderr
python hello.py < foo.txt            # feed file to stdin
diff <(ls -r) <(ls)                  # process substitution
echo "$0: warning: too many users" >&2  # write to stderr
```

**Heredoc** (treats a block of text as a file):
```
cat <<END
hello world
END
```

**Herestring** (treats a string as stdin):
```
tr '[:lower:]' '[:upper:]' <<< "will be uppercased"
```

---

### File Operations

```
touch filename              # create file
cat filename                # read file
echo "text" > file          # write (overwrite)
echo "text" >> file         # write (append)
chmod +x file               # make executable
chmod 755 file              # set permissions
wc -l file                  # line count
sort file                   # sort contents
grep pattern file           # search pattern
```

---

### Strict Mode

For robust scripts, enable strict mode at the top:

```
set -euo pipefail
IFS=$'\n\t'
```

`-e` exits on error, `-u` treats unset variables as errors, `-o pipefail` catches failures in pipelines. See [Unofficial bash strict mode](http://redsymbol.net/articles/unofficial-bash-strict-mode/).

---

### Options & Glob Options

```
set -o noclobber   # prevent overwriting files with >
set -o errexit     # exit on error
set -o pipefail    # expose pipe failures
set -o nounset     # error on unset variables

shopt -s nullglob  # unmatched globs expand to nothing
shopt -s failglob  # unmatched globs throw errors
shopt -s nocaseglob # case-insensitive globs
shopt -s dotglob   # wildcards match dotfiles
shopt -s globstar  # enable ** recursive matching
```

---

### Brace Expansion

| Expression | Expands to |
|------------|------------|
| `{A,B}.js` | `A.js B.js` |
| `{1..5}` | `1 2 3 4 5` |
| `{{1..3},{7..9}}` | `1 2 3 7 8 9` |

---

### Special Variables

| Variable | Description |
|----------|-------------|
| `$$` | PID of the current shell |
| `$?` | Exit status of last command |
| `$!` | PID of last background task |
| `$0` | Filename of the script |
| `$_` | Last argument of the previous command |
| `${PIPESTATUS[n]}` | Exit status of nth command in last pipeline |

---

### History

| Command / Expression | Description |
|----------------------|-------------|
| `history` | Show command history |
| `shopt -s histverify` | Confirm before executing history expansion |
| `!!` | Re-execute last command |
| `!$` | Last argument of most recent command |
| `!*` | All arguments of most recent command |
| `!n` | Execute nth command in history |
| `!<cmd>` | Most recent invocation of `<cmd>` |
| `!!:s/from/to/` | Replace first occurrence in last command |
| `!!:gs/from/to/` | Replace all occurrences in last command |

---

### Trap Errors

```
trap 'echo Error at about $LINENO' ERR
```

Or with a handler function:
```
traperr() {
  echo "ERROR: ${BASH_SOURCE[1]} at about ${BASH_LINENO[0]}"
}
set -o errtrace
trap traperr ERR
```

---

### Subshells

Commands in `( )` run in a subshell — directory changes and variable assignments don't affect the parent:
```
(cd somedir; echo "now in $PWD")
pwd  # unchanged
```

---

### Transform Strings with `tr`

| Option | Description |
|--------|-------------|
| `-c` | Complement (apply to chars NOT in set) |
| `-d` | Delete characters |
| `-s` | Squeeze repeated characters |
| `-t` | Truncate |
| `[:upper:]` | All uppercase letters |
| `[:lower:]` | All lowercase letters |
| `[:digit:]` | All digits |
| `[:space:]` | All whitespace |
| `[:alpha:]` | All letters |
| `[:alnum:]` | All letters and digits |

Example: `echo "Hello World" | tr '[:lower:]' '[:upper:]'` → `HELLO WORLD`

---

### Useful Patterns

**Get directory of current script:**
```
dir=${0%/*}
source "${0%/*}/../share/foo.sh"
```

**Go to previous directory:**
```
cd -
```

**Check for command's result:**
```
if ping -c 1 google.com; then
  echo "Network is up"
fi
```

**Grep check:**
```
if grep -q 'foo' ~/.bash_history; then
  echo "You've used 'foo' before"
fi
```

**Inspect a command type:**
```
command -V cd
#=> "cd is a shell builtin"
```

**Parse options:**
```
while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -V | --version) echo "$version"; exit ;;
  -s | --string) shift; string=$1 ;;
  -f | --flag) flag=1 ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi
```

---

### Common Commands

| Command | Description |
|---------|-------------|
| `date` | Current date and time |
| `cal` | Calendar |
| `wc -l file` | Line count |
| `sort file` | Sort file contents |
| `grep pattern file` | Search for pattern |
| `cut -d: -f1` | Cut fields by delimiter |
| `awk '{print $1}'` | Process and print text fields |
| `sed 's/old/new/'` | Stream editor substitution |

---

### Escape Sequences

| Sequence | Meaning |
|----------|---------|
| `\n` | Newline |
| `\t` | Tab |
| `\\` | Backslash |
| `\"` | Double quote |

---

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

## Scripts

- **p2.sh** — Print Today's Date, Current Time and Calendar
- **p3.sh** — Add Two Numbers with User Input
- **p4.sh** — Find Largest Number Among Three Numbers
- **p5.sh** — Display Greeting Message Based on System Time
- **p6.sh** — Fetch mth Line from File and Store in Another File
- **p7.sh** — Sort Array Elements in Ascending Order
- **p8.sh** — Display and Change File Permissions
- **p9.sh** — Calculate Date Difference Between Two Dates
- **p10.sh** — Count Command Line Arguments and Convert to Uppercase
- **p11.sh** — Perform Operations on Student Record File
- **p12.sh** — Calculate Area of Rectangle, Circle and Triangle Using Functions
- **p13.sh** — Display System Information
- **p14.sh** — Perform Arithmetic Operations Using Command Line Arguments
- **p15.sh** — Display a Digital Clock
- **p16.sh** — Read Five City Names and Sort Them

---

## Execution

Make a script executable, then run it:

```
chmod +x script.sh
./p2.sh
```

Or run directly with the interpreter:

```
bash p2.sh
sh p2.sh
```

For scripts that accept arguments:

```
./p14.sh 10 5 +
```

---

## Further Reading

- [Bash Hackers Wiki](https://web.archive.org/web/20230406205817/https://wiki.bash-hackers.org/)
- [Learn Bash in Y Minutes](https://learnxinyminutes.com/docs/bash/)
- [Bash Guide – mywiki.wooledge.org](http://mywiki.wooledge.org/BashGuide)
- [ShellCheck – static analysis for shell scripts](https://www.shellcheck.net/)
- [Unofficial Bash Strict Mode](http://redsymbol.net/articles/unofficial-bash-strict-mode/)

---

## Contributing

Contributions are welcome! Feel free to add more examples, improve existing scripts, enhance documentation, or report issues.

## License

This project is open source and available for educational purposes.

---
<div align="center">
  <sub>Built with 💻 by <a href="https://github.com/arka-garai">Arka Garai</a></sub>
</div>
