# Tutorial: Using HP Boot Shell (UEFI Shell)

## 1. Accessing the UEFI Shell

1. **Boot your HP computer** and enter the BIOS/UEFI setup by pressing **Esc** or **F10** during startup.
2. Navigate to the **Boot Options** or **Boot Sequence** menu.

3. Select the option that mentions **UEFI Shell** or **EFI Shell** and press Enter to launch it.

## 2. Basic Commands in UEFI Shell

Once you're in the UEFI Shell, you'll see a command prompt (`Shell>` or similar). Here are some basic commands:

- **`map`**: Lists all the devices and partitions detected by the UEFI firmware.
- **`fsX:`**: Change to a specific filesystem (replace `X` with the filesystem number listed by `map`).

- **`ls`**: List files and directories in the current filesystem.

- **`cd`**: Change directory.

- **`edit`**: Edit text files (usage: `edit filename`).

- **`load`**: Load a file into memory (usage: `load filename`).

- **`fsX:\path\to\file`**: Specify the path to a file or directory on a specific filesystem.

## 3. Example: Loading and Booting an ISO File

To load and boot from an ISO file located on a specific drive (replace `X` and `Y` with appropriate values from `map` command):

1. **Identify the drive where the ISO file is located** using `map` command.

   Example:

   ```shell
   Shell> map
   (hd0) fs0: Hard Disk - <Description>
   (cd0) blk0: CD/DVD/BD-ROM - <Description>
   ```

2. **Load the ISO file into memory**:

   ```shell
   Shell> fs0:
   fs0:\> cd \path\to\directory\with\iso
   fs0:\> load \path\to\iso\file.iso
   ```

3. **Boot from the loaded ISO file**:

   ```shell
   Shell> bootx fs0:\path\to\iso\file.iso
   ```

## 4. Exiting UEFI Shell

To exit the UEFI Shell and continue with normal boot process:

- **`exit`**: Exit the UEFI Shell and continue booting.

## Notes 

- Commands and syntax may vary slightly depending on the UEFI Shell version and firmware implementation.
- Ensure you have the correct path to the ISO file and adjust commands accordingly.
- Be cautious when using UEFI Shell commands to avoid unintended changes to firmware settings.

This tutorial should help you get started with using the HP Boot Shell (UEFI Shell) to load and boot from an ISO file. If you encounter any specific issues or need further assistance, feel free to ask!
