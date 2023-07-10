[Documentation](../) > [Tools](./) > **CMDR**

![tmux](https://raw.githubusercontent.com/8rents/_/i/cmder.png)

# Using CMDER

> ***Lovely, portable console emulator package for Windows***

Cmder is a very portable terminal emulator that can be installed easily on a USB flash or drive and/or Dropbox and stores all your terminal settings. No more having to run a massive powershell script each time I sign onto a public machine :)



## Download cmdr

- [Github](https://github.com/cmderdev/cmder/releases/download/v1.3.19/C)
- ~~[Website](https://cmder.net/)~~ [Down]

## Installation

https://github.com/cmderdev/cmder/releases/download/v1.3.21/cmder.zip

## Basic Usage

### Tab manipulation

- `Ctrl + \`` : **Global Summon from taskbar**
- `Win + Alt + p` : **Preferences (Or right click on title bar)**
- `Ctrl + t` : **New tab dialog (maybe you want to open cmd as admin?)**
- `Ctrl + w` : **Close tab**
- `shift + alt + number` : **fast new tab**
  1.  CMD
  2.  PowerShell
- `Alt + Enter` : **Full screen**

### Shell

- `Ctrl + Alt + u` : **Traverse up in directory structure (lovely feature!)**
- **`End**, Home, Ctrl` : **Traverse text as usual on Windows**
- `Ctrl + r` : **History search**
- `Shift + mouse` : **Select and copy text from buffer**
- `Right click / Ctrl + Shift + v` : **Paste text**

### Notes

#### Copy output to clipboard

```bash
echo "copy this" | clip.exe
```

#### Aliases

There is simple support for aliases. They can be created by using the `alias` command like this: `alias ls=ls --color $*`. They are pretty much just *doskeys* in `/config/aliases`. One per line. And make sure to handle arguments by putting argument variables `$*` somewhere.

#### Updating + Building

There is not much going on here. But if you want to get most recent updates for Conemu just tick *auto-updating* in preferences. If you want to clone the repo and build it yourself, you will need *PowerShell >=3.0 and 7z*. When you are set on that, just run `scripts/build.ps1`.

#### Documentations

Most of the Cmder functionality are documented in the [readme](https://github.com/cmderdev/cmder/blob/master/README.md) file on GitHub. We have extented help available in [Cmder Wiki](https://github.com/cmderdev/cmder/wiki), also regarding integration.

If you're having trouble with anything, please have a look at the GitHub [issues](https://github.com/cmderdev/cmder/issues?q=is:issue), or create [a new one](https://github.com/cmderdev/cmder/issues/new).
We'll be happy to help, but you might have a better chance to find solutions on the pages of the upstream projects. Those are:

- Console emulator ~ [Conemu](https://conemu.github.io/)
- Cmd.exe enhancements ~ [clink](https://chrisant996.github.io/clink/)
- Unix tools on windows ~ [git for windows](https://gitforwindows.org/)



***

🤍**2023** [**Brenton Holiday**](https://allmylinks.com/8rents)
