																																																				<# 
.SYNOPSIS
    	Library Start Script -- v0.6.2 @ 12:48 AM 7/17/2023

.DESCRIPTION 
    	PowerShell Start Scripts to syncronize SF Library Windows 10 Computers to a Development platform i can use
	
.NOTES 
    	Run in Cmnder (C:\Users\sfplinternet\Dropbox\Settings\OS\Windows\Apps\Cmder) as {PowerShell::PowerShell}

.LINK 
    	https://github.com/8rents/documentation/tree/main/guides/ephemeral-computing/windows-limited

.CHANGELOG	
	Modified to run on C instead of D on a USB

;
# Intialize Variables;
$path = "";
$src = "";
$dest = "";
;
<#
.SYNOPSIS
	Windows Theme Preferences
.DESCRIPTION
	1. Turn on Dark Mode
	2. Enable Transparency
.COMPONENT -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize
.Parameter -Name AppsUseLightTheme -Value 0
	Turns on Dark Theme
.Parameter -Name EnableTransparency -Value 1
	Enables Window Transparency
#>
;
# Theme Preferences;
$path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize";
Set-ItemProperty -Path $path -Name AppsUseLightTheme -Value 0;
Set-ItemProperty -Path $path -Name EnableTransparency -Value 1;
;
;
<#
.SYNOPSIS
	Windows Explorer Preferences
.DESCRIPTION
	Show Hidden Files
	Show File Extensions
	ShowStatusBar
	Show All Folders
	Minimize the Ribbon
	ShowInfoTip
	
.COMPONENT -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
.Parameter -Name Hidden -Value 1
.Parameter -Name HideFileExt -Value 0
.Parameter -Name ShowSuperHidden -Value 1
;
#>
;
# Explorer Preferences;
$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced";
Set-ItemProperty -Path $path -Name Hidden -Value 1;
Set-ItemProperty -Path $path -Name HideFileExt -Value 0;
Set-ItemProperty -Path $path -Name ShowSuperHidden -Value 1;
;
;
<# 
.SYNOPSIS
	Install Chocolatey and default packages
.DESCRIPTION
	Downloads Choco package manager and downloads the following applications:

.COMPONENT
	- choco
	- rsync 
	- unison 
	- adb 
	- curl 
	- wget 
	- bitwarden
	- yt-dlg.portable 
	- vscode.portable 
	- vim 
	- fzf 
	- hackfont
.Parameter {ParameterName}

#>
$InstallDir='C:\ProgramData\chocoportable'; 
$env:ChocolateyInstall="$InstallDir"; 
Set-ExecutionPolicy Bypass -Scope Process -Force; 
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')); 
choco install rsync unison adb curl wget bitwarden yt-dlg.portable vscode.portable vim fzf hackfont -y; 
;
;
<# 
.SYNOPSIS
	Copy App Data
#>
;
# Typora Settings
cp -r "C:\Users\sfplinternet\Dropbox\Settings\OS\Windows\Apps\Typora\Data" "C:\Users\sfplinternet\AppData\Roaming\Typora"; 
# GitHub
cp -r "C:\Users\sfplinternet\Dropbox\Settings\OS\Windows\Apps\GitHub\Data" "C:\Users\sfplinternet\AppData\Roaming\GitHub Desktop"; 
# Local Git Settings
cp -r "C:\Users\sfplinternet\Dropbox\Settings\Users\Brent\CLI\git\config.toml" "C:\Users\sfplinternet\.gitconfig"; 
;
<#
.SYNOPSIS
	Edit PATH
#>
;
$nvim = 'C:\tools\neovim\nvim-win64\bin'; 
$vim = 'C:\tools\vim\vim90'; 
$env:PATH += ";$vim;$nvim";
;
<#
.SYNOPSIS
	Open Windows and Websites
#>
START https://dropbox.com/login
START https://github.com/login
;
<# 
.SYNOPSIS
	Confirmation Message 
#>
;
echo "`r`n`r`nLooks like all the installs went well! Have fun!`r`n"
;
