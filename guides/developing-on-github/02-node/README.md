[Documentation](./) > [Guides](../guides/README.md) > [Developing on GitHub](../README.md) > **Our First Nodejs App**

---

# Our First practice nodejs app

> ***In the previous guide on [how to get set up](../../README.md) to develop ephemerally using GitHub. We downloaded the required local tools and a basic package manager “scoop”.***
> 
> ***This guide will intentionally be kept as simple as possible with a guide after it including more development options such as using git flow and pushing to GitHub.***

---

With scoop we installed git, scoop and nodejs installed, lets create a new nodejs application.

Be aware the Node also has it’s own package manager called **NPM** (Node Package Manager). We will be using NPM heavily with each of our node projects.

## Setting up a space for our project

Let’s get started on where we left off:

### Creating a folder to hold all our projects

First we will create a new folder for our projects. I’ll call mine `dev`.

```powershell
# Make a directory to hold all of our projects
mkdir ~/dev
cd dev
```

### Creating a folder for our first project

Then let’s create another folder within `dev` for our first project. I’ll call it `hello-node`.

```powershell
# Make a folder to hold our first node app project
mkdir hello-node
cd hello-node
```

### Making `hello-node` a git repository

The following will initialize the folder as a git repository. This can also be done with the [GitHub Desktop GUI Client](https://desktop.github.com/download/).

```powershell
git init
```

### Initializing the `hello-node` folder as a nodejs project

Using `npm`'s `init` command we will set up some of the basics for the project.

```powershell
npm init
```

This will bring up an interactive terminal menu for setting up our project and getting it linked to npm.

Hit enter through all the options ***except this one***:

```powershell
entry point: (index.js) 
```

Use `app.js` instead of `index.js`

Now hit enter through the rest of the options.

When the interactive menu completes it will have created a `package.json` file within the folder.

### Making our first project snapshot with git

We will now make the first snapshot of our project. We can always go back to this point later if we screw something up. 

A snapshot is called a commit. Creating a commit happens in a minimum of two steps. 

#### Which files should we include in the snapshot?

First telling git what files we should include in the commit. `git add <filename>` does the trick, however to simply **add all** the files, we can do `git add -a` (*add all*).

```powershell
# stages all the files in the hello-node folder to be included in the git commit
git add -a
```

#### Committing all the included files to the snapshot

The second part of creating a snapshot is actually committing the files to the repo. `add` doesn’t do this. 

##### Committing the files to the git snapshot

```powershell
git commit -m "this is the first commit"
```
> Do feel free to make some of the noises since this task is all done.

#### Optional: Upload (Push) the development files to GitHub

To push the files the way that they are to GitHub.

Currently we only have one remote called `origin`. There is also only one branch called `main`.

```powershell
# uploads the orig
git push origin main
```

##### Creating a branch to hold development

Instead of just developing on the `main` branch, we could create a separate branch to `dev`elop on. Then when we had our changes working we could bring them over to `main`. It would be a good idea to create a `dev` branch.

```powershell
# create a new branch called dev
git checkout -b dev
```

##### Using a separate repository to collaborate with others

We will now push the development files to GitHub.

The following command pushes the `dev` branch of the project to the remote called `github`.

##### Using a separate repository to collaborate with others on

```powershell
# create a new remote called github from origin (git repo)
git remote rename origin github
```



```powershell
# to push (send files remote)
git push github dev
```

> **Note:** We would have already had to have set the remotes for the repository to know what a `github` branch is. It will probably spew it’s guts because we don’t even have a dedicated `dev` branch for this repo yet

You have set this up and technically it will work, but most importantly is that you understand exactly what each command is trying to accomplish.



---

**🤍2024 [Brenton Holiday](https://8rents.github.io)**
