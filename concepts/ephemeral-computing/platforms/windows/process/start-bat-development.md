[Ephemeral Computing](../../../README.md) > [Windows Limited](../../README.md) > [Process](README.md) > **Script Notes**

# <img src="https://raw.githubusercontent.com/8rents/_/i/sfpl-logo.png" alt="SFPL Logo" style="zoom:33%;" />  Developing start scripts and Windows Limited Workflow

> ####  *Start scripts for Public windows computer for use with the [Ephemeral Computing workflow for Gimped Windows](#) setups*

---

- **[⬆ ⬆ Other Operating Systems](../../README.md)**

- **[⬆ Windows Limited Workflow](../README.md)**

**`Process Documents`**  [**To Do List**](todo.md)

## Table of Contents

1. [Introduction](README.md)
2. **Start bat script development**
3. [Typora Automatic Set up](typora-automatic-setup.md)

---

## Put Library computer on hold

If you need to lock the computer while signed in.

```powershell
# Key command
ctrl + alt + delete
```

> **Note:** *You’ll be signed out after 10 minutes if you don’t sign back in.*

---

## `start-min.bat` *(so far)*

Script has to be run in `PowerShell`. It will not work in `CMD` or `bash`

```powershell
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0; $InstallDir='C:\ProgramData\chocoportable'; $env:ChocolateyInstall="$InstallDir"; Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')); choco install rsync unison github-desktop adb curl wget bitwarden yt-dlg.portable vim fzf hackfont -y; $nvim = 'C:\tools\neovim\nvim-win64\bin'; $vim = 'C:\tools\vim\vim90'; $env:PATH += ";$vim;$nvim"; echo "`r`nvim & nvim have been added to PATH and are ready to use!" cd 'D:\'; cp -r "D:\Settings\OS\Windows\Programs\Installed\Typora\Data" "C:\Users\sfplinternet\AppData\Roaming\Typora"; "D:\Settings\OS\Windows\Programs\Installed\Typora\Typora\Typora.exe"; echo "`r`n`r`nLooks like all the installs went well! Have fun!`r`n"
```

## Script in Sequence

1. ### Configure Windows
  1. Dark Theme
2. ### Install Apps With Chocolately
  1. Install Choco
  2. Install Apps
  3. Add apps to path (nvim & vim)
3. ### Sync Installed App Preferences
    *See: [Installed App Preferences Sync Doc](installed -app-pref-sync.md)*
  1. Change Directory to `D:\`
  2. Copy Typora preferences 
  3. Open Typora

---

## `start.bat` breakdown

```powershell
@ECHO OFF

# Dark Theme
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0; 

# Install Chocolatey
$InstallDir='C:\ProgramData\chocoportable'; $env:ChocolateyInstall="$InstallDir"; Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));

# Install Apps
choco install git rsync unison github-desktop adb curl wget bitwarden yt-dlg.portable vim neovim fzf hackfont -y; 

# Modify Path (vim & nvim)
$nvim = 'C:\tools\neovim\nvim-win64\bin';
$vim = 'C:\tools\vim\vim90';
$env:PATH += ";$vim;$nvim";

# Confirmation
echo "`r`n`r`nLooks like everything went well! Have fun!`r`n`r`n";

# Change WD
cd 'D:\'

# Copy Typora Preferences to C:\
cp -r "D:\Settings\OS\Windows\Programs\Installed\Typora\Data" "C:\Users\sfplinternet\AppData\Roaming\Typora";

# Open Typora from D:\
"D:\Settings\OS\Windows\Programs\Installed\Typora\Typora\Typora.exe"; 

# Confirmation
echo "`r`n`r`nLooks like all the installs went well! Have fun!`r`n"

PAUSE
```

---

## Testing - `test.bat`

A quick test script to see if scripts will load on this machine.

```powershell
@ECHO OFF

# Message to Echo
ECHO Hello World! Your first batch file was printed on the screen successfully.

PAUSE
```

---

## Copying Typora Preferences

Copy finalized preferences folder over `C:\` data directory and then start Typora.

```powershell
# Copy Data Directory from D to C
cp -r "D:\Settings\OS\Windows\Programs\Installed\Typora\Data" "C:\Users\sfplinternet\AppData\Roaming\Typora";

# Start Typora From D
"D:\Settings\OS\Windows\Programs\Installed\Typora\Typora\Typora.exe"
```

---

## **`Legacy`** - Syncing Firefox to USB via `robocopy`

> **Note:** *I need to rewrite these scripts to `unison` because `robocopy` sucks & writing directory watchers is too much of a pain in the ass on a gimped windows system.*

### Backup The Firefox profile on the USB stick to the Dropbox Folder

```powershell
robocopy D:\Dropbox\Platforms\Browsers\Firefox\Brenton C:\Users\sfplinternet\Dropbox\Platforms\Browsers\Firefox\Brenton /MIR /FFT /Z /XA:H /W:5
```

### Copy Dropbox folder back to the USB stick
```powershell
robocopy C:\Users\sfplinternet\Dropbox D:\Dropbox /MIR /FFT /Z /XA:H /W:5
```

### Both as a single command
```powershell
robocopy D:\Dropbox\Platforms\Browsers\Firefox\Brenton C:\Users\sfplinternet\Dropbox\Platforms\Browsers\Firefox\Brenton /MIR /FFT /Z /XA:H /W:5; robocopy C:\Users\sfplinternet\Dropbox D:\Dropbox /MIR /FFT /Z /XA:H /W:5
```

***

🤍 2023 **[8rent’s](https://allmylinks.com/8rents) [Ephemeral Computing](https://github.com/8rents/ephemeral-computing) Workflow **