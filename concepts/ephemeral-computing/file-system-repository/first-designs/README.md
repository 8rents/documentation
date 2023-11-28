[Concepts](../../README.md) > [File System Repository](../README.md) > **First File System Designs**

------

#### Concepts of a: *Central file system repository*

# First File System Designs

> *How I designed a central repository to hold all of my data and organize all users, operating systems and devices.*

------

## `Central File System Repository`  —- Table of Contents

- [Introduction to my central repository](../../README.md)
- **First File System Concepts**
- [Settings & Configuration Management](settings-config-management/README.md)

------

Google Drive Repository Server

A Cloud repository that holds all of my files and data and deploys to different OS’s and device’s.



------



# Directory Structure

The following is the overall directory structure for the two main pieces, the Server and the Client.

### Graph Key

| Key              | Meaning                                                      |
| ---------------- | ------------------------------------------------------------ |
| `[Folder/]`      | This is the literal name of the folder                       |
| `['FolderName']` | This folder has a variable name. For ‘OSname’, it could be ‘Android’ or ‘Windows’. |
| `# Comment`      | This is a comment about the item to the left or above.       |

------

## Server

The server will begin on Google Drive and eventually be migrated to a VPS.

> **Note:** *The directories for settings are left blank, I’ve put extensive work into settings organization and structuring. Please see the documentaton section on [Settings Management](#)*

```nginx
[/]
# Root of the server, or containing folder
├───[Repo/]
│ # Holds all of the literal files. 
│ # No symlinks are in this folder.
│	│
│	├───[User/]
│	│ # Holds all of the user files
│	│ # These are deployed to every device
│	│	└───['UserName/'] # (Brent)
│	│	  # Holds all of the user files
│	│	  # These are deployed to every device
│	│		├───[Files/]
│	│		│ # All of the Files
│	│		│	├───[My/]
│	│		│	│ # Files created by me for me
│	│		│	├───[Clients/] # (work/project/client)
│	│		│	│ # Files created by me for other people. 
│	│		│	│ # Organized by client name.
│	│		│	│	└───['ClientName/']
│	│		│	│	  # Files created by me 
│	│		│	│	  #	for the specific client.
│	│		│	└───[Library/]
│	│		│	  # Files NOT created by me
│	│		└───[Settings/]
│	│		  # User Settings. Deployed to all devices
│	│		  'See: Settings Management documentation'
│	├───[OS/]
│	│ # Operating System specific files. Sorted by OS
│	│	└───['OSname/'] # (Android)
│	│	  # A folder for each Operating System
│	│		├───[Software/]
│	│		│ # Repository of Software for a specific OS
│	│		└───[Settings/] 
│	│		  # OS Specific Settings
│	└───[Devices/]
│	  # Device specific files
│		└───['DeviceName/'] # (Samsung A12)
│		  # A folder for each deployed device
│			├───[Backups/]
│			│ # Backups for selected device
│			└───[Settings/]
│			  # Device specific settings for selected device
└───[Devices/]
  # List of devices. 
	└───['DeviceName/'] 
	  # A folder for each deployed device. 
	  # This folder will consist of symlinks to directories 
	  # and files that will be deployed to the client device.
		└───[~/]
  	      # Symlinks to User Files and directories. 
          # Could be a few files or the whole User tree
	        ├───[User/]
	        │ # Symlinks to /Repo/Users/UserName/Settings/
	        ├───['OSname/']
	        │ # Symlinks to /Repo/OS/OSname/Settings/
	        └───['DeviceName/']
	          # Symlinks to /Repo/Device/DeviceName/Settings/
	        	└───[Backups/]
	        	  # Backups will be taken and stored
	        	  # on device until they are synced
	        	  # Once synced they will be deleted 
	        	  # from the device.
```

## Client (Device)

The Client is a device that has been deployed to. It could be a laptop or a phone or anything. Each device should have a hash ID

These will be synced from the /Repo/Devices/DeviceName Folder.

```nginx
[~/] # (Files, User FS Root)
├───[B/]
│ # Files created by me. 
│ # Could be a few files or the whole User tree
│	└───[Settings/]
│     # Symlinks to /Repo/User/UserName/Settings/
├───[Media/]                                           
│ # Files NOT created by me
└───[Settings/]
  # Symlinks to /Repo/OS/OSname/Settings/
	├───AppList.txt
	│ # A list of installed software
	│ # No need to backup actual apps
	└───[DeviceName/]
	  # Symlinks to /Repo/Device/DeviceName/Settings/
		└───[Backups/]
          # Backups will be taken 
          # and stored on device until 
          # they are synced
          # Once synced they sync
          # will be deleted from the device.
```





------



❤ 2023 [Brenton Holiday](https://allmylinks.com/8rents)

------

🤍 __2023__ __[Brenton Holiday](https://allmylinks.com/8rents)__

