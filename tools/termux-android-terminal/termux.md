# Termux

> *How to configure Termux terminal emulator on Android*

***

Termux is the defacto terminal emulator on android. This guide will cover set up and configuration in normal mode. Rooted mode will be covered in a separate article. 

## Getting started

When installing Termux, just make sure that you **do not install Termux through the Google Play Store**. The Play Store version doesn't receive updates. Use the F-Droid repository. F-Droid is a repository of all FOSS (Free and Open Source Software) and is awesome, but the default F-Droid client kind of sucks. Since this is the case, you'll want an... 

## Alternate F-Droid Client 

I recommend either, *Foxy Droid* or *Material Droid*. If you do a Google Search for them, you can directly download an APK without having to install the default F-Droid client. 


## Download and Installation 

Once you have installed either Foxy Droid or Material Droid, do a search for "Termux", then download and install it though your client of choice. 

## Styling Termux 

After Termux is installed, go back to your F-Droid client and search "Termux Styling". Then download and install that. 

Next, open the termux app. Long press anywhere on the screen until the menu comes up. Then select styles. Choose the font and color combo you like. 

Mine is "Hack font" & "Solarized Dark" for coloring. 

## Termux package manager - `pkg`

Since Termux is using a Debian flavor of Linux the default package manager is `apt`. The makers of Termux created `pkg` to serve as a front end for apt. This ensures a higher level of compatibility than just using `apt` alone. 

### Installing packages

Before you can install your first package, you want to pull the most recent repository update so you can get the most upto date versions of the software you're requesting. 

### Updating Repository & Packages

```bash
pkg update -y
```

This Command pulls the most recent list of software hosted in the repository. 

> The `-y` at the end of the command means to say "yes" to everything. Basically just STFU and do the damn update. 

The cool thing about `pkg update` is that it's roughly equivalent to:

```bash
apt update && apt full-upgrade -y
```

Meaning that it upgrades the software in addition to updating the repo list. 


> **Note:** *The command `full-upgrade` means upgrade the entire installation.*

## Installing some essential packages

Some of my essential packages are:

- **git** -  version control
- **zsh** -  my shell of choice
- **bash** - the default shell and shell used for running scripts. 
- **rsync** - keeping files and Directories in sync
- **tmux** -  terminal multiplexer. The next best thing to iTerm 2. 

Installing this whole list in one command looks like this:

```bash
pkg install git zsh bash rsync tmux -y
```

## Using Zsh

ZSH is my current shell of choice. A shell is the interpreter that you type commands into in a terminal. 

ZSH is a bit more modern and extensible than bash. There's a wonderful framework called *oh my zsh* that adds a lot to the shell. 

### Installing Oh my zsh

From their website (https://ohmyzsh.sh/)

```bash
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```


***

**🤍 2023 [Brenton Holiday](https://allmylinks.com/8rents)** 
