

# PowerShell
> #### My guide to learning pPowersShell

## Getting Started

### Opening pPowersShell console:
1. hit the windows key
2. type `Powershell`
3. hit enter

### Official Docs
<
- <https://docs.microsoft.com/en-us/powershell/scripting/learn/ps101/01-getting-started?view=powershell-7.2>

## bBasic Commands

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

##  Running multiple commands on a single line

To execute multiple commands on a single line, use a semi-colon `;` *(and not `&&` like you would in a linux/mac terminal)*  to chain the commands together.

For example to **move into your home folder and then list all of contents** you could do this:

```powershell
cd ~/; ls
```

## Nifty Commands

### Update Powershell Help

```powershell
Update-HelpEditing the execution policy for the current user

This can't really actually work....

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

__This won't work at the library__ because it requires elevated permissions

```powershell
wsl --install
```


###  -d debian
```

```powershell
wsl --install
```


### Using the AppData folders

Using the AppData folders. But, since this is an important command that we will likely use on other Windows systems, here it is:

```powershell
wsl --install
```


### Using the AppData folders

The `APPDATA` folders hold different settings and information on Application Data.

The `%APPDATA%` folder is located at:

`C:\Users\sfplinternet\AppData\Roaming`

This is where most user installed application data will be.

##### The local app data folder is located at:

`C:\Users\sfplinternet\AppData\Local`

### Open the app data folder

The`appdata` folder is located in the `~/` folder and called `appdata`. It's hidden by default. `roaming` is the most common folder that is used for user installs and files.

#### Open a folder from the command line

`Invoke-Item` or it's alias `ii` works

`ii .`

### Downloading a file

```powershell
Invoke-WebRequest -Uri <source> -OutFile <destination>
```




```powershell

```

```powershell

```
<!--stackedit_data:
eyJwcm9wZXJ0aWVzIjoidGl0bGU6IFBvd2VyU2hlbGxcbmF1dG
hvcjogQnJlbnRvbiBIb2xpZGF5XG50YWdzOiAncG93ZXJzaGVs
bCwgY2xpLCB3aW5kb3dzJ1xuZXhjZXJwdDogTm90ZXMgb24gdX
NpbmcgUG93ZXJTaGVsbCBvbiBhIGdpbXBlZCBwdWJsaWMgV2lu
ZG93cyBjb21wdXRlclxuc3RhdHVzOiBkcmFmdFxuZGF0ZTogJz
IwMjItMDItMjInXG5leHRlbnNpb25zOlxuICBwcmVzZXQ6IGdm
bVxuY2F0ZWdvcmllczogZG9jc1xuIiwiaGlzdG9yeSI6WzIwOT
I3MzAxNSwxNTg5NTYxNjU5LDE5MTIzMDg3MDUsLTE4NzUzNjkx
MTksLTE3MjE5Mzc3MzksOTQ4OTk5MzQwLC0xODM4MDIwNjYwLD
Q0MDE0NTQxMywtMTUxODc2MTU3NSwtMzQ3OTU4OTk4LC04ODMz
MDYzODMsMTkzNjc2MjE4Ml19
-->