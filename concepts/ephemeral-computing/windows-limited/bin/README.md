# Windows Limited Scripts

> *This folder contains scripts for syncing Windows Limited*

***

## Dropbox Sync Script

```powershell
#-------------------------------
# Ephemeral Computing
# SFPL Dropbox Sync Script
#-------------------------------
# For: 				Windows Limited	(Public)
# Modified: 		Wednesday, August 23, 2023 3:39:33 PM
# Version:			0.7.4
#-------------------------------
# Type:				Sync
# Using USB: 		No
# Settings Storage: Dropbox
# Files Storage: 	Google Drive
# Documentation: 	https://bit.ly/ephemeral-computing-wl-sync
#-------------------------------
# What this Script does
#-------------------------------
# 1. 	Intialize Variables
# 2. 	Windows Theme Preferences
# 3. 	Explorer Preferences
# 4. 	Open Windows & Sites
# 5. 	Installs Chocolatey
# 6. 	Choco App Installs
# 7. 	Copy Data Directories for 1st Run
# 8. 	Edit $PATH	
# 9. 	Finalize & Confirmation Message 
# 10. 	Refresh Powershell Environment
# 11. 	Watch Folders for changes
#-------------------------------
#________________________________________________________________

#-------------------------------
# Important Paths
#-------------------------------

# git config, home:	C:\Users\sfplinternet\
# Dropbox:		C:\Users\sfplinternet\Dropbox\
# Windows OS Dir:	C:\Users\sfplinternet\Dropbox\Repository\OS\Windows
# Shell Home Directory: C:\Users\sfplinternet\Dropbox\Repository\Devices\Computers\Windows 10 Public Library\
# Local Data: 		C:\Users\sfplinternet\AppData\Roaming\
# vscode, rsync: 	C:\tools\
# choco installs:	C:\ProgramData\chocoportable\lib\

#-------------------------------
#________________________________________________________________


#--------------------------------
# INSTRUCTIONS:
#-------------------------------

# 1. Sign into Google in Chrome
# 2. Log into Dropbox with Google
# 3. Log into Github
# 4. Open Cmnder Terminal as {PowerShell::PowerShell}
# 5. Run .\dropbox-sync.ps1 from the shell home directory (C:\Users\sfplinternet\Dropbox\Repository\Devices\Computers\Windows 10 Public Library\)

#--------------------------------
#________________________________________________________________


#--------------------------------
# 1. Intialize Variables	
#--------------------------------

$path = "";
$src = "";
$dest = "";

#--------------------------------
#________________________________________________________________

#--------------------------------
# 2. Windows Theme Preferences
#--------------------------------
# - Use Dark Theme
#--------------------------------

$path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize";
Set-ItemProperty -Path $path -Name AppsUseLightTheme -Value 0;

# The following 2 only work in "light mode"
# Set-ItemProperty -Path $path -Name EnableTransparency -Value 1;
# Set-ItemProperty -Path $path -Name ColorPrevalence -Value 1;

#--------------------------------
#________________________________________________________________

 
#--------------------------------
# 3. Explorer Preferences
#--------------------------------	
# - Show Hidden Files
# - Show File Extensions
# - Show System Folders
# - Hide the status bar
# - Show all folders in the navigation pane
#--------------------------------
# ADDITIONAL THINGS TO TWEAK
# Hide Quick Access, Favorites, Saved Games
#--------------------------------

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

#--------------------------------
#________________________________________________________________


#--------------------------------	
# 4. Open Windows & Sites	
#--------------------------------
# Opening websites was only handy when using a USB
#--------------------------------

START https://dropbox.com/login
START https://github.com/login

#--------------------------------
#________________________________________________________________

#-------------------------------
# 5. Install Chocolatey		
#-------------------------------
# Log File: "C:\ProgramData\chocoportable\logs\chocolatey.log"
#-------------------------------

$InstallDir='C:\ProgramData\chocoportable'; 
$env:ChocolateyInstall="$InstallDir"; 
Set-ExecutionPolicy Bypass -Scope Process -Force; 
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));

#--------------------------------	
# 6. Choco Installs
#-------------------------------
# - vscode.portable - Code editor of choice
# - git.install - version control 
# - bitwarden - password manager
# - rsync - sync and archive files/ folders
# - unison - keep folders synced
# - adb - Android Debug Bridge
# - curl - downloading / pulling files/folders
# - wget - downloading / pulling files/folders
# - yt-dlg.portable - download youtube videos/audio
# - vim - backup code editor
# - glow - terminal markdown reader
# - github-desktop - git version control GUI
#--------------------------------

choco install vscode.portable git.install bitwarden rsync unison adb curl wget yt-dlg.portable vim glow github-desktop -y; 

#--------------------------------

# Removed Installs
# fzf hackfont 

#--------------------------------
#________________________________________________________________


#--------------------------------
# 7. Copy Data Directories for 1st Run
#--------------------------------

#--------------------------------				
# Typora data
#--------------------------------

# Dropbox (OS Settings)
cp -r "C:\Users\sfplinternet\Dropbox\Repository\OS\Windows\Settings\Apps\Installed\Typora\Data" "C:\Users\sfplinternet\AppData\Roaming\Typora"; 

#--------------------------------
# GitHub
#--------------------------------
# !depricated - Pull repos into ~\Downloads every use	
#--------------------------------

# Dropbox (OS Settings)
cp -r "C:\Users\sfplinternet\Dropbox\Repository\OS\Windows\Settings\Apps\Data\GitHub" "C:\Users\sfplinternet\AppData\Roaming\GitHub Desktop";

#--------------------------------
# Local Git data	
#--------------------------------
# !note - this should never need to change. Should changes occour, modify in Dropbox and Copy the changes to ~\
#--------------------------------

# From Dropbox (User Settings)
cp -r "C:\Users\sfplinternet\Dropbox\Repository\Users\8rents\Settings\CLI\git\config.toml" "C:\Users\sfplinternet\.gitconfig"; 
cp -r "C:\Users\sfplinternet\Dropbox\Repository\Users\8rents\Settings\CLI\git\global-ignore.toml" "C:\Users\sfplinternet\.gitignore_global";

#--------------------------------
# VSCode data
# Only copy for first run
#--------------------------------

# From Dropbox (OS Settings)
cp -r "C:\Users\sfplinternet\Dropbox\Repository\OS\Windows\Settings\Apps\Data\vscode" "C:\tools\vscode\data"

# From Dropbox (OS Settings)
# cp -r "C:\Users\sfplinternet\Dropbox\Settings\OS\Windows\App Data Folders\vscode" "C:\tools\vscode\data"

#--------------------------------
#________________________________________________________________


#--------------------------------	
# 8. Edit $PATH			
#--------------------------------

# note: skipping nvim for now

$nvim = 'C:\tools\neovim\nvim-win64\bin'; 
$vim = 'C:\tools\vim\vim90'; 
$env:PATH += ";$vim;$nvim";

#--------------------------------
#________________________________________________________________




#--------------------------------
# 9. Finalize & Confirmation Message 
#--------------------------------
# Confirm everything is ok
# (...even if everything is not ok. Anyway, How's your day so far?)
#--------------------------------

echo "`r`n`r`nLooks like all the installs went well! Have fun!`r`n"

#--------------------------------
#________________________________________________________________


#--------------------------------
# 10. Refresh Powershell Environment
#--------------------------------

Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1

#--------------------------------
#________________________________________________________________


#--------------------------------	
# 11. Monitor Folder Changes 
#--------------------------------

# a. copy changes made in app back to USB
# b. copy changes made to USB back to Dropbox
# Use native .net class	to monitor folders

# more info: https://www.manageengine.com/products/active-directory-audit/powershell/monitor-file-changes-in-windows-with-powershell.html

#--------------------------------

# VScode data
# $watcher = New-Object System.IO.FileSystemWatcher
# $watcher.IncludeSubdirectories = $true

#--------------------------------
`#________________________________________________________________
```







***



🤍**2023 [Brenton Holiday](https://allmylinks.com/8rents)**