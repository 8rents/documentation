
![tmux](https://raw.githubusercontent.com/8rents/_/i/tmux-logo.svg)

# tmux - *a brief guide...*


> *in great opposition to gnu `screen`..*
> 
> *We will stand for powerful features triggered by illogical and hard to remember keyboard commands. The light is at the end of the tunnel and only massive and painstaking customization stands between us.*

## Central Concepts


Tmux is a terminal multiplexer that's used to emulate command line environments. It's ideal for running commands over SSH without needing to open multiple window or worrying about having a connection drop.* 

### Avoiding misconceptions & common pane points

Tmux has sessions, windows, and panes. The hierarchy is that Tmux could have multiple sessions, a session could have multiple windows, a window could have multiple panes. 

> **Tmux Instance**    
	*there is only 1 tmux per console*
> > **Sessions**    
        *1 or more sessions to an instance of tmux*
> > >  **Windows**     
		  *1 or more windows in a session*
> > > > **Panes**    
              *1 or more panes in a window*

For example, we could create a session for a specific project. In the project session, we could create multiple windows, and each window would be used for each specific task for the project. In the window, in order to finish the task more efficiently, we create multiple panes for purposes such as process monitoring and file management. 

### Dual Interface

Similar to Docker, Tmux has two layers of the interface, the local terminal outside Tmux, and the terminal inside Tmux. We could manage Tmux in both layers. While typing bash commands are equivalent in both interface, to manage the Tmux related stuff inside Tmux, we would need to use hotkeys so Tmux knows when to manage the Tmux related stuff. All the hotkeys are prefixed by `Ctrl` + `b` which will be notated as `Cb` for simplicity. [Source](https://leimao.github.io/blog/Tmux-Tutorial/#Dual-Interface "Dual Interface")

#### Outside of a tmux instance

In a nutshell, bash commands control the local terminal. You'll enter these from outside of a tmux instance and will start with `tmux`.

#### Inside a tmux instance

While inside a tmux instance. `Ctrl` + `b` is used to get tmux to listen for commands.  this is often notated as `Cb`.

For example to detach from a session you'd hit `d`*

#### Sending external commands from inside a tmux instance using `:`

You can think of the `:` (which is called by `ctrl + b` then typing `:`) as the same as the `tmux` command. That's the key stroke combo to remember. *

##  Basic Usage

Here's some basic commands to get you started.

### Creating a Session

To start working with tmux for the first time, you'll need to create a new tmux instance.  

This is as simple as just typing:

```bash
tmux
```

## Detach from a session 

It's best to use the keyboard 

#### Tmux command

```bash
exit
```
from within tmux

#### Keyboard shortcut

```bash
ctrl + b d
```
### Naming a new session 

#### Command 

```bash
tmux new -s [session name] 
```

### Listing available sessions 

```bash
tmux ls
```
Or within Tmux you can show sessions with:

```r
ctrl + b s
```
Within tmux the view is a lot more comprehensive. Navigate the window with the arrow keys and `enter`
***




## Quick commands

### Sessions

| `Cb` | effect |
|:--:| :----------------- |
| `` | **new** session |
| `` | **destroy** session |
| `s` |  **show** (list) sessions |
| `a` | **attatch** session |
| `d` | **detatch** session |
| `$` |  rename Session |

### Windows

| `Cb` | effect |
|:--:| :----------------- |
| `` | **new** window in current session |
| `` |  **show** (list) windows in current session |
| `n` |  **next** window in current session |
| `p` |  **previous** window in current session |
| `.` |  rename current window|

### Panes

| `Cb` | effect |
|:--:| :----------------- |
| `z` |  toggle full screen current pane |
| `%` |  split pane horizontally ( `-` customization) |
| `"` |  split pane vertically ( `|` customization)|

### General

| `Cb` | effect |
|:--:| :----------------- |
| `?` | show help |


## Using a Config File

### Keyboard Binds

#### Panes

### Colors

#### Bottom bar color



## References

- The vast majority of this guide was sourced from the incredible [Leimao tmux tutorial](https://leimao.github.io/blog/Tmux-Tutorial/)