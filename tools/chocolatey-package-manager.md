[Documentation](../../../tree/1st-drafts) > [Tools](./) > **Chocolatey**

---

![Chocolately](https://raw.githubusercontent.com/8rents/_/i/chocolatey-logo.svg)

# Chocolatey

> ***A Windows Package Manager***

---

## Installation

Ideally run through admin PowerShell terminal. However non admin installs should work ok. Some application installs will fail though.

### Non-Admin Installsxz

https://docs.chocolatey.org/en-us/choco/setup#non-administrative-install

*Verified working fine at SF Library*

```powershell
# Set directory for installation - Chocolatey does not lock
# down the directory if not the default
$InstallDir='C:\ProgramData\chocoportable'
$env:ChocolateyInstall="$InstallDir"

# If your PowerShell Execution policy is restrictive, you may
# not be able to get around that. Try setting your session to
# Bypass.
Set-ExecutionPolicy Bypass -Scope Process -Force;

# All install options - offline, proxy, etc at
# https://chocolatey.org/install
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

## Commands

https://docs.chocolatey.org/en-us/choco/commands/

- `choco` - this is the name of the application
- `search`, `install`,  `upgrade`

### Example

In this example we will search for `rsync` and install it if we find a suitable copy.

***

#### Searching for `rsync`

First let's search the `choco` repository to see if there's a copy of `rsync`.

##### Input

```bash
choco search rsync
```

##### Output

```bash
Chocolatey v1.1.0
rsync 6.2.4 [Approved]
luckybackup 0.4.7.20140107 [Approved] Downloads cached for licensed users
rdiff-backup 2.0.5 [Approved] Downloads cached for licensed users
qtdsync 0.6.20 [Approved] Downloads cached for licensed users
sugarsync 1.9.71.1 - Possibly broken
dirsyncpro 1.53 [Approved] Downloads cached for licensed users
browsersync 1.2.21 [Approved] Downloads cached for licensed users
peonefs 1.0.3938.18045 [Approved] Downloads cached for licensed users
8 packages found.
```

***

#### Installing `rsync`

Since we found a copy (*look at the second line of the output above*) let's install it.

##### Input
```bash
choco install rsync
```

__Note:__ *You can add the `-y` flag onto the install command just like in `apt` *

##### output

```bash
Chocolatey v1.1.0
Installing the following packages:
rsync
By installing, you accept licenses for the packages.
Progress: Downloading rsync 6.2.4... 100%

rsync v6.2.4 [Approved]
rsync package files install completed. Performing other installation steps.
The package rsync wants to run 'chocolateyInstall.ps1'.
Note: If you dont run this script, the installation will fail.
Note: To confirm automatically next time, use '-y' or consider:
choco feature enable -n allowGlobalConfirmation
Do you want to run the script?([Y]es/[A]ll - yes to all/[N]o/[P]rint): y

Extracting C:\ProgramData\chocoportable\lib\rsync\tools\cwrsync_6.2.4_x64_free.zip to C:\ProgramData\chocoportable\lib\rsync\tools...
C:\ProgramData\chocoportable\lib\rsync\tools
 ShimGen has successfully created a shim for rsync.exe
 The install of rsync was successful.
  Software installed to 'C:\ProgramData\chocoportable\lib\rsync\tools'

Chocolatey installed 1/1 packages.
 See the log for details (C:\ProgramData\chocoportable\logs\chocolatey.log).
```

***

#### Using `rsync`

And since the install seemed to go well, let's test out `rsync` by checking to see what version was installed.

##### Input

```bash
rsync -V
```
##### Output

```bash
rsync  version 3.2.3  protocol version 31
Copyright (C) 1996-2020 by Andrew Tridgell, Wayne Davison, and others.
Web site: https://rsync.samba.org/
Capabilities:
    64-bit files, 64-bit inums, 64-bit timestamps, 64-bit long ints,
    socketpairs, hardlinks, no hardlink-specials, symlinks, IPv6, atimes,
    batchfiles, inplace, append, no ACLs, xattrs, optional protect-args,
    iconv, symtimes, prealloc, stop-at, no crtimes
Optimizations:
    no SIMD, asm, openssl-crypto
Checksum list:
    xxh64 (xxhash) md5 md4 none
Compress list:
    zstd lz4 zlibx zlib none

rsync comes with ABSOLUTELY NO WARRANTY.  This is free software, and you
are welcome to redistribute it under
```
***

## How to view the log if something gets screwed up

The log is located at:

```bash
C:\ProgramData\chocoportable\logs\chocolatey.log
```

so 

```bash
ii C:\ProgramData\chocoportable\logs\chocolatey.log
```

should probably work

## 

***

🤍**2023** [GitHub](https://github.com/8rents?tab=repositories) **|** [Google Drive](https://bit.ly/brent-gd) **|** [My Bio](https://my.bio/8rents)
