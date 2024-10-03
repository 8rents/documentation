[Documentation](./) > [Guides](../guides/README.md) > [Developing on GitHub](../README.md) > [Getting Set Up on](../README.md) > **Windows**

---

### [Getting set up on:](../../README.md)

# Windows

#### *To Developing on GitHub*

---

> #### *In depth series of articles detailing from start to finish developing apps in the cloud using GitHub*

This is the first part in a multipart guide to using the cloud (aka GitHub) to develop apps on. No Virtual Machine or Virtual Private Servers required!

## Getting things installed

#### On Windows

##### Package Manager

I’ll be using Scoop as my local Windows package manager. To begin open up a PowerShell Window and copy / paste the following

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

This will install Scoop

Next install a couple of needed apps with scoop

```powershell
scoop install git windows-terminal nodejs
```

This will install 3 things:

- **`git`** - the basis of GitHub. Also the basis of scoop.
- **`windows-terminal`** - A much nicer terminal than PowerShell
- **`nodejs`** - The server side programming environment we will be developing in.

## Up Next

[**Building our first nodejs app**](../02-node/README.md)

---

**🤍2024 [Brenton Holiday](https://8rents.github.io)**

