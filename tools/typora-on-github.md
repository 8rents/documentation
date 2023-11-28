

[Documentation](../../../tree/1st-drafts) > [Tools](./) > **Typora**

---

# <img src="https://raw.githubusercontent.com/8rents/_/i/typora-icon.png" alt="Typora Icon" style="zoom:15%;" /> Typora

*A Beautiful cross platform markdown editor.*

> ***This is a guide to hacking Typora. A how to on creating your own themes, hacking preferences and power using this GUI app to create beautiful documentation with ease.***

---

Rarely will I ever suggest a non-free application. However in this department Typora is miles above the competition. It's simple, intuitive and makes writing a pleasure.

## A quick word on Documentation

In my book writing good documentation is probably the most important general skill any developer can possess. This is not only to the benefit of others working with the developers creations, but for the developers themselves some time in the future.

In the past we were taught how to cram and memorize information. Now I propose that instead we learn how to document our education in a way that will be clear to us now, us one year in the future and everyone else with no previous understanding.

Memorization is for suckers. Write good documentation.

---

## Typora automatic Setup

Since our Windows environment is destroyed after each use, we don’t want to take 15 minutes and run through the same settings every time we sit down to work. What we want to do is save the settings we make once, and then load them each time.

When you install Typora, you can select the install location. This picks where the `Typora` folder with the `Typora.exe` is going to live. It doesn’t really matter at all where this folder lives because our settings are no stored in it.

### Where Typora Settings are stored

Settings are always stored in the AppData directory at:

```bash
\AppData\Roaming\Typora
```

### Creating a GitHub Repository to hold Settings

After I run Typora for the first time, I'm going to create a new private repository on GitHub with the name `Typora`.

When I open the app for the first time, I'm going to go through all the settings and customize everything. I'm also going to add a few more themes, that I can check out in the future. 

Once, I've got Typora configured how I want it, I'm going clone the empty repo and then to move all the files inside `\AppData\Roaming\Typora` into the cloned directory.

Then I'm going to **add, commit and push** back all the files **to GitHub.

### Setting up the Typora repo as a Submodule

Now that we have all the settings for the app saved on GitHub, I'll want to add the Typora repo to the workstation type Repository as a submodule. 

This way when I get on Whatever workstation type, I can download that main repository and then get all of the OS and application settings as submodules.

---

__W/🤍__ in __2023__ by __[Brenton Holiday](https://allmylinks.com/8rents)__ as part of the [Ephemeral Computing](https://github.com/8rents/ephemeral-computing) workflow.