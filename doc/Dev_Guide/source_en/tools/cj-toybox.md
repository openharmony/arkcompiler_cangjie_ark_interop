# toybox

toybox is a lightweight collection of Linux command-line utilities that combines commonly used Linux commands into a single executable.

## Prerequisites

### Usage Method 1

- Connect the device normally
- Use `hdc shell` to enter command-line execution mode

### Usage Method 2

- Run within application sandbox

## Command Line Instructions

toybox can be executed in two ways:

- `toybox [command] [arguments...]`
- Directly execute `[command] [arguments...]`

Where `[command]` can be replaced with any command supported by toybox (can be queried by running toybox without parameters).
`[arguments...]` represents the parameters required by `[command]`.

<!--RP1-->
<!--RP1End-->

### Help Command

Format: `toybox [--long | --help | --version | [command] [arguments...]]`

| Option | Parameters | Description |
| :- | :- | :- |
| --help | NA | Display command help. |
| --long | NA | Display paths of all supported commands. |
| --version | NA | Display version number. |
| NA | NA | Display all commands supported by `[command]`. |
| [command] | [arguments] | Execute specific command. Most commands also support --help and --version parameters. |

Format: `help [-ah] [command]`

| Parameter | Description |
| :- | :- |
| command | Display help for command. `[command]` can be replaced with any command supported by toybox. |

| Option | Description |
| :- | :- |
| -a | Display help for all commands. |

### Mathematical & Computer Fundamental Functions

| Command | Description |
| :- | :- |
| ascii     | Display ASCII encoding table.<br/>usage: `ascii` |
| factor     | Factorize numbers into primes.<br/>usage: `factor NUMBER...` |
| mcookie | Generate 128-bit strong random number.<br/>usage: `mcookie [-vV]` |
| mkpasswd | Encrypt passwords.<br/>usage: `mkpasswd [-P FD] [-m TYPE] [-S SALT] [PASSWORD] [SALT]` |
| uuidgen    | Create and print new RFC4122 random UUID.<br/>usage: `uuidgen` |

### Terminal Operations

| Command | Description |
| :- | :- |
| chvt   | Switch to virtual terminal N.<br/>usage: `chvt N` |
| chroot | Run command with specified root directory.<br/>usage: `chroot NEWROOT [COMMAND [ARG...]]` |
| clear  | Clear terminal.<br/>usage: `clear` |
| nohup  | Run a command immune to hangups.<br/>usage: `nohup COMMAND [ARG...]` |
| tty    | Display terminal name connected to standard input.<br/>usage: `tty [-s]` |
| reset  | Reset terminal.<br/>usage: `reset` |
| microcom | Simple serial terminal.<br/>usage: `microcom [-s SPEED] [-X] DEVICE` |

### Shell Logic Commands

| Command | Description |
| :- | :- |
| false | Return non-zero value.<br/>usage: `false` |
| sh    | Shell command interpreter. |
| test  | Evaluate conditional expression. Returns false if no arguments.<br/>usage: `test [-bcdefghLPrSsuwx PATH] [-nz STRING] [-t FD] [X ?? Y]` |
| true  | Return zero.<br/>usage: `true` |
| yes   | Repeatedly output line until killed. Outputs "y" if no arguments.<br/>usage: `yes [args...]` |

### System Operations

| Command | Description |
| :- | :- |
| acpi   | Query power/temperature status.<br/>usage: `acpi [-abctV]` |
| arch | Print system architecture.<br/>usage: `arch` |
| dmesg | Display or control kernel ring buffer.<br/>usage: `dmesg [-Cc] [-r \| -t \| -T] [-n LEVEL] [-s SIZE] [-w]` |
| dnsdomainname | Display system name (same as `hostname -d`).<br/>usage: `dnsdomainname` |
| getconf   | Get system configuration values, some require path parameter.<br/>usage: `getconf -a [PATH] \| -l \| NAME [PATH]` |
| env       | Set environment for command invocation or list environment variables.<br/>usage: `env [-i] [-u NAME] [NAME=VALUE...] [COMMAND [ARG...]]` |
| hostname  | Get/set current hostname.<br/>usage: `hostname [-bdsf] [-F FILENAME] [newname]` |
| insmod    | Load kernel module.<br/>usage: `insmod MODULE [MODULE_OPTIONS]` |
| logger    | Log system messages.<br/>usage: `logger [-s] [-t TAG] [-p [FACILITY.]PRIORITY] [message...]` |
| lsmod     | Display currently loaded modules with sizes and dependencies.<br/>usage: `lsmod` |
| mix       | Display OSS channels or set volume.<br/>usage: `mix [-d DEV] [-c CHANNEL] [-l VOL] [-r RIGHT]` |
| modinfo   | Display kernel module information.<br/>usage: `modinfo [-0] [-b basedir] [-k kernel] [-F field] [module \| file...]` |
| nproc     | Print number of processors.<br/>usage: `nproc [--all]` |
| oneit     | Simple init program.<br/>usage: `oneit [-p] [-c /dev/tty0] command [...]` |
| partprobe | Inform kernel of partition table changes.<br/>usage: `partprobe DEVICE...` |
| pivot_root | Change root directory.<br/>usage: `pivot_root OLD NEW` |
| printenv  | Print environment variables.<br/>usage: `printenv [-0] [env_var...]` |
| reboot/halt/poweroff | Reboot/stop/shutdown.<br/>usage: `reboot/halt/poweroff [-fn]` |
| rfkill    | Enable/disable wireless devices.<br/>usage: `rfkill COMMAND [DEVICE]` |
| rmmod     | Unload kernel module.<br/>usage: `rmmod [-wf] [MODULE]` |
| sendevent | Send Linux input event.<br/>usage: `sendevent DEVICE TYPE CODE VALUE` |
| swapoff   | Disable swap space.<br/>usage: `swapoff swapregion` |
| swapon    | Enable swapping on specified device/file.<br/>usage: `swapon [-d] [-p priority] filename` |
| switch_root | Switch root directory and execute new INIT program.<br/>usage: `switch_root [-c /dev/console] NEW_ROOT NEW_INIT...` |
| uname     | Print system information.<br/>usage: `uname [-asnrvm]` |
| vmstat    | Print virtual memory statistics.<br/>usage: `vmstat [-n] [DELAY [COUNT]]` |

### Time & Date

| Command | Description |
| :- | :- |
| cal     | Print calendar.<br/>usage: `cal [[month] year]` |
| date    | Set/get current date/time.<br/>usage: `date [-u] [-r FILE] [-d DATE] [+DISPLAY_FORMAT] [SET]` |
| hwclock | Get/set hardware clock.<br/>usage: `hwclock [-rswtluf]` |
| sleep   | Wait for specified duration before exiting. Can be decimal. Optional suffixes: "m" (minutes), "h" (hours), "d" (days) or "s" (seconds, default).<br/>usage: `sleep DURATION` |
| time    | Run command line and report real, user and system time in seconds.<br/>usage: `time [-pv] COMMAND [ARGS...]` |
| uptime  | Display current time, system uptime, user count, and 1/5/15 minute load averages.<br/>usage: `uptime [-ps]` |
| usleep  | Wait for specified microseconds before exiting.<br/>usage: `usleep MICROSECONDS` |

### User Operations

| Command | Description |
| :- | :- |
| groups  | Print user's groups.<br/>usage: `groups [user]` |
| id      | Print user and group IDs.<br/>usage: `id [-nGgru] [USER...]` |
| login   | User login.<br/>usage: `login [-p] [-h host] [-f USERNAME] [USERNAME]` |
| logname/whoami | Print current username.<br/>usage: `logname/whoami` |
| passwd  | Update user's authentication tokens.<br/>usage: `passwd [-a ALGO] [-dlu] [USER]` |
| who     | Print information about logged-in users.<br/>usage: `who` |
| w       | Show who is logged on and what they're doing.<br/>usage: `w` |

### Process Operations

| Command | Description |
| :- | :- |
| chrt      | Get/set process scheduling policy and priority.<br/>usage: `chrt [-Rmofrbi] {-p PID [PRIORITY] \| [PRIORITY COMMAND...]}` |
| iorenice  | Show/modify process I/O priority.<br/>usage: `iorenice PID [CLASS] [PRIORITY]` |
| iotop     | Sort processes by I/O.<br/>usage: `iotop [-AaKObq] [-n NUMBER] [-d SECONDS] [-p PID,] [-u USER,]` |
| ionice    | Show/modify process I/O scheduling priority.<br/>usage: `ionice [-t] [-c CLASS] [-n LEVEL] [COMMAND...\|-p PID]` |
| kill      | Send signal to process.<br/>usage: `kill [-l [SIGNAL] \| -s SIGNAL \| -SIGNAL] pid...` |
| killall   | Send signal to all processes with given name (default: SIGTERM).<br/>usage: `killall [-l] [-iqv] [-SIGNAL \| -s SIGNAL]  PROCESS_NAME...` |
| killall5  | Send signal to all processes outside current session.<br/>usage: `killall5 [-l [SIGNAL]] [-SIGNAL \| -s SIGNAL] [-o PID]...` |
| pidof   | Print PIDs of all processes with given name.<br/>usage: `pidof [-s] [-o omitpid[,omitpid...]] [NAME...]` |
| pkill   | Kill processes by name.<br/>usage: `pkill [-fnovx] [-SIGNAL \| -l SIGNAL] [PATTERN] [-G GID,] [-g PGRP,] [-P PPID,] [-s SID,] [-t TERM,] [-U UID,] [-u EUID,]` |
| pmap    | View process memory map.<br/>usage: `pmap [-xq] [pids...]` |
| ps      | Display process information.<br/>usage: `ps [-AadefLlnwZ] [-gG GROUP,] [-k FIELD,] [-o FIELD,] [-p PID,] [-t TTY,] [-uU USER,]` |
| pwdx    | Print process working directory.<br/>usage: `pwdx PID...` |
| renice  | Adjust process/group/user priority.<br/>usage: `renice [-gpu] -n increment ID ...` |
| setsid  | Run command in new session.<br/>usage: `setsid [-t] command [args...]` |
| taskset | Start task running only on specified processors, or modify existing process processor affinity.<br/>usage: `taskset [-ap] [mask] [PID \| cmd [args...]]` |
| timeout | Create child process to execute command, send signal if child doesn't exit within timeout. DURATION can be decimal. Optional suffixes: "m" (minutes), "h" (hours), "d" (days) or "s" (seconds, default).<br/>usage: `timeout [-k DURATION] [-s SIGNAL] DURATION COMMAND...` |
| top     | Display real-time process information.<br/>usage: `top [-Hhbq] [-k FIELD,] [-o FIELD,] [-s SORT] [-n NUMBER] [-m LINES] [-d SECONDS] [-p PID,] [-u USER,]` |
| nice    | Run command with specified priority.<br/>usage: `nice [-n PRIORITY] COMMAND [ARG...]` |
| nsenter | Run command in specified namespace.<br/>usage: `nsenter [-t pid] [-F] [-i] [-m] [-n] [-p] [-u] [-U] COMMAND...` |
| ulimit/prlimit | Display/set process resource limits.<br/>usage: `ulimit/prlimit [-P PID] [-SHRacdefilmnpqrstuv] [LIMIT]` |
| unshare | Create new namespace for process, some attributes not shared with parent.<br/>usage: `unshare [-imnpuUr] COMMAND...` |
| watch   | Run command every -n seconds, display output. Press q to quit.<br/>usage: `watch [-teb] [-n SEC] PROG ARGS` |
| xargs   | Run command line one or more times, appending arguments from stdin.<br/>usage: `xargs [-0prt] [-s NUM] [-n NUM] [-E STR] COMMAND...` |

### Device Node Operations

| Command | Description |
| :- | :- |
| blkid       | Print filesystem type, label, UUID etc.<br/>usage: `blkid [-s TAG] [-UL] DEV...` |
| blockdev    | Call ioctl for each block device in command.<br/>usage: `blockdev --OPTION... BLOCKDEV...` |
| devmem      | Read/write physical address via /dev/mem.<br/>usage: `devmem ADDR [WIDTH [DATA]]` |
| df          | Show total, used and free disk space for each filesystem listed. Shows all mounted filesystems if no arguments.<br/>usage: `df [-HPkhi] [-t type] [FILESYSTEM ...]` |
| du          | Show disk usage, space taken by files/directories.<br/>usage: `du [-d N] [-askxHLlmc] [file...]` |
| eject       | Eject device, default /dev/cdrom.<br/>usage: `eject [-stT] [DEVICE]` |
| free        | Show total, used and free physical memory and swap space.<br/>usage: `free [-bkmgt]` |
| freeramdisk | Free all memory for specified ramdisk.<br/>usage: `freeramdisk [RAM device]` |
| fsfreeze    | Freeze or unfreeze filesystem.<br/>usage: `fsfreeze {-f \| -u} MOUNTPOINT` |
| fstype      | Print filesystem type.<br/>usage: `fstype DEV...` |
| fsync       | Synchronize file state with storage device.<br/>usage: `fsync [-d] [FILE...]` |
| i2cdetect   | Detect i2c devices.<br/>usage:<br/>&emsp;`i2cdetect [-ary] BUS [FIRST LAST]`<br/>&emsp;`i2cdetect -F BUS`<br/>&emsp;`i2cdetect -l`|
| i2cdump     | Print all i2c registers.<br/>usage: `i2cdump [-fy] BUS CHIP` |
| i2cget      | Read i2c register.<br/>usage: `i2cget [-fy] BUS CHIP ADDR` |
| i2cset      | Write i2c register.<br/>usage: `i2cset [-fy] BUS CHIP ADDR VALUE... MODE` |
| losetup     | Set up loop devices.<br/>usage: `losetup [-cdrs] [-o OFFSET] [-S SIZE] {-d DEVICE... \| -j FILE \| -af \| {DEVICE FILE}}` |
| lspci       | Display PCI device information.<br/>usage: `lspci [-ekmn] [-i FILE ]` |
| lsusb       | Display USB device information.<br/>usage: `lsusb` |
| makedevs    | Create special files including block/character device files.<br/>usage: `makedevs [-d device_table] rootdir` |
| mount       | Mount new filesystem on directory. Shows existing mounts if no arguments.<br/>usage: `mount [-afFrsvw] [-t TYPE] [-o OPTION,] [[DEVICE] DIR]` |
| mountpoint  | Check if directory/device is mountpoint.<br/>usage:<br/>&emsp;`mountpoint [-qd] DIR`<br/>&emsp;`mountpoint [-qx] DEVICE` |
| sync        | Write cached data to disk.<br/>usage: `sync` |
| sysctl      | Read/write system control data under /proc/sys.<br/>usage: `sysctl [-aAeNnqw] [-p [FILE] \| KEY[=VALUE]...]` |
| tunctl      | Create/delete tun/tap virtual ethernet devices.<br/>usage: `tunctl [-dtT] [-u USER] NAME` |
| vconfig     | Create/delete virtual ethernet devices.<br/>usage: `vconfig COMMAND [OPTIONS]` |
| umount      | Unmount filesystem.<br/>usage: `umount [-a [-t TYPE[,TYPE...]]] [-vrfD] [DIR...]` |

### Network Operations

| Command | Description |
| :- | :- |
| ftpget/ftpput | Communicate with FTP server, supports operations like reading, writing, and listing files. ftpget includes the -g option by default. ftpput includes the -s option by default.<br/>usage: ftpget/ftpput [-cvgslLmMdD] [-p PORT] [-P PASSWORD] [-u USER] HOST [LOCAL] REMOTE |
| ifconfig      | Display or configure network interfaces.<br/>usage: ifconfig [-aS] [INTERFACE [ACTION...]] |
| nbd-client    | Create an NBD client.<br/>usage: nbd-client [-ns] HOST PORT DEVICE |
| netstat   | Display network information.<br/>usage: netstat [-pWrxwutneal] |
| ping/ping6    | Test network connectivity. ping6 includes the -6 option by default.<br/>usage: ping/ping6 [OPTIONS] HOST |
| sntp    | SNTP client.<br/>usage: sntp [-saSdDqm] [-r SHIFT] [-m ADDRESS] [-p PORT] [SERVER] |
| telnet  | Connect to a telnet server.<br/>usage: telnet HOST [PORT] |
| traceroute/traceroute6 | Trace the path of packets to HOST. traceroute6 includes the -6 option by default.<br/>usage: traceroute [-46FUIldnvr] [-f 1ST_TTL] [-m MAXTTL] [-p PORT] [-q PROBES] [-s SRC_IP] [-t TOS] [-w WAIT_SEC] [-g GATEWAY] [-i IFACE] [-z PAUSE_MSEC] HOST [BYTES]<br/>usage: traceroute6 [-dnrv] [-m MAXTTL] [-p PORT] [-q PROBES][-s SRC_IP] [-t TOS] [-w WAIT_SEC] [-i IFACE] HOST [BYTES] |
| wget    | Download resources from the network.<br/>usage: wget [OPTIONS]... [URL]<br/>[OPTIONS] = --max-redirect x -d -O filename -p data|

### File Operations

| Command | Description |
| :- | :- |
| awk       | awk is a text processing tool for filtering and analyzing document content.<br/>usage: awk [-F sepstring] [-v assignment]... program [argument...]<br/>&emsp;or:&emsp;awk [-F sepstring] -f progfile [-f progfile]... [-v assignment]... [argument...] |
| base64    | Encrypt/decrypt using the base64 algorithm.<br/>usage: base64 [-di] [-w COLUMNS] [FILE...] |
| basename  | Return the non-directory portion of a pathname after removing the suffix.<br/>usage: basename [-a] [-s SUFFIX] NAME... \| NAME [SUFFIX] |
| bunzip2   | Decompress files in bz format.<br/>usage: bunzip2 [-cftkv] [FILE...] |
| bzcat     | Decompress listed files to standard output.<br/>usage: bzcat [FILE...] |
| cat       | Copy (concatenate) files to standard output. If no files are listed, copy from standard input. "-" represents standard input.<br/>usage: cat [-etuv] [FILE...] |
| chattr    | Modify file attributes on Linux ext2 filesystems.<br/>usage: chattr [-R] [-+=AacDdijsStTu] [-v version] [File...] |
| chcon     | Modify the SELinux security context of files.<br/>usage: chcon [-hRv] CONTEXT FILE... |
| chgrp/chown | Change the group ownership of files.<br/>usage: chgrp/chown [-RHLP] [-fvh] group file... |
| chmod     | Change the mode of listed files (use -R for recursion).<br/>usage: chmod [-R] MODE FILE... |
| cksum     | For each file, output the CRC32 checksum, length, and filename. If no files are listed, copy from standard input. "-" represents standard input.<br/>usage: cksum [-IPLN] [file...] |
| cmp       | Compare file contents (if only one file is given, compare with standard input), optionally skipping bytes at the start.<br/>usage: cmp [-l] [-s] FILE1 [FILE2 [SKIP1 [SKIP2]]] |
| comm      | Read FILE1 and FILE2 (both should be sorted) and produce three text columns as output: lines only in FILE1, lines only in FILE2, and lines common to both. "-" represents standard input.<br/>usage: comm [-123] FILE1 FILE2  |
| count     | Copy standard input to standard output, displaying a simple progress indicator to stderr.<br/>usage: count |
| cp        | Copy files from SOURCE to DEST. If multiple sources are given, DEST must be a directory.<br/>usage: cp [-adfHiLlnPpRrsTv] [--preserve=motcxa] [-t TARGET] SOURCE... [DEST] |
| cpio      | Read/write files from/to "newc" format cpio archives.<br/>usage: cpio -{o\|t\|i\|p DEST} [-v] [--verbose] [-F FILE] [--no-preserve-owner]<br/>&emsp;[ignored: -mdu -H newc] |
| crc32     | Output the CRC32 checksum for each file.<br/>usage: crc32 [file...] |
| cut       | Print selected portions of lines from each FILE to standard output. Each selection list is comma-separated and can be numbers (counting from 1) or dash-separated ranges (where X- means X to end of line, -X means start to X).<br/>usage: cut [-Ds] [-bcfF LIST] [-dO DELIM] [FILE...] |
| dd        | A command for converting and copying files, used for tasks like creating disk images, backing up data, and converting character encodings.<br/>usage:<br/>&emsp; dd [if=FILE] [of=FILE] [ibs=N] [obs=N] [iflag=FLAGS] [oflag=FLAGS]<br/>&emsp; [bs=N] [count=N] [seek=N] [skip=N]<br/>&emsp; [conv=notrunc\|noerror\|sync\|fsync] [status=noxfer\|none] |
| diff      | Compare files/directories and output differences.<br/>usage: diff [-abBdiNqrTstw] [-L LABEL] [-S FILE] [-U LINES] FILE1 FILE2 |
| dirname   | Display the directory portion of a path.<br/>usage: dirname PATH... |
| dos2unix  | Convert line endings from DOS "\r\n" to Unix "\n". If no files are listed, read from standard input. "-" represents standard input.<br/>usage: dos2unix [FILE...] |
| echo      | Write each argument to standard output, separated by spaces and followed by a newline.<br/>usage: echo [-neE] [args...] |
| grep/egrep/fgrep | Display lines matching a regular expression. If -e is not used, the first argument is the regex to match. No files (or "-" filename) reads from standard input. Returns 0 if matched, 1 if no match, and 2 on error.<br/>egrep includes -E by default, fgrep includes -F by default. E and F options cannot be used together.<br/>usage: grep/egrep/fgrep [-EFrivwcloqsHbhn] [-ABC NUM] [-m MAX] [-e REGEX]... [-MS PATTERN]... [-f REGFILE] [FILE]... |
| gzip      | Compress files.<br/>usage: gzip [-19cdfk] [FILE...] |
| expand    | Convert tabs to spaces based on input parameters.<br/>usage: expand [-t TABLIST] [FILE...] |
| fallocate | Allocate space for files in the filesystem.<br/>usage: fallocate [-l size] [-o offset] file |
| file      | Examine given files and describe their content type.<br/>usage: file [-bhLs] [file...] |
| find      | Search for files matching criteria in directories.<br/>usage: find [-HL] [DIR...] [&lt;options&gt;] |
| flock     | Manage file locks (advisory lock).<br/>usage: flock [-sxun] fd |
| fmt       | Reformat input to wrap lines at the given width, preserving existing indentation levels, and write to standard output.<br/>usage: fmt [-w WIDTH] [FILE...] |
| gunzip    | Decompress files. If no files are given, decompress from standard input to standard output. On success, input files are deleted and replaced with new files without the .gz suffix.<br/>usage: gunzip [-cfk] [FILE...] |
| head      | Copy the first lines of a file to standard output. If no files are listed, copy from standard input. "-" represents standard input.<br/>usage: head [-n number] [file...] |
| hexedit   | Hexadecimal file editor, with all modifications written to disk immediately.<br/>usage: hexedit FILENAME |
| iconv     | Convert file encoding.<br/>usage: iconv [-f FROM] [-t TO] [FILE...] |
| inotifyd  | Run a specific program when filesystem events occur.<br/>usage: inotifyd PROG FILE[:MASK] ... |
| install   | Copy files and set file attributes.<br/>usage: install [-dDpsv] [-o USER] [-g GROUP] [-m MODE] [-t TARGET] [SOURCE...] [DEST] |
| link      | Create a hard link to a file.<br/>usage: link FILE NEWLINK |
| ln        | Create a symbolic/hard link between FROM and TO.<br/>usage: ln [-sfnv] [-t DIR] [FROM...] TO |
| ls        | List files/directories in the current directory.<br/>usage: ls [-ACFHLRSZacdfhiklmnpqrstux1] [--color[=auto]] [directory...] |
| lsattr    | List file attributes on Linux filesystems. Flag letters are defined in chattr help.<br/>usage: lsattr [-Radlv] [Files...] |
| lsof      | List all open files belonging to all active processes, or processes using the listed FILEs.<br/>usage: lsof [-lt] [-p PID1,PID2,...] [FILE...] |
| md5sum    | Compute the hash for each input file, or read from standard input if none given. Outputs one line per file with hash followed by filename.<br/>usage: md5sum [-bcs] [FILE]... |
| mkdir     | Create one or more directories.<br/>usage: mkdir [-vp] [-m mode] [dirname...] |
| mkfifo    | Create FIFO files (named pipes).<br/>usage: mkfifo [NAME...] |
| mkswap    | Create Linux swap space.<br/>usage: mkswap [-L LABEL] DEVICE |
| mktemp    | Safely create a new file "DIR/TEMPLATE" and print its name.<br/>usage: mktemp [-dqu] [-p DIR] [TEMPLATE] |
| mknod     | Create a special file (b for block device, c or u for character device, p for named pipe).<br/>usage: mknod [-m MODE] NAME TYPE [MAJOR MINOR] |
| more      | View files one page at a time.<br/>usage: more [FILE...] |
| mv        | Move or rename files.<br/>usage: mv [-finTv] [-t TARGET] SOURCE... [DEST] |
| nl        | Add line numbers to input files.<br/>usage: nl [-E] [-l #] [-b MODE] [-n STYLE] [-s SEPARATOR] [-v #] [-w WIDTH] [FILE...] |
| od        | Dump data in octal/hexadecimal format.<br/>usage: od [-bcdosxv] [-j #] [-N #] [-w #] [-A doxn] [-t acdfoux[#]] |
| paste     | Merge corresponding lines from each input file.<br/>usage: paste [-s] [-d DELIMITERS] [FILE...] |
| patch     | Apply unified diff to one or more files.<br/>usage: patch [-d DIR] [-i file] [-p depth] [-Rlsu] [--dry-run] |
| pgrep     | Find processes. PATTERN is an extended regex for matching command names.<br/>usage: pgrep [-clfnovx] [-d DELIM] [-L SIGNAL] [PATTERN] [-G GID,] [-g PGRP,] [-P PPID,] [-s SID,] [-t TERM,] [-U UID,] [-u EUID,] |
| printf    | Format and print arguments using C-style printf syntax.<br/>usage: printf FORMAT [ARGUMENT...] |
| pwd       | Print the working (current) directory.<br/>usage: pwd [-L \| -P] |
| readahead | Preload files into disk cache.<br/>usage: readahead FILE... |
| readlink  | Without options, display what a symlink points to; return error if not a symlink.<br/>usage: readlink FILE... |
| realpath  | Display canonical absolute pathnames.<br/>usage: realpath FILE... |
| rev       | Reverse the order of characters in each line.<br/>usage: rev [FILE...] |
| rm        | Delete files.<br/>usage: rm [-fiRrv] FILE... |
| rmdir     | Remove one or more directories.<br/>usage: rmdir [-p] [dirname...] |
| sed       | Stream editor. Apply editing scripts to input lines.<br/>usage: sed [-inrzE] [-e SCRIPT]... \| SCRIPT [-f SCRIPT\_FILE]... [FILE...] |
| seq       | Count incrementally from first to last. Omitted arguments default to 1. Two arguments are treated as first and last. Arguments can be negative or floating-point.<br/>usage: seq [-w \| -f fmt\_str] [-s sep\_str] [first] [increment] last |
| setfattr  | Write POSIX extended attributes.<br/>usage: setfattr [-h] [-x \| -n NAME] [-v VALUE] FILE... |
| sha1sum/sha256sum | Compute SHA series hashes.<br/>usage: sha?sum [-bcs] [FILE]... |
| shred     | Securely delete files (overwrite file contents with random data).<br/>usage: shred [-fuz] [-n COUNT] [-s SIZE] FILE... |
| sort      | Sort all text lines from input files (or standard input) to standard output.<br/>usage: sort [-Mbcdfginrsuz] [FILE...] [-k#[,#[x]] [-t X]] [-o FILE] |
| split     | Copy input (or standard input) data to a series of output (or "x") files, using alphabetically increasing suffixes (aa, ab, ac...az, ba, bb...).<br/>usage: split [-a SUFFIX\_LEN] [-b BYTES] [-l LINES] [INPUT [OUTPUT]] |
| stat      | Display file or filesystem status.<br/>usage: stat [-tfL] [-c FORMAT] FILE... |
| strings   | Display printable strings in binary files.<br/>usage: strings [-fo] [-t oxd] [-n LEN] [FILE...] |
| tac       | Output lines in reverse order.<br/>usage: tac [FILE...] |
| tail      | Copy the last few lines of a file to standard output. "-" represents standard input.<br/>usage: tail [-n\|c NUMBER] [-f] [FILE...] |
| tar       | Create, extract, or list files in .tar archives.<br/>usage: tar [-cxt] [-fvohmjkOS] [-XTCf NAME] [FILES] |
| tee       | Copy standard input to each listed file and to standard output. "-" represents standard output.<br/>usage: tee [-ai] [file...] |
| touch     | Update the access and modification times of each FILE to the current time.<br/>usage: touch [-amch] [-d DATE] [-t TIME] [-r FILE] FILE... |
| truncate  | Set file length, sparsely extending if necessary.<br/>usage: truncate [-c] -s SIZE file... |
| uniq      | Report or filter duplicate lines in files.<br/>usage: uniq [-cduiz] [-w maxchars] [-f fields] [-s char] [input\_file [output\_file]] |
| unix2dos  | Convert line endings from Unix "\n" to DOS "\r\n". If no files are listed, read from standard input. "-" represents standard input.<br/>usage: unix2dos [FILE...] |
| unlink    | Delete a file.<br/>usage: unlink FILE |
| uudecode  | Decode a file from standard input (or INFILE).<br/>usage: uudecode [-o OUTFILE] [INFILE] |
| uuencode  | Encode standard input (or a file) to standard output, including encode-filename in the output.<br/>usage: uuencode [-m] [file] encode-filename |
| wc        | Count lines, words, and characters in input.<br/>usage: wc -lwcm [FILE...] |
| which     | Search \$PATH for executables matching the filename.<br/>usage: which [-a] filename ... |
| xxd       | Display file contents in hexadecimal. If no files are listed, copy from standard input.<br/>usage: xxd [-c n] [-g n] [-i] [-l n] [-o n] [-p] [-r] [-s n] [file] |
| zcat      |Uncompress the file to the standard output device. For example, "gzip -dc". <br/> usage: zcat [FILE...] |

## Frequently Asked Questions

### Error: "Unknown command xxx"

When entering "xxx", "toybox xxx", or "help xxx" in the command line, if you encounter the error "Unknown command xxx", it indicates that toybox does not support the xxx command.

<!--RP2-->
If this command is documented in this article, it means the product hasn't compiled this command. It is recommended to raise the issue on the OpenHarmony official forum for feedback.
<!--RP2End-->

### Error: "Operation not permitted"/"Permission denied"

toybox contains numerous commands for file and process operations. If the caller lacks permissions for the target object, these errors will occur.

1. Permission deficiency. Check the read, write, and execute permissions of the target file and its parent directory to confirm your access rights.
2. SELinux interception. Search for the keyword "avc: denied" in kernel logs.

    Example:

    If logs similar to "avc: denied { xxx } for comm="ls" xxxxxx" appear, it indicates the ls command triggered an SELinux interception.

<!--RP3-->
If you encounter permission issues but need to execute the command, it is recommended to raise the issue on the OpenHarmony official forum for feedback.
<!--RP3End-->

### Other Standard Linux Errors

Most toybox commands are kernel calls. When errors occur, they print Linux kernel error codes via perror.

Common errors include: "File exists", "Not a directory", "Read-only file system", etc.

These are standard Linux errors. Refer to Linux documentation for troubleshooting. Check command parameters or syntax based on specific error messages.

Examples:

Attempting to create a file in a read-only filesystem will generate the error "Read-only file system".

The cat command prints file contents. Attempting to cat a directory will produce the error "Is a directory".

Using ls to view a non-existent file or directory will result in "No such file or directory".

### Command Behavior Inconsistent with toybox Description

If you find discrepancies between "command arguments" and "toybox command arguments" in the shell, there are two possible causes:

1. The shell's native implementation is being called instead of toybox.

    For commands like time/test/pwd/realpath/ulimit/kill, the shell uses its own implementation.
    To invoke the toybox version, use the format: "toybox [command] [arguments...]".

2. The device has configured an alternative implementation instead of toybox for this command.

    To invoke the toybox version, use the format: "toybox [command] [arguments...]".
```