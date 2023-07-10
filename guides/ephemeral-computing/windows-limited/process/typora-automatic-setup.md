# ==*Copy this doc to [Installed app prefs](installed-app-pref-sync.md)*==

[Ephemeral Computing](../../../README.md) > [Windows Limited](../../README.md) > [Process](README.md)

# Installed application automatic Setup

> #### *How to script my preferences on a Public machine*

---

- **[⬆ ⬆ Other Operating Systems](../../README.md)**

- **[⬆ Windows Limited Workflow](../README.md)**

**`Process Documents`**  [**To Do List**](todo.md)

## Table of Contents

1. [Introduction](README.md)
2. [Start bat script development](start-bat-development.md)
3. **Installed Application Automatic Set up**

---

The goal is to run a script and have all of my installed applications preferences automatically put into place.

I have 2 options as far as setting up these up automatically. 

It appears most Windows applications when installed store their preferences and application data in one of the three folders in  `~\AppData\`. 

## Option 1 — *Linking the `AppData` directory*

> *Try  to find a way to link (hard or symlink) the installed data directory back to a preconfigured directory on the USB. This would probably be the ideal approach.*

This approach is not going to work as a symlink require elevated privileges on Windows 10. 


## Option 2 — Storing AppData files on a USB or in the cloud & *Moving them with a script*

> *Have a directory on the USB and/or in Dropbox with modified configuration files and then to move each of the files to the correct location.*

This will be the first approach I try.

### Terms

- `Active` - Means that the preferences will be copied the next run
- `Inactive` - The preference will not be copied. It's just in storage.
- `Installed` - The preference will affect the current running instance.
- `Data Folder` - Usually stored in `~\AppData` Holds preferences and user data.

---

## Typora

Typora will be the first application I test this out with.

### Important Typora Folders

The following is a list of folders that hold preferences.

#### Data (Active)

This is a a copy of `C:\Users\sfplinternet\AppData\Roaming\Typora` that is stored on my USB and in Dropbox. `Typora` was renamed to `Data` for storage.

```
D:\Settings\OS\Windows\Programs\Installed\Typora\Data
```
#### Data (Installed) 

This is the currently running preferences folder. 

```
C:\Users\sfplinternet\AppData\Roaming\Typora
```
#### Themes (Inactive/Storage)

This is a folder on my USB / Dropbox that holds themes I’ve downloaded but aren’t installed into the application.

```powershell
D:\Settings\OS\Windows\Programs\Installed\Typora\Themes
```
#### Themes Active

This folder on my USB/Dropbox is holds themes that have been loaded into the app and will be available next run.

```powershell
D:\Settings\OS\Windows\Programs\Installed\Typora\Data\themes
```
#### Themes (Installed)

This is the location of the installed themes folder currently running in the app.

```powershell
C:\Users\sfplinternet\AppData\Roaming\Typora\themes
```
#### Location of Typora exe on D

This is the location of the executable that is stored on my USB / Dropbox.

```powershell
D:\Settings\OS\Windows\Programs\Installed\Typora\Typora\Typora.exe
```

### Copy the entire data directory and then start Typora

Before running Typora for the first time, We will make a script to copy the entire `data` directory over to `~\AppData`. The `data` folder will be renamed to `Typroa` 

```powershell
# Copy the data Folder to AppData
cp -r "D:\Settings\OS\Windows\Programs\Installed\Typora\Data" "C:\Users\sfplinternet\AppData\Roaming\Typora"

# Run Typora from the USB Stick
"D:\Settings\OS\Windows\Programs\Installed\Typora\Typora\Typora.exe"
```

---

## Finding changed files in the AppData Directory

The goal with this step is to see exactly which files have been changed since a fresh install. 

### Three Data Folder Variations

- **`Fresh`** - The data directory that's created on install.
- **`Prefs`** - The data directory after preferences have been adjusted.
- **`Merged`** - A copy of the original `Typora` (`fresh`) directory that we will merge files from `prefs` into. With this we can see which files have been changed from the install and which ones are the same.

Using `rsync` or `unison` we can preform the merge and get a log of changed files.

#### *More on this later…*

---

__W/🤍__ in __2023__ by __[Brenton Holiday](https://allmylinks.com/8rents)__ as part of the [Ephemeral Computing](https://github.com/8rents/ephemeral-computing) workflow.