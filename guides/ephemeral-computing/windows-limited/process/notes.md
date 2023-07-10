[Ephemeral Computing](../../README.md) > [Windows Limited](../README.md) > **Process Notes**

#### [`Process & Notes`](#) // `Ephemeral Computing` 

# <img src="https://raw.githubusercontent.com/8rents/_/i/sfpl-logo.png" alt="SFPL Logo" style="zoom:33%;" /> Windows Limited // *SF Public Library*

> #### *These are my notes and process during the Writing of “How to set up a Limited, public Windows computer” for the Ephemeral Computing Workflow*                                                                                                                                                                                                 

---

- **[⬆ ⬆ Other Operating Systems](../../README.md)**
- **[⬆ Windows Limited Workflow](../README.md)**

**`Process Documents`**  [**To Do List**](todo.md)

## Table of Contents

1. **Introduction**
2. [Start bat script development](start-bat-development.md)
3. [Automatically Syncing Installed Application Preferences

***

The following documents a number of scripts that make getting a predictable set up a lot easier.

## Chocolatey Install script

Run the following command in Powershell. 

```bash

# PowerShell Install Script via Chocolatey

Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0; $InstallDir='C:\ProgramData\chocoportable'; $env:ChocolateyInstall="$InstallDir"; Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')); choco install git rsync github-desktop adb curl wget  -y
```

### Problems with this approach

This is a great step however a number of things need improving

- This fails to install vscode
- rsync is some crappy imitation and robocopy sucks
- I need a better terminal 

### Other options 

- Run vscode in web mode 
- use cmdr as my terminal

***

## Keeping Dropbox synced with a USB stick

- **USB Location:** `D:\Settings\`
- **Dropbox Location:** `C:\Users\sfplinternet\Dropbox\Settings\`
- **FF profile location in the `Settings` folder:** `\User\Browser\Firefox\Brenton\` 

**Perform these steps once done with work for the day. This way Firefox will have a chance to delete cache folders and tidy itself up.**

For any items that are being worked on directly on the USB stick, they will need to be copied over to Dropbox after being modified. 

After which, the whole Dropbox directly can be copied back to the USB Stick. 

### Copy the Brenton Firefox profile on the USB stick to the Dropbox Folder (as well as any other files that have been worked on. 

Since the profile is loaded into Firefox from the USB stick, this means the most recent modified copy is on the USB. It will need to be copied to the Dropbox folder so that Dropbox has the most recent version too. 

### Copy the whole Settings folder back to the USB stick

Once any files that were being worked on directly on the USB Stick have been copied to Dropbox, it's time to copy the whole Dropbox folder back to the USB. 

```bash
robocopy C:\Users\sfplinternet\Dropbox\Settings D:\Settings /MIR /FFT /Z /XA:H /W:5
```

### Does both the above (two way copy) in a single command

**Again: Run this once when finished working for the day.**

```bash
robocopy D:\Settings\User\Browsers\Firefox\Brenton C:\Users\sfplinternet\Dropbox\Settings\User\Browsers\Firefox\Brenton /MIR /FFT /Z /XA:H /W:5; robocopy C:\Users\sfplinternet\Dropbox D:\Dropbox /MIR /FFT /Z /XA:H /W:5
```

***

## ToDo List

- [x] Get it working in `cmdr`
- [x] Make a BAT file to automate the whole thing
- [ ] Switch `robocopy` to something better like `unison` or `rsync`

***

__W/🤍__ in __2023__ by __[Brenton Holiday](https://allmylinks.com/8rents)__ as part of the [Ephemeral Computing](https://github.com/8rents/ephemeral-computing) workflow.