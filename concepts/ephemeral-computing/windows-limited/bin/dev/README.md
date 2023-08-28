

# SFPL Dropbox and / or USB Sync Script Documentation

> *As part of the Ephemeral Computing Workflow*

---

## Important Paths

- **USB:** `D:\`C:\Users\sfplinternet\Dropbox\Repository\
- **Shell Home Directory:** `D:\Repository\Devices\Computers\Windows 10 Public Library\`
- **git config, home:** `C:\Users\sfplinternet\`
- **Local Data:** `C:\Users\sfplinternet\AppData\Roaming\`
- **Dropbox:** `C:\Users\sfplinternet\Dropbox\`
- **vscode, rsync:** `C:\tools\`
- **choco installs:** `C:\ProgramData\chocoportable\lib\`

---

## Instructions

1. Sign into Google in Chrome
2. [Log into Dropbox](https://dropbox.com/login) with Google
3. [Log into GitHub](https://github.com/login)
4. Open Cmder Terminal as `{PowerShell::PowerShell}`
5. Run the appropriate script from within the `bin` folder
   - If using a USB Stick run `.\usb-sync.ps1`
   - If not using a USB Stick run `.\dropbox-sync.ps1`


---

## Sections of the Script

1. Initialize Variables
2. Windows Theme Preferences
3. Explorer Preferences
4. Open Windows & Sites
5. Choco Installs
6. Copy Data Directories for 1st Run
7. Edit `$PATH`	
8. Finalize & Confirmation Message
9. Refresh PowerShell Environment
10. Monitor Folder Changes

## Script by Section

### 1.  Initialize Variables

Simply creates placeholders for variables that will be used throughout the script.

```powershell
$path = "";
$src = "";
$dest = "";
```

### 2. Windows Theme Preferences

Mainly just telling windows to use Dark theme. The bottom 3 lines are commented out and don't get used.

```powershell
$path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize";
Set-ItemProperty -Path $path -Name AppsUseLightTheme -Value 0;

# The following 2 only work in "light mode"
# Set-ItemProperty -Path $path -Name EnableTransparency -Value 1;
# Set-ItemProperty -Path $path -Name ColorPrevalence -Value 1;
```

### 3. Explorer Preferences

In Windows Explorer the following changes are made:

1. Shows Hidden Files
2. Show file extensions
3. Show all folders
4. Show all folders in Nav Pane
5. Hide the Ribbon

Hiding the Navigation Pane and Hiding borders is commented out and not working in the script.

#### ADDITIONAL THINGS TO TWEAK

- Hide Quick Access
- Favorites
- Saved Games

```powershell
$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced";
Set-ItemProperty -Path $path -Name Hidden -Value 1;
Set-ItemProperty -Path $path -Name HideFileExt -Value 0;
Set-ItemProperty -Path $path -Name ShowSuperHidden -Value 1;
Set-ItemProperty -Path $path -Name ShowStatusBar -Value 0;
Set-ItemProperty -Path $path -Name NavPaneShowAllFolders -Value 1;

# Hide the Ribbon
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Ribbon" -Name MinimizedStateTabletModeOff -Value 1;

# Hide navigation Pane - NOT YET WORKING
# Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\NavPane" -Name ExpandedState -Value 0;

# 0 Border width - NOT SURE,DOESN'T WORK
# Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name BorderWidth -Value 0;

```

### 4. Open Windows & Sites	

Opening websites was only handy when using a USB

```powershell
START https://dropbox.com/login
START https://github.com/login
```

### 5. Choco Installs

```powershell
choco install vscode.portable git.install bitwarden rsync unison adb curl wget yt-dlg.portable vim glow github-desktop -y; 
```

#### Removed Applications

- fzf
- hackfont 

### 6. Copy Data Directories for 1st Run

#### Typora data

```powershell
cp -r "C:\Users\sfplinternet\Dropbox\Repository\OS\Windows\Apps\Typora\Data" "C:\Users\sfplinternet\AppData\Roaming\Typora"; 
```

#### GitHub

**!depricated** - Pull repos into ~\Downloads every use

#### Local Git Config

> *!note - this should never need to change. Should changes occour, modify in Dropbox and Copy the changes to ~\*

```powershell
cp -r "C:\Users\sfplinternet\Dropbox\Repository\Users\8rents\CLI\git\config.toml" "C:\Users\sfplinternet\.gitconfig"; 
cp -r "C:\Users\sfplinternet\Dropbox\Settings\Users\8rents\CLI\git\global-ignore.toml" "C:\Users\sfplinternet\.gitignore_global";

```

#### VSCode

*Only copy for first run*

```bash
cp -r "C:\Users\sfplinternet\Dropbox\Repository\OS\Windows\App Data Folders\vscode" "C:\tools\vscode\data"
```

### Edit `$PATH`

> **note:** *skipping nvim for now*

```bash
$nvim = 'C:\tools\neovim\nvim-win64\bin'; 
$vim = 'C:\tools\vim\vim90'; 
$env:PATH += ";$vim;$nvim";
```

### 8. Finalize & Confirmation Message

**Confirm everything is ok**

*...even if everything is not ok. Anyway, How's your day so far?*

```powershell
echo "`r`n`r`nLooks like all the installs went well! Have fun!`r`n"
```

### 9. Refresh Powershell Environment

```powershell
Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
```

### 10. Monitor Folder Changes 

*Still a Work in Progress... here's what I have so far...*

- a. copy changes made in app back to USB
- b. copy changes made to USB back to Dropbox

Use native .net class to monitor folders

> **more info:** 
> https://www.manageengine.com/products/active-directory-audit/powershell/monitor-file-changes-in-windows-with-powershell.html 

```powershell
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.IncludeSubdirectories = $true
```

---

**🤍 2023 [Brenton Holiday](https://allmylinks.com/8rents)**