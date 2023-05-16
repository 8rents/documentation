[Documentation](../../../tree/1st-drafts) > [Tools](./) > **Typora**

![Typora Icon](https://raw.githubusercontent.com/8rents/_/i/typora-icon.png)

# Typora

> #### ***A Beautiful cross platform markdown editor.***
>
> *This is a guide to hacking Typora. A how to on creating your own themes, hacking preferences and power using this GUI app to create beautiful documentation with ease.*

---

Rarely will I ever suggest a non-free application. However in this department Typora is miles above the competition. It's simple, intuitive and makes writing a pleasure.

## A quick word on Documentation

In my book writing good documentation is probably the most important general skill any developer can possess. This is not only to the benefit of others working with the developers creations, but for the developers themselves some time in the future.

In the past we were taught how to cram and memorize information. Now I propose that instead we learn how to document our education in a way that will be clear to us now, us one year in the future and everyone else with no previous understanding.

Memorization is for suckers. Write good documentation.

---

## Typora automatic Setup

I have 2 options as far as setting up typora automatically. 

### Option 1 --- Linking a data directory

Try  to find a way to link (hard or sym) the installed data directory back tgo a preconfigured directory on the USB. This would probably be the ideal approch because then I could easily update it and the updates would be installed on the USB and the **app would become fully portable.**

#### Directory Locations

The locations of the directory that is craeted when typora is installed and then a copy of that directory saved to the USB to eventually try to link to. 

##### Typora Installed Data Directory

```
"C:\Users\sfplinternet\AppData\Roaming\Typora"
```

##### Copied Typora Data Directory on USB Drive

```
"D:\Settings\OS\Windows\Programs\Installed\Typora\data"
```

### Option 2 --- Moving configuration Files

Have a directory on the USB with modified configuration files and then to move each of the files to the correct spot on. 

#### How to Automatically Setup Typora

1. Open Typora (to create a fresh install directory in `C:\Users\sfplinternet\AppData\Roaming\Typora`)
2. Copy said files into place (See list Below)
3. Close and then reopen Typora to get the changes.

#### Figuring out what files have been modified

- **Base Directory:** `C:\Users\sfplinternet\AppData\Roaming\`

##### Setting up folders to se changes

I'll need to make 3 folders

- **`Typora`** - The directory that's created on install.]
- **`Typora-original`** - A copy of the original  `Typora` that will preserve the original state.
- **`Typora-merged`** - A copy of the original `Typora` directory that we will merge changed files into.

---

## Install Script  --- General Gist

1. Have Typora closed
2. Copy `Typora` to `Typora-original`
3. Make all desired configuration changes. 
4. Make a copy of `Typora-original` as `Typora-modified`
5. Move files in `Typora` (that have been changed when configuration was done) into `Typora-modified` and get list of changed files \*.

> \* *maybe use `unison` for this*

### List of changed files

- > *The list goes here*...

---

__W/🤍__ in __2023__ by __[Brenton Holiday](https://allmylinks.com/8rents)__ as part of the [Ephemeral Computing](https://github.com/8rents/ephemeral-computing) workflow.