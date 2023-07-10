[Ephemeral Computing](../../README.md) > [Windows Limited](../README.md) > **Sync**

# <img src="https://raw.githubusercontent.com/8rents/_/i/windows10-logoform.png" alt="Windows 11 Logo" style="zoom:50%;" />  Sync Ephemeral Computing

## for `Windows 10  Limited`

> #### *This guide is for working with Windows 10 without admin privileges and locked down in all sorts of arbitrary ways. This is the guide that I will be using most of the time while working at the San Francisco Public Library.*

---

## Table of Contents

1. [Introduction / Q&A](README.md)
2. [Setting up Windows 10 (Once)](setup.md)
3. **Syncing Windows 10 (Each Work Session)**

***

## Syncing each Session

This guide will be repeated each time you sign into a limited Windows machine. 

### Syncing with a USB Drive

Having a USB Drive makes things a little bit faster since you won’t need to wait for Dropbox to download all of your settings files.

### Making a Shortcuts folder (aka Desktop)

After signing in, First open up your USB stick at `D:\\`. I keep shortcuts and links to files that I’m actively working on in my `D://Desktop` folder. Inside the `Desktop` folder I have a symlink to `Windows 10 Public Library`, which points to `D:\Settings\Devices\Windows 10 Public Library`.

#### File list for `Windows 10 Public Library` Shortcut folder

`/d/Settings/Devices/Windows 10 Public Library`

```powershell
# Shortcut to cmder installed on USB
'[app] Cmder.lnk'*

# Shortcut to Typora installed on USB
'[app] Typora.lnk'*

# Shortcut to GitHub installed on USB
'[app] GitHubDesktop.exe'*

# Programs Installed on Library Computers
'[app] Library Computer Programs'/

# Programs Installed on my usb
'[USB] Installed Apps.lnk'*

# Shortcut to this repo
'[Docs] Ephemeral Computing.lnk'*

# My Firefox Profile
'[Firefox] Brenton Profile.lnk'*

# My CMDER bash profile
'bashrc.lnk'*

# The whole start script as of now in a txt file
'start (current txt).txt'                  

# Final BAT File I'm developing
'start.bat'

# A quick test BAT File
'test.bat' 

# A todo list to keep track of things I need to do
'todo.md'
```



---

🤍2023 **[Brenton Holiday](https://allmylinks.com/8rents)**