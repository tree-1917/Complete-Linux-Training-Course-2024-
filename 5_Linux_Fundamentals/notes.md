# Linux Fundamentals

> Outlines

- [ ]
- [ ]

---

## Content

### 60 Linux Command Syntax

- What is command syntax ?
- make a table with common 10 linux commands and it's option
- Make a table of option shared in more commands

### 61. Files and Directory Permissions (chmod)

- What is Files and Directory Permissions ?
  - 3 types of premission
    - r : 4
    - w : 2
    - x : 1
  - 3 level of control
    - u : user number
    - g : group number
    - o : other number
    - a : every thon
- How to change Files and Directory Permissions ?
- Why to change Files and Directory Permissions ?

### 62. File Permissions Using Numeric Mode

- How to assing permissions Using Numeric Modes ?

### 63. File Ownership Commands (chown, chgrp)

- How to use `chown`
- How to use `chgrp`
- Make 3 Eamples and use `-r` ?

### 64. Access Control List (ACL)

- What is `ACL` ?
- Use of `ACL` ?
- How to use `ACL` ?
  - getfacl -m u:user:rwx file
  - setfacl -m g:group:rw file
  - setfacl -rm "entry" dir
  - setfacl -x u:user file
  - setfacl -b file
- As you assign the ACL Permission to the file/dir it adds + sign at the end of the permission
- setting w permission with Acl does not all to remove a file

> As you make a white list with Specific Permission .

### 65. Help Commands

> there are 3 types of help commands :

- `whatis` command
- command `--help`
- `man` command

### 66. TAB Completion and Up Arrow Keys

- What to use TAB and Up Arrow ?

### 67. Adding Text to Files (Redirects)

> 3 simple ways to add text to a file :

    - vi
    - redirect command output > or >>
    - echo > or >>

### 68. Input and Output Redirects (>, >>, <, stdin, stout)

> There are 3 redirects in Linux

- Stdin 0
- stdout 1
- stderr 2

- output(stdout) - 1
  - be default runnig a command its output goes to the terminal
  - the output of a command can be routed to a file usnig `>`
  - Make a 3 exmaples using > and >>
- Input(stdin) - 0
  - Input is used when feeding file contents to a file
    - Make a 3 examples using <
- Error(stderr) - 2
  - when the error occoured

### 69. Standard Output to a File (tee command)
