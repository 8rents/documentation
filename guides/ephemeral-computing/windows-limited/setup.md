[Ephemeral Computing](../../README.md) > [Windows Limited](../README.md) > **One Time Set Up**

# ==Set up for Windows Limited== *Ephemeral Computing Workflow*

> #### *This guide is for working with Windows 10 without admin privileges and locked down in all sorts of arbitrary ways. This is the guide that I will be using most of the time while working at the San Francisco Public Library.*

------

If you just landed here, this article is number 2 of a 3 part series. The previous article, [Windows Limited Introduction / Q&A](README.md) was part 1.

This guide will cover the one time set up for windows limited work stations both with a USB Stick and without. Rest assured, the USB stick is really just a slight time saver, especially on slow connections.  

I’ll cover the set up without a USB stick first and then how to include one in your workflow.

## Setting up a File System

I’ll be using two primary cloud file systems, [Google Drive](https://drive.google.com) and [Dropbox](https://dropbox.c).

Google Drive with it’s generous 15gb free plan will hold all of my files, and Dropbox with working client (on limited machines) but 1gb free limit will hold all of my settings.

### Setting up a central file repository for many platforms and devices

Ideally I want to have one copy of each file that I will be able to work on on many different devices and platforms. The same with the OS agnostic settings. Unfortunately file systems on different devices are set up very differently. I need to create one place where all my files live, but can be accessed many different ways.

#### Basic Divisions in my File system

One convention I’ve decided to use, is to divide files that I’ve created from files in my media library. 

- `B` - Files that I’ve created
- `Media` - Files I didn’t create that Live in my media library.

This way I won’t have a music folder that has my Library in it as well as project files that I’m actively working on.

I’ve also created folders that will consist only of symbolic links that will aggregate files from these folders. One such folder will be my clients folder.

The clients folder will be sorted by client name and inside will have all the different items that were created for the client be it music, video, apps or websites. 

------

### Up Next:

- > [**Syncing Windows Limited** *(Each Work Session) >* ](sync.md)

---

🤍2023 **[Brenton Holiday](https://allmylinks.com/8rents)**

