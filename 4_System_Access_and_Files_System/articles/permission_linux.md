# 🐧 Linux Permissions Tutorial

Linux file and directory permissions are fundamental for ensuring system security and proper access control. In this tutorial, we'll cover how to view, change, and understand permissions. We'll also provide a table of common permissions at the end. Let's dive in! 🚀

## 📜 Understanding Linux Permissions

Linux uses a set of permissions to control access to files and directories. These permissions define who can read, write, or execute a file or directory.

### Permission Types

- **Read (`r`)**: Allows viewing the contents of a file or listing a directory's contents.
- **Write (`w`)**: Allows modifying or deleting the contents of a file or directory.
- **Execute (`x`)**: Allows running a file as a program or entering a directory.

### Permission Groups

Permissions are divided into three groups:

1. **User (u)**: The owner of the file or directory.
2. **Group (g)**: Other users who are part of the file's group.
3. **Others (o)**: All other users.

### Viewing Permissions

Use the `ls -l` command to view permissions:

```bash
ls -l filename
```

Example output:

```plaintext
-rw-r--r-- 1 user group 4096 Jul  7 10:20 filename
```

- The first character indicates the type (`-` for file, `d` for directory).
- The next nine characters indicate permissions (`rwxrwxrwx`):
  - The first three characters are for the **user**.
  - The next three are for the **group**.
  - The last three are for **others**.

## 🔧 Changing Permissions

### Using `chmod`

The `chmod` command is used to change file and directory permissions.

#### Symbolic Mode

```bash
chmod [permissions] [file]
```

- **`u`**: User
- **`g`**: Group
- **`o`**: Others
- **`a`**: All (user, group, and others)

Operators:

- **`+`**: Adds permission
- **`-`**: Removes permission
- **`=`**: Sets permission

Examples:

```bash
chmod u+x filename  # Add execute permission for user
chmod g-w filename  # Remove write permission for group
chmod o=r filename  # Set read permission for others
```

#### Numeric Mode

Permissions can also be set using a three-digit octal number.

```bash
chmod [mode] [file]
```

Each digit represents user, group, and others respectively:

- **4**: Read (`r`)
- **2**: Write (`w`)
- **1**: Execute (`x`)

Examples:

```bash
chmod 755 filename  # rwxr-xr-x (user can read, write, execute; group and others can read and execute)
chmod 644 filename  # rw-r--r-- (user can read and write; group and others can read)
```

### Changing Ownership

Use the `chown` command to change the owner and group of a file or directory.

```bash
chown [owner][:group] [file]
```

Examples:

```bash
chown user filename         # Change owner to user
chown user:group filename   # Change owner to user and group to group
```

### Common Permission Scenarios

| Command                     | Permissions | Description                                                       |
| --------------------------- | ----------- | ----------------------------------------------------------------- |
| `chmod 777 filename`        | `rwxrwxrwx` | Everyone can read, write, and execute.                            |
| `chmod 755 filename`        | `rwxr-xr-x` | User can read, write, execute; group and others can read, execute |
| `chmod 700 filename`        | `rwx------` | Only user can read, write, and execute.                           |
| `chmod 644 filename`        | `rw-r--r--` | User can read and write; group and others can read.               |
| `chmod 600 filename`        | `rw-------` | Only user can read and write.                                     |
| `chown user filename`       |             | Change owner to user.                                             |
| `chown user:group filename` |             | Change owner to user and group to group.                          |

## 🔍 Examples

### Example 1: Changing File Permissions

```bash
ls -l myfile.txt
# -rw-r--r-- 1 user group 4096 Jul  7 10:20 myfile.txt

chmod 755 myfile.txt
ls -l myfile.txt
# -rwxr-xr-x 1 user group 4096 Jul  7 10:20 myfile.txt
```

### Example 2: Changing Directory Permissions

```bash
ls -ld mydir
# drwxr-xr-x 2 user group 4096 Jul  7 10:20 mydir

chmod 700 mydir
ls -ld mydir
# drwx------ 2 user group 4096 Jul  7 10:20 mydir
```

### Example 3: Changing Ownership

```bash
ls -l myfile.txt
# -rw-r--r-- 1 olduser group 4096 Jul  7 10:20 myfile.txt

chown newuser myfile.txt
ls -l myfile.txt
# -rw-r--r-- 1 newuser group 4096 Jul  7 10:20 myfile.txt
```

## 🎉 Conclusion

Understanding and managing file permissions is crucial for Linux system security and functionality. With these commands and concepts, you can effectively control access to your files and directories. Practice using these commands to become more comfortable with Linux permissions. Happy computing! 🚀
