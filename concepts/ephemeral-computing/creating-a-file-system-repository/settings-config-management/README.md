[Concepts](../../README.md) > [File System Repository](../README.md) > **Settings & Configuration Management**

——

#### Concepts of a: *Central file system repository*

# Settings & Configuration Management

> ***How I designed a central repository to hold all of my data and organize all users, operating systems and devices. This section outlines how Settings should be conceptualized, stored and deployed.***

------



## `Central File System Repository`  —- Table of Contents

- [Introduction to my central repository](../../README.md)
- [First File System Concepts](first-file-system-designs/README.md)
- **Settings & Configuration Management**

------

> **Please Note:** *In the examples and file locations, highlighted words are variable and will not always be the same. The highlighted words change depending on the name of the variable word.*
>
> For a **User Named Finn**:  ``~/Settings/`==Finn==`/Settings/`
>
> For a **User Named Fiona**: `~/Settings/`==Fiona==`/Settings/`

## The 3 types of Hierarchical Settings

All settings are broken down to a hierarchy of 3 types going from most to least general.

### User Settings

User Settings are **OS independent** settings and application files. These settings are designed to be **deployed to every device** that that user uses. 

#### Locations of a Users *User Settings* Files

| Platform     | Example Location on Platform        |
| ------------ | ----------------------------------- |
| Google Drive | ``~/Settings/`==Brent==`/Settings/` |
| Android      | `~/Settings/`==Brent==`/`           |
| MacOS        | `~/Settings/`==Brent==`/`:          |

#### Some example *user settings*:

- Browser data like *Firefox* Profiles or Extension settings.
- Public keys like PGP & SSH. 
- Apps used inside *Tmux* or *Vim* configs
  **(but not terminal apps like termux or iTerm2 settings)**

------

### OS (Operating System) Settings

OS settings are specific to one Operating System or apps specific to an Operating System or apps that may not be on all OSs. If an app is on 2 but not all OSs you use, then it is an OS settings.

#### Locations of *OS Settings* Files

| Platform     | Location on Platform               |
| ------------ | ---------------------------------- |
| Google Drive | `/Repo/OS/`==Android==`/Settings/` |
| Android      | `~/Settings/`==Android==`/`        |
| MacOS        | `~/Settings/`==MacOS==`/`          |

#### OS specific settings and application data that’s not platform agnostic. Settings like:

- Typora (Desktop on **Windows or Mac**, but no Mobile)
  Since this is on more than one OS,
  **This would have either:**
  - 2 install locations
  - 1 primary location with a symlink to the other

- Termux (**Android terminal**, not on MacOS)

------

### Device Settings

Device Settings are the most specific type of settings as they are specific to and used on only one device. 

#### Locations of *Device Settings* Files

| Platform     | Location on Platform                          |
| ------------ | --------------------------------------------- |
| Google Drive | `/Repo/Devices/`==M1-MacbookPro==`/Settings/` |
| Android      | `~/Settings/`==StratusC7==`/`                 |
| MacOS        | `~/Settings/`==M1-MacbookPro==`/`             |

------

## Settings Type *(by Example:)*

Below are some examples of different types of settings and their locations on different devices and in the central repository.

### Brent’s User Settings

User settings are the most general and for each user all of their user settings should be deployed to every device.

#### Locations of the Brent’s *User Settings* Files

| Platform     | Location on Platform          |
| ------------ | ----------------------------- |
| Google Drive | `/Repo/Users/Brent/Settings/` |
| Android      | `~/Settings/Brent/`           |
| MacOS        | `~/Settings/Brent/`           |

### MacOS Settings

System Files and folders related to any type Mac installation, from Public to Personal computers.

#### Locations of MacOS *Operating System Settings* Files

| Platform     | Location on Platform       |
| ------------ | -------------------------- |
| Google Drive | `/Repo/OS/MacOS/Settings/` |
| Android      | ***N/A***                  |
| MacOS        | ``~/Settings/MacOS/``      |

### Wiko Phone Android Device Settings

Files specific to the **Wiko phone Android device**. 

The device settings would be the most specific to the device itself, coming after the user, and Android OS settings.

#### Locations of Android Wiko Phone *Device Settings* Files

| Platform     | Location on Platform                |
| ------------ | ----------------------------------- |
| Google Drive | `/Repo/Devices/WikoPhone/Settings/` |
| Android      | `~/Settings/WikoPhone/`             |
| MacOS        | ***N/A***                           |



------

🤍 __2023__ __[Brenton Holiday](https://allmylinks.com/8rents)__
