[Ephemeral Computing](../../../README.md) > [Windows Limited](../../README.md) > [Process](README.md) > **Installed Application Automated Setup**

# <img src="https://raw.githubusercontent.com/8rents/_/i/sfpl-logo.png" alt="SFPL Logo" style="zoom:33%;" /> **`Ephemeral Computing`** Windows Limited `Process Documents` for Installed Application Automated Setup

> #### *How to script my preferences on a Public machine*

---

- **[⬆ ⬆ Other Operating Systems](../../README.md)**
  - **[⬆ Windows Limited Workflow](../README.md)**


****

**`Process Documents`**  [**To Do List**](todo.md)

## Process Documents Table of Contents

1. [Introduction](README.md)
2. [Start bat script development](start-bat-development.md)
3. **Installed Application Automatic Set up**

---

## Syncing the Application Data

Windows applications generally store user data and preference in one of the three folders in `~/AppData/`. 

After installing and running an application for the first time we can comb through the `AppData` folder or do a search to find which folder is storing the preferences.

### 1^st^ Case: Typora

> **Reference:** [*First Notes on Typora Process Document*](typora-automatic-setup.md)

We can make a copy of the folder in App Data. In the case of Typora, the folder is:

```Powershell
C:\Users\sfplinternet\AppData\Roaming\Typora
```

I’ll copy and rename that folder onto my USB stick and or Dropbox to this location:

```powershell
D:\Settings\OS\Windows\Programs\Installed\Typora\Data
```

Then before downloading or running the app, I’ll copy the data folder back into the `C:\` drive location.

```Powershell
# Copy the data Folder to AppData
cp -r "D:\Settings\OS\Windows\Programs\Installed\Typora\Data" "C:\Users\sfplinternet\AppData\Roaming\Typora"

# Run Typora from the USB Stick
"D:\Settings\OS\Windows\Programs\Installed\Typora\Typora\Typora.exe"
```

Great! It appears that our preferences are syncing on each run.

### 2^nd^ Case: GitHub Desktop

In the case of GitHub Desktop the preferences are stored in:

```powershell
"C:\Users\sfplinternet\AppData\Roaming\GitHub Desktop"
```

I’ll copy this folder over to my USB and then later Dropbox to this location.

```Powershell
D:\Settings\OS\Windows\Programs\Installed\GitHub\Data
```

We could mimic the first script we used for Typora but what if we make changes to preferences while using the app? The next time we run the app we will only have the older prefs stored on the USB and the new ones won’t be recorded. We need a way of copying them back to the USB when changes are made.

---

## Unison: Bi Directional Copying

`Unison` is a command line utility similar to `rsync` but that specializes in keeping 2 directories in sync with each other. However, it’s more geared towards **bi-directional syncing** than `rsync` is.

There are 2 components to `unison`. The actual unison script that performs the copy and a script that watches folders for changes called `folder-watcher`.



---

__W/🤍__ in __2023__ by __[Brenton Holiday](https://allmylinks.com/8rents)__ as part of the [Ephemeral Computing](https://github.com/8rents/ephemeral-computing) workflow.