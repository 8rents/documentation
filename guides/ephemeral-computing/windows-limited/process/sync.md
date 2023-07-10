[Ephemeral Computing](../../../README.md) > [Windows Limited](../../README.md) > [Process](README.md) > **Sync Notes**

# <img src="https://raw.githubusercontent.com/8rents/_/i/sfpl-logo.png" alt="SFPL Logo" style="zoom:33%;" /> Sync for Windows Gimped, Ephemeral Computing Workflow

> ####  *This is the process of syncing a gimped windows computer for development. Follow this guide each time you log in*

---

**[⬆ Other Operating Systems](../README.md)**

## Windows Gimped Table of Contents

1. [Introduction](README.md)
2. [Set up](setup.md)
3. **Sync**

---

## If you have a USB stick

1. ### Open Firefox Profile

   1. Open Firefox and set as default browser
   2. Search update in settings and restart when ready
   3. open user profile by going to <about:profiles> or `win` and type `firefox.exe -p`

2. ### Run the PowerShell script

   The script has to be copy pasted into PowerShell.

   ```powershell
   Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0; $InstallDir='C:\ProgramData\chocoportable'; $env:ChocolateyInstall="$InstallDir"; Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')); choco install rsync unison github-desktop adb curl wget bitwarden yt-dlg.portable vim fzf hackfont -y; $nvim = 'C:\tools\neovim\nvim-win64\bin'; $vim = 'C:\tools\vim\vim90'; $env:PATH += ";$vim;$nvim"; echo "`r`nvim & nvim have been added to PATH and are ready to use!" cd 'D:\'; cp -r "D:\Settings\OS\Windows\Programs\Installed\Typora\Data" "C:\Users\sfplinternet\AppData\Roaming\Typora"; "D:\Settings\OS\Windows\Programs\Installed\Typora\Typora\Typora.exe"; echo "`r`n`r`nLooks like all the installs went well! Have fun!`r`n"
   ```


---

## If you don’t have a USB

### *More on this Later…*

🤍 2023 **[8rent’s](https://allmylinks.com/8rents) [Ephemeral Computing](https://github.com/8rents/ephemeral-computing) Workflow **