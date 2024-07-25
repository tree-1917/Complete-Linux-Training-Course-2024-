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

- How to use `Tee` ?
- Make 3 examples show the common useage for `Tee` ?

### 70. Pipes ( | )

- What is `Pipes` ?
- Make 3 examples shwo the common useage for `Pipes` ?

### 71. File Maintenance Commands (cp, rm, mv, mkdir, rmdir, chown ,chgrp)

- What are File Maintenance Commands ?
  - Make a table with common 10 commnad in file maintance
  - Make exampels to show them how they use together

### 72. File Display Commands (cat, less, more, head, tail)

- What are Display Commands ?
  - Make a table with common 10 commnad in Display commands
  - Make examples to show them how they use together .

### 73. Filters / Text Processing Commands

- What are Filters / text Proccessing commnands
  - Make a table with common 10 commonds in filter / text proccessing commonds
  - Make examples to show them how they use together
    - cut
    - awk
    - grep and egrep
    - sort
    - uniq
    - wc

### 74. cut - Text Processors Commands

- What is `Cut` Command ?
- Make a table a 10 common options with cut ?
- Make a 3 Examples Show how to use `Cut` ?

### 75. awk - Text Processors Commands

- What is `awk` Command ?
- Make a table a 10 common options with awk ?
- Make a 3 Examples Show how to use `awk` ?

### 76. grep/egrep - Text Processors Commands

- What is `grep` Command ?
- Make a table a 10 common options with grep ?
- Make a 3 Examples Show how to use `grep` ?
- Make a table of common 15 regler experssion with grep

### 77. sort/uniq - Text Processors Commands

- What is `sort/uniq` Command ?
- Make a table a 10 common options with `sort/uniq` ?
- Make a 3 Examples Show how to use `sort/uniq` ?

### 78. wc - Text Processors Commands

- What is `wc` Command ?
- Make a table a 10 common options with `wc` ?
- Make a 3 Examples Show how to use `wc` ?

### 79. Compare Files (diff and cmp)

- What is `diff&cmp` Command ?
- Make a table a 10 common options with `diff&cmp` ?
- Make a 3 Examples Show how to use `diff&cmp` ?

### 80. Compress and uncompress (tar, gzip, gunzip)

- What is `tar, gzip, gunzip` Command ?
- Make a table a 10 common options with `tar, gzip, gunzip` ?
- Make a 3 Examples Show how to use `tar, gzip, gunzip` ?
