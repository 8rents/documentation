[Documentation](../) > [Tools](./) > **CMDR**

<img src="https://raw.githubusercontent.com/8rents/_/i/cmder.png" alt="tmux" style="zoom: 25%;" />

#  Cmder

> ***Lovely, portable console emulator package for Windows***

Cmder is a portable terminal emulator that can be installed easily on a USB flash or drive and/or Dropbox and stores all your terminal settings. No more having to run a massive PowerShell script each time I sign onto a public machine :)

## Links

- [**Download Cmder** on GutHub](https://github.com/cmderdev/cmder/releases/download/v1.3.21/cmder.zip)
- [The **differences between MSYS2 & MinGW** Bash](https://github.com/git-for-windows/build-extra#the-difference-between-msys2-and-mingw)
- [**Starship** - A cross Shell Prompt](https://starship.rs/)
- [**Oh My Bash** - A Shell Framework & Shameless Fork of *Oh My ZSH*](https://ohmybash.nntoan.com/)

---

## Goals & Setup

I have 4 main goals for my terminal set up. *I want my terminal to be:*

1. As **portable** as possible

2. As **Linuxy** as possible

3. ***Sexy as fuck*** and ***very configurable***

4. **Using package managers**. We will have one for each platform / shell.

   

### Goal 1: Portable

I want to have my terminal installed on my USB or on Dropbox or Google Drive. I’d like as many of the settings and configurations to be saved between sessions.

### Goal 2: Linuxishy                                           

I’m not sure that this is actually a word, but if you’ve used terminals on both Windows and Linux, you’ll see a world of difference in how these things work. I want my bash to be as similar to bash on a Linux install with as many of the same programs. Not some cobbled together frankenbash dumb monster.

This led me to [comparing the 2 bundled versions of bash in Cmder, mingw and mysys2](https://github.com/git-for-windows/build-extra#the-difference-between-msys2-and-mingw).

### Goal 3: ***Sexy as fuck*** and ***very configurable***

We will be using the mysys2 version of bash instead of the mingw version. 

I’ll be adding on a front end to bash as well using either [starship](https://starship.rs/) which is a cross shell prompt, that is super easy to configure and theme, or [oh-my-bash](https://ohmybash.nntoan.com/) which is a framework based on `oh-my-zsh` used for theming, extending and writing plugins.

### Goal 4: Package managers

I want to have package managers available for each of the shells that I’m using so that I can quickly install and update complex sets of software.

- **For Windows: ** We will be using Chocolatey as our package manager.
- **For Mysys2 Bash: ** We will be using `pacman`! Yep, the same package manager that comes bundled with arch Linux come bundled with our precious version of bash.

----

## Nifty Tips

### 1. Copy terminal output to clipboard

```bash
echo "copy this" | clip.exe
```

---

## Keyboard Commands

Here’s some nifty keyboard commands to fire off in Cmder.

### Tab manipulation

- `Ctrl + \` : **Global Summon from taskbar**
- `Win + Alt + p` : **Preferences (Or right click on title bar)**
- `Ctrl + t` : **New tab dialog (maybe you want to open cmd as admin?)**
- `Ctrl + w` : **Close tab**
- `shift + alt + number` : **fast new tab**
  1.  CMD
  2.  PowerShell
- `Alt + Enter` : **Full screen**

### Shell

- **Traverse up in directory structure (lovely feature!)**  
  `Ctrl + Alt + u` 
- **`End**, Home, Ctrl` : **Traverse text as usual on Windows**
- `Ctrl + r` : **History search**
- `Shift + mouse` : **Select and copy text from buffer**
- `Right click / Ctrl + Shift + v` : **Paste text**

---

**🤍2023 [Brenton Holiday](https://allmylinks.com/8rents)**
