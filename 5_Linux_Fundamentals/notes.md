# Linux Fundamentals

> Outline :

- [x] **60 Linux Command Syntax**
- [x] **61. Files and Directory Permissions (chmod)**
- [x] **62. File Permissions Using Numeric Mode**
- [x] **63. File Ownership Commands (chown, chgrp)**
- [x] **64. Access Control List (ACL)**
- [x] **65. Help Commands**
- [x] **66. TAB Completion and Up Arrow Keys**
- [x] **67. Adding Text to Files (Redirects)**
- [x] **68. Input and Output Redirects (>, >>, <, stdin, stdout)**
- [x] **69. Standard Output to a File (tee command)**
- [x] **70. Pipes ( | )**
- [x] **71. File Maintenance Commands (cp, rm, mv, mkdir, rmdir, chown, chgrp)**
- [x] **72. File Display Commands (cat, less, more, head, tail)**
- [x] **73. Filters / Text Processing Commands**
- [x] **74. cut - Text Processing Commands**
- [x] **75. awk - Text Processing Commands**
- [x] **76. grep/egrep - Text Processing Commands**
- [x] **77. sort/uniq - Text Processing Commands**
- [x] **78. wc - Text Processing Commands**
- [x] **79. Compare Files (diff and cmp)**
- [x] **80. Compress and Uncompress (tar, gzip, gunzip)**
- [x] **81. Truncate File Size (truncate)**
- [x] **82. Combining and Splitting Files**
- [x] **83. Linux vs. Windows Commands**

---

## Content

### 60. Linux Command Syntax

- **What is Command Syntax?**
  Command syntax defines the structure of commands in a shell, including command names, options, arguments, and parameters.

- **Common Linux Commands and Their Options**

  | Command | Option  | Description                      |
  | ------- | ------- | -------------------------------- |
  | `ls`    | `-l`    | Long format listing              |
  | `ls`    | `-a`    | Show all files, including hidden |
  | `cp`    | `-r`    | Copy directories recursively     |
  | `mv`    | `-i`    | Prompt before overwrite          |
  | `rm`    | `-f`    | Force removal                    |
  | `chmod` | `+x`    | Add execute permission           |
  | `chown` | `-R`    | Change ownership recursively     |
  | `grep`  | `-i`    | Case insensitive search          |
  | `find`  | `-name` | Search by file name              |
  | `tar`   | `-xvf`  | Extract files from an archive    |

- **Options Shared in Multiple Commands**

  | Option | Description                     | Commands      |
  | ------ | ------------------------------- | ------------- |
  | `-v`   | Verbose output                  | `cp`, `tar`   |
  | `-r`   | Recursive operation             | `cp`, `chown` |
  | `-f`   | Force or specify file           | `rm`, `tar`   |
  | `-i`   | Interactive or case-insensitive | `mv`, `grep`  |

### 61. Files and Directory Permissions (chmod)

- **What are Files and Directory Permissions?**
  Permissions determine who can read, write, or execute a file. Permissions are represented by:

  - `r` (read) : 4
  - `w` (write) : 2
  - `x` (execute) : 1

  **Permission Levels:**

  - `u` (user/owner)
  - `g` (group)
  - `o` (others)
  - `a` (all)

- **How to Change Files and Directory Permissions**
  Use `chmod` command. Examples:

  - `chmod 755 file.txt` (user: rwx, group: rx, others: rx)
  - `chmod u+x file.sh` (add execute permission to user)

- **Why Change Permissions?**
  To control access to files and directories, ensuring that only authorized users can read, modify, or execute them.

### 62. File Permissions Using Numeric Mode

- **How to Assign Permissions Using Numeric Modes**
  Permissions are assigned using a three-digit number:
  - Example: `chmod 644 file.txt` (user: rw, group: r, others: r)

### 63. File Ownership Commands (chown, chgrp)

- **How to Use `chown`**
  Change file owner and/or group.

  - `chown user file.txt`
  - `chown user:group file.txt`
  - `chown -R user:group dir/` (recursive)

- **How to Use `chgrp`**
  Change file group.

  - `chgrp group file.txt`
  - `chgrp -R group dir/` (recursive)

- **Examples Using `-r`**
  - `chown -R alice:admins /project`
  - `chgrp -R developers /data`
  - `chown -R bob /home/bob`

### 64. Access Control List (ACL)

- **What is ACL?**
  ACLs provide a way to give more granular permissions on files and directories.

- **Use of ACL**
  To set permissions for individual users or groups beyond standard UNIX permissions.

- **How to Use ACL**

  - `getfacl file` - View ACLs
  - `setfacl -m u:user:rwx file` - Set ACL for a user
  - `setfacl -m g:group:rw file` - Set ACL for a group
  - `setfacl -rm g:group file` - Remove ACL entry for a group
  - `setfacl -x u:user file` - Remove ACL entry for a user
  - `setfacl -b file` - Remove all ACL entries

  **Note:** ACL permissions are shown with a `+` at the end of the regular permissions (e.g., `rwxr-xr-x+`).

### 65. Help Commands

- **Types of Help Commands**
  - `whatis` command: Provides a short description of a command.
  - Command `--help`: Shows usage information for a command.
  - `man` command: Displays the manual page for a command.

### 66. TAB Completion and Up Arrow Keys

- **What to Use TAB and Up Arrow For?**
  - **TAB:** Autocomplete file and directory names or command names.
  - **Up Arrow:** Cycle through previously entered commands.

### 67. Adding Text to Files (Redirects)

- **Ways to Add Text to a File**
  - Using `vi` editor: `vi file.txt`
  - Redirecting command output: `echo "text" > file.txt` or `echo "more text" >> file.txt`
  - Using `echo` command: `echo "some text" >> file.txt`

### 68. Input and Output Redirects (>, >>, <, stdin, stdout)

- **Stdin (0)**

  - Example: `command < file.txt` (feeds the contents of file.txt to the command)

- **Stdout (1)**

  - Example: `command > file.txt` (redirects output to file.txt, overwriting it)
  - Example: `command >> file.txt` (appends output to file.txt)

- **Stderr (2)**
  - Example: `command 2> error.log` (redirects errors to error.log)

### 69. Standard Output to a File (tee command)

- **How to Use `tee`**
  `tee` reads from standard input and writes to both standard output and files.

  - `command | tee file.txt` (writes output to file.txt and displays it)
  - `command | tee -a file.txt` (appends output to file.txt)

- **Examples**
  - `ls | tee file_list.txt`
  - `grep "pattern" file.txt | tee results.txt`
  - `echo "text" | tee -a file.txt`

### 70. Pipes ( | )

- **What is a Pipe?**
  A pipe (`|`) is used to pass the output of one command as input to another command.

- **Examples**
  - `ls | grep "pattern"` (lists files and filters by pattern)
  - `cat file.txt | sort` (sorts the contents of file.txt)
  - `ps aux | grep "process"` (searches for a specific process)

### 71. File Maintenance Commands (cp, rm, mv, mkdir, rmdir, chown, chgrp)

- **What are File Maintenance Commands?**

  | Command | Description                         |
  | ------- | ----------------------------------- |
  | `cp`    | Copy files or directories           |
  | `rm`    | Remove files or directories         |
  | `mv`    | Move or rename files or directories |
  | `mkdir` | Create directories                  |
  | `rmdir` | Remove empty directories            |
  | `chown` | Change file owner                   |
  | `chgrp` | Change file group                   |

- **Examples**
  - `cp file1.txt file2.txt`
  - `rm -r directory/`
  - `mv oldname.txt newname.txt`
  - `mkdir newdir`
  - `rmdir emptydir`
  - `chown user file.txt`
  - `chgrp group file.txt`

### 72. File Display Commands (cat, less, more, head, tail)

- **What are Display Commands?**

  | Command | Description                           |
  | ------- | ------------------------------------- |
  | `cat`   | Concatenate and display file contents |
  | `less`  | View file contents interactively      |
  | `more`  | View file contents interactively      |
  | `head`  | Display the first part of a file      |
  | `tail`  | Display the last part of a file       |

- **Examples**
  - `cat file.txt`
  - `less file.txt`
  - `more file.txt`
  - `head -n 10 file.txt`
  - `tail -n 10 file.txt`

### 73. Filters / Text Processing Commands

- **What are Filters/Text Processing Commands?**

  | Command | Description                          |
  | ------- | ------------------------------------ |
  | `cut`   | Remove sections from each line       |
  | `awk`   | Pattern scanning and processing      |
  | `grep`  | Search text using patterns           |
  | `sort`  | Sort lines of text files             |
  | `uniq`  | Report or omit repeated lines        |
  | `wc`    | Count words, lines, characters, etc. |

- **Examples**

  - `cut -d':' -f1 file.txt`
  - `awk '{print $1}' file.txt`
  - `grep "pattern" file.txt`
  - `sort file.txt`
  - `uniq file.txt`
  - `wc -l file.txt`

### 74. cut - Text Processing Commands

- **What is `cut` Command?**
  `cut` extracts sections from each line of input.

- **Common Options with `cut`**

  | Option         | Description                  |
  | -------------- | ---------------------------- |
  | `-d`           | Set delimiter                |
  | `-f`           | Select fields                |
  | `-b`           | Select bytes                 |
  | `-c`           | Select characters            |
  | `--complement` | Complement selected sections |

- **Examples**
  - `cut -d':' -f1 /etc/passwd` (extracts usernames)
  - `cut -c1-5 file.txt` (extracts first 5 characters)
  - `cut -d' ' -f2 file.txt` (extracts second field separated by space)

### 75. awk - Text Processing Commands

- **What is `awk` Command?**
  `awk` is a versatile programming language for pattern scanning and processing.

- **Common Options with `awk`**

  | Option | Description                           |
  | ------ | ------------------------------------- |
  | `-F`   | Specify input field separator         |
  | `-f`   | Specify file containing `awk` program |
  | `-v`   | Assign values to variables            |
  | `-W`   | Enable warnings                       |

- **Examples**
  - `awk '{print $1}' file.txt` (prints the first field)
  - `awk -F':' '{print $1}' /etc/passwd` (prints usernames)
  - `awk '{if ($3 > 50) print $1}' file.txt` (prints names where third column is > 50)

### 76. grep/egrep - Text Processing Commands

- **What is `grep` Command?**
  `grep` searches text using patterns (regular expressions).

- **Common Options with `grep`**

  | Option | Description                            |
  | ------ | -------------------------------------- |
  | `-i`   | Case insensitive search                |
  | `-v`   | Invert match (show non-matching lines) |
  | `-r`   | Recursive search                       |
  | `-n`   | Show line numbers                      |
  | `-l`   | Show file names only                   |

- **Examples**

  - `grep "pattern" file.txt` (searches for a pattern)
  - `grep -i "pattern" file.txt` (case insensitive search)
  - `grep -r "pattern" /dir/` (searches recursively)

- **Common Regular Expressions with `grep`**

| Regex | Description                             |
| ----- | --------------------------------------- |
| `.`   | Any single character                    |
| `^`   | Start of line                           |
| `$`   | End of line                             |
| `*`   | Zero or more of the preceding character |
| `[]`  | Any single character within brackets    |
| `\|`  | Alternation (logical OR)                |
| `()`  | Grouping                                |
| `\`   | Escape special characters               |
| `+`   | One or more of the preceding character  |
| `{}`  | Exact number of repetitions             |

### 77. sort/uniq - Text Processing Commands

- **What is `sort` Command?**
  `sort` arranges lines of text files in sorted order.

- **What is `uniq` Command?**
  `uniq` filters out repeated lines.

- **Common Options with `sort`**

  | Option | Description              |
  | ------ | ------------------------ |
  | `-n`   | Sort numerically         |
  | `-r`   | Reverse order            |
  | `-k`   | Sort by a specific field |
  | `-u`   | Unique lines only        |

- **Common Options with `uniq`**

  | Option | Description                |
  | ------ | -------------------------- |
  | `-c`   | Count occurrences          |
  | `-d`   | Print only duplicate lines |
  | `-u`   | Print only unique lines    |

- **Examples**
  - `sort file.txt` (sorts lines in file.txt)
  - `uniq file.txt` (removes duplicate lines)
  - `sort file.txt | uniq` (sorts and removes duplicates)

### 78. wc - Text Processing Commands

- **What is `wc` Command?**
  `wc` counts lines, words, and characters in a file.

- **Common Options with `wc`**

  | Option | Description                  |
  | ------ | ---------------------------- |
  | `-l`   | Count lines                  |
  | `-w`   | Count words                  |
  | `-c`   | Count characters             |
  | `-m`   | Count characters (multibyte) |

- **Examples**
  - `wc -l file.txt` (counts lines)
  - `wc -w file.txt` (counts words)
  - `wc -c file.txt` (counts characters)

### 79. Compare Files (diff and cmp)

- **What is `diff` Command?**
  `diff` compares files line by line.

- **What is `cmp` Command?**
  `cmp` compares files byte by byte.

- **Common Options with `diff`**

  | Option | Description       |
  | ------ | ----------------- |
  | `-u`   | Unified format    |
  | `-c`   | Context format    |
  | `-i`   | Ignore case       |
  | `-w`   | Ignore whitespace |

- **Common Options with `cmp`**

  | Option | Description           |
  | ------ | --------------------- |
  | `-l`   | Print differing bytes |
  | `-s`   | Suppress all output   |
  | `-i`   | Specify byte offset   |

- **Examples**
  - `diff file1.txt file2.txt` (compares two files)
  - `cmp file1.txt file2.txt` (compares files byte by byte)
  - `diff -u file1.txt file2.txt` (shows differences in unified format)

### 80. Compress and Uncompress (tar, gzip, gunzip)

- **What is `tar` Command?**
  `tar` archives multiple files into a single file.

- **What is `gzip` Command?**
  `gzip` compresses files.

- **What is `gunzip` Command?**
  `gunzip` decompresses files compressed by `gzip`.

- **Common Options with `tar`**

  | Option | Description        |
  | ------ | ------------------ |
  | `-c`   | Create an archive  |
  | `-x`   | Extract an archive |
  | `-f`   | Specify file name  |
  | `-v`   | Verbose output     |

- **Common Options with `gzip`**

  | Option | Description              |
  | ------ | ------------------------ |
  | `-d`   | Decompress               |
  | `-c`   | Write to standard output |
  | `-k`   | Keep original file       |

- **Common Options with `gunzip`**

  | Option | Description              |
  | ------ | ------------------------ |
  | `-c`   | Write to standard output |
  | `-k`   | Keep original file       |

- **Examples**
  - `tar -cvf archive.tar file1 file2` (create tar archive)
  - `gzip file.txt` (compress file.txt)
  - `gunzip file.txt.gz` (decompress file.txt.gz)

### 81. Truncate File Size (truncate)

- **What is `truncate` Command?**
  `truncate` is used to shrink or extend the size of a file to the specified size.

- **Common Option with `truncate`**

  | Option | Description      |
  | ------ | ---------------- |
  | `-s`   | Specify the size |

- **Examples**
  - `truncate -s 0 file.txt` (shrink file.txt to zero size)
  - `truncate -s 1K file.txt` (set file.txt to 1KB)
  - `truncate -s +1M file.txt` (increase file.txt by 1MB)

### 82. Combining and Splitting Files

- **Combining Files**

  - `cat file1.txt file2.txt > combined.txt` (concatenate files into combined.txt)

- **Splitting Files**
  - `split -l 100 file.txt part_` (split file.txt into parts with 100 lines each)
  - `split -b 1M file.txt part_` (split file.txt into parts of 1MB each)

### 83. Linux vs. Windows Commands

- **Shared Commands**

  | Description      | Windows Command | Linux Command |
  | ---------------- | --------------- | ------------- |
  | List files       | `dir`           | `ls`          |
  | Change directory | `cd`            | `cd`          |
  | Copy file        | `copy`          | `cp`          |
  | Delete file      | `del`           | `rm           |
  | Move file        | `move`          | `mv`          |

- **Commands with Differences**

  | Description           | Windows Command | Linux Command |
  | --------------------- | --------------- | ------------- |
  | Display file contents | `type`          | `cat`         |
  | Find files            | `dir /s`        | `find`        |
  | Redirect output       | `>`             | `>`           |
  | Append output         | `>>`            | `>>`          |
  | Display process list  | `tasklist`      | `ps`          |

---
