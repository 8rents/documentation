# PowerShell

> #### *My guide to learning PowerShell*

## Getting Started

### Opening PowerShell console:
1. Hit the windows key
2. type `Powershell`
3. hit enter

### Official Docs

* https://docs.microsoft.com/en-us/powershell/scripting/learn/ps101/01-getting-started?view=powershell-7.2

## Basic Commands

### Current folder location

```powershell
Get-Location
```
> *You can tab complete this by typing `Get-Loc` & hitting tab a few times.*

### File paths

Make sure tp use `\` forward slash for silly mMicrosoft path names.

#### Changing to common folders

```powershell
# C drive root
cd C:\

# Library User folder
cd ~

#Usexrs folder
cd C:\Users\
cd ~

# User download folder
cd ~\Downloads
cd ~\Dropbox
```

## Running multiple commands on a single line

To execute multiple commands on a single line, use a semi-colon `;` *(and not `&&` like you would in a Linux / mac terminal)*  to chain the commands together.

For example to **move into your home folder and then list all of contents** you could do this:

```powershell
cd ~/; ls
```

## Nifty Commands

### Update PowerShell Help

```powershell
Update-Help
Editing the execution policy for the current user
```

> *This can't really actually work....*

```powershell
# Set the policy
Set-ExecutionPolicy -Scope CurrentUser Unrestricted

# Check the Policy
Get-ExecutionPolicy -List
```


### Flag to install scripts to the current user
```powershell
-Scope CurrentUser
```

### Turn on dark mode

```bash
powershell
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0
```


### Back up the Dropbox location to USB

```bash
robocopy CD:\Users\sfplinternetDropbox\Config /MIR /FFT /Z /XA:H /W:5; robocopy ~\Dropbox D:\Dropbox /MIR /FFT /Z /XA:H /W:5
```

### Install Windows Linux Subsystem

__This won't work at the library__ because it requires elevated permissions. 

> *Let’s see if we can find a work around for this in a later guide….*

```powershell
wsl --install
```

Choosing `Debian` as the distro

```powershell
wsl --install -d debian
```


### Using the AppData folders

The `APPDATA` folders hold different settings and information on Application Data.

The `%APPDATA%` folder is located at:

```tex
C:\Users\sfplinternet\AppData\Roaming
```

This is where most user installed application data will be.

##### The local app data folder is located at:

```tex
C:\Users\sfplinternet\AppData\Local
```