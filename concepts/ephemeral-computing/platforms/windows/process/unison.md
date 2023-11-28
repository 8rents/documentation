# <img src="https://raw.githubusercontent.com/8rents/_/i/sfpl-logo.png" alt="SFPL Logo" style="zoom:33%;" /> Using Unsion

> ####  *Learning about bi-directional copy and folder watching*

---

## Unison GUI

I’ll start the unison GUI by typing into cmder `unison-gui.exe`.

### Unison Profiles

A profile appears to be a folder pair or a set of folders that will all be syncronized. So, basically one sync folder



---

## Testing Unison Commands

I’ll work in `bash` and in a testing directory on my USB `/d/unison`. I’ll make two directories inside it to start, `src` and `dest`. 

>  *Given that we are working with a bi-directional sync, **source** and **destination** aren’t exactly the correct way to think about it, but it will help me keep track in the beginning.*



---

## Output of `unison -doc tutorial`

### Tutorial

#### Preliminaries

Unison can be used with either of two user interfaces:

   1. a straightforward textual interface and

   2. a more sophisticated graphical interface

The textual interface is more convenient for running from scripts and works on dumb terminals; the graphical interface is better for most interactive use. For this tutorial, you can use either. If you are running Unison from the command line, just typing unison will select either the text or the graphical interface, depending on which has been selected as default when the executable you are running was built. You can force the text interface even if graphical is the default by adding -ui text. The other command-line arguments to both versions are identical.

The graphical version can also be run directly by clicking on its icon, but this may require a little set-up (see the section “Click-starting Unison” ). For this tutorial, we assume that you’re starting it from the command line.

Unison can synchronize files and directories on a single machine, or between two machines on a network. (The same program runs on both machines; the only difference is which one is responsible for displaying the user interface.) If you’re only interested in a single-machine setup, then let’s call that machine the CLIENT . If you’re synchronizing two machines, let’s call them CLIENT and SERVER .

#### Local Usage

Let’s get the client machine set up first and see how to synchronize two directories on a single machine.

Follow the instructions in the section “Installation” to either download or build an executable version of Unison, and install it somewhere on your search path. (If you just want to use the textual user interface, download the appropriate textui binary. If you just want to the graphical interface—or if you will use both interfaces [the gtkui binary actually has both compiled in]—then download the gtkui binary.)

Create a small test directory a.tmp containing a couple of files and/or ubdirectories, e.g.,
 `mkdir a.tmp`
 `touch a.tmp/a a.tmp/b`
 `mkdir a.tmp/d`
 `touch a.tmp/d/f`

**Copy this directory to b.tmp:**
`cp -r a.tmp b.tmp`

Now try synchronizing a.tmp and b.tmp. (Since they are identical, synchronizing them won’t propagate any changes, but Unison will remember the current state of both directories so that it will be able to tell next time what has changed.) Type:

unison a.tmp b.tmp

(You may need to add -ui text, depending how your unison binary was built.)

**Textual Interface:**
* You should see a message notifying you that all the files are actually equal and then get returned to the command line.

**Graphical Interface:**
* You should get a big empty window with a message at the bottom notifying you that all files are identical. Choose the Exit item from the File menu to get back to the command line.

Next, make some changes in `a.tmp` and/or `b.tmp`. 

**For example:**

1. ` rm a.tmp/a`
2. `echo "Hello" > a.tmp/b`
3. `echo "Hello" > b.tmp/b`
4. `date > b.tmp/c`
5. ` echo "Hi there" > a.tmp/d/h` 
6. `echo "Hello there" > b.tmp/d/h`

**Run Unison again:**
`unison a.tmp b.tmp`

This time, the user interface will display only the files that have changed. If a file has been modified in just one replica, then it will be displayed with an arrow indicating the direction that the change needs to be propagated. For example,

`<---  new file   c  [f]`

indicates that the file c has been modified only in the second replica, and that the default action is therefore to propagate the new version to the first replica. 
To follow Unison’s recommendation, press the “f” at the prompt.

If both replicas are modified and their contents are different, then the changes are in conflict: <-?-> is displayed to indicate that Unison needs guidance on which replica should override the other.

`new file  <-?->  new file   d/h  []`

By default, neither version will be propagated and both replicas will remain as they are.

If both replicas have been modified but their new contents are the same (as with the file b), then no propagation is necessary and nothing is shown. Unison simply notes that the file is up to date.

These display conventions are used by both versions of the user  interface. The only difference lies in the way in which Unison’s  default actions are either accepted or overridden by the user.

#####    Textual Interface:

The status of each modified file is displayed, in turn. When the copies of a file in the two replicas are not identical, the user interface will ask for instructions as to how to propagate the change. If some default action is indicated (by an arrow), you can simply press Return to go on to the next changed file. If you want to do something different with this file, press “<” or “>” to force the change to be propagated from right to left or from left to right, or else press “/” to skip this file and leave both replicas alone. When it reaches the end of the list of modified files, Unison will ask you one more time whether it should proceed with the updates that have been selected. When Unison stops to wait for input from the user, pressing “?” will always give a list of possible responses and their meanings.

#####    Graphical Interface:

The main window shows all the files that have been modified in either `a.tmp` or `b.tmp`. To override a default action (or to select an action in the case when there is no default), first select the  file, either by clicking on its name or by using the up- and down-arrow keys. Then press either the left-arrow or “<” key (to cause the  version in b.tmp to propagate to a.tmp) or the right-arrow or “>” key (which makes the a.tmp version override b.tmp).
 

Every keyboard command can also be invoked from the menus at the top of the user interface. (Conversely, each menu item is annotated with its keyboard equivalent, if it has one.) When you are satisfied with the directions for the propagation of changes as shown in the main window, click the “Go” button to set them in motion. A check sign will be displayed next to each filename when the file has been dealt with.

#### Remote Usage

Next, we’ll get Unison set up to synchronize replicas on two different machines.

NB: Unison has not been designed to run with elevated privileges (e.g. setuid), and it has not been audited for that environment. Therefore Unison should be run with the userid of the owner of the files to be  synchronized, and should never be run setuid or similar. (Problems encountered when running setuid etc. must be  reproduced without setuid before being reported as bugs.)

Follow the instructions in the Installation section to download or build an executable version of Unison on the server machine, and install it somewhere on your search path. (It doesn’t matter whether you install the textual  or graphical version, since the copy of Unison on the server doesn’t need to display any user interface at all.)

It is important that the version of Unison installed on the server machine is the same as the version of Unison on the client machine. But some flexibility on the version of Unison at the client side can be achieved by using the -addversion no option; see the section “Preferences” .

Now there is a decision to be made. Unison provides two methods for communicating between the client and the server:
     * Remote shell method: To use this method, you must have some way of
       invoking remote commands on the server from the client’s command
       line, using a facility such as ssh. This method is more convenient
       (since there is no need to manually start a “unison server” process
       on the server) and also more secure, assuming you are using ssh).
     * TCP socket method: This method requires only that you can get TCP
       packets from the client to the server and back. It is insecure and
       should not be used.
     * Unix socket method: This method only works within a single machine.
       It is similar to the TCP sockets method, but it is possible to
       configure it securely.

   Decide which of these you want to try, and continue with the section
   “Remote Shell Method” or the section “Socket Method” , as appropriate.

#### Remote Shell Method

The standard remote shell facility on Unix systems is ssh.

Running ssh requires some coordination between the client and server machines to establish that the client is allowed to invoke commands on  the server; please refer to the ssh documentation for information on how to set this up.

First, test that we can invoke Unison on the server from the client.

Typing

`ssh remotehostname unison -version`

should print the same version information as running

`unison -version`

locally on the client. If remote execution fails, then either something is wrong with your ssh setup (e.g., “permission denied”) or else the search path that’s being used when executing commands on the server doesn’t contain the unison executable (e.g., “command not found”).

   Create a test directory a.tmp in your home directory on the client
   machine.

   Test that the local unison client can start and connect to the remote
   server. Type
 unison -testServer a.tmp ssh://remotehostname/a.tmp

   Now cd to your home directory and type:
 unison a.tmp ssh://remotehostname/a.tmp

   The result should be that the entire directory a.tmp is propagated from
   the client to your home directory on the server.

   After finishing the first synchronization, change a few files and try
   synchronizing again. You should see similar results as in the local
   case.

   If your user name on the server is not the same as on the client, you
   need to specify it on the command line:
 unison a.tmp ssh://username@remotehostname/a.tmp

#####    Notes:

  * If you want to put a.tmp some place other than your home directory
​ on the remote host, you can give an absolute path for it by adding
​ an extra slash between remotehostname and the beginning of the
​ path:
​ unison a.tmp ssh://remotehostname//absolute/path/to/a.tmp

* You can give an explicit path for the unison executable on the
   server by using the command-line option `"-servercmd
   /full/path/name/of/unison"` or adding
   `"servercmd=/full/path/name/of/unison"` to your profile (see the
   section “Profiles” ). Similarly, you can specify an explicit path
   for the ssh program using the "-sshcmd" option. Extra arguments can
   be passed to ssh by setting the -sshargs preference.
 * By leveraging` "-sshcmd"` and `"-sshargs"`, you can effectively use any
   remote shell program, not just ssh; just remember that the roots
   are still specified with ssh as the protocol, that is, they have to
   start with `"ssh://`".

#### Socket Method

   To run Unison over a socket connection, you must start a Unison daemon
   process on the server. This process runs continuously, waiting for
   connections over a given socket from client machines running Unison and
   processing their requests in turn.

   Since the socket method is not used by many people, its functionality
   is rather limited. For example, the server can only deal with one
   client at a time.

   Note that the Unison daemon process is always started with a
   command-line argument; not from a profile.

##### TCP Sockets

>  **Warning:** **The TCP socket method is insecure: not only are the texts*
>  *of your changes transmitted over the network in unprotected form, it*
>  *is also possible for anyone in the world to connect to the server*
>  *process and read out the contents of your filesystem! (Of course, to*
>  *do this they must understand the protocol that Unison uses to*
>  *communicate between client and server, but all they need for this is*
>  *a copy of the Unison sources.) The socket method is provided only*
>  *for expert users with specific needs; everyone else should use the*
>  ssh method.*

   To start the daemon for connections over a TCP socket, type
 `unison -socket NNNN`

   on the server machine, where NNNN is the TCP port number that the
   daemon should listen on for connections from clients. (NNNN can be any
   large number that is not being used by some other program; if NNNN is
   already in use, Unison will exit with an error message.)

   Create a test directory `a.tmp` in your home directory on the client
   machine. Now type:
 `unison a.tmp socket://remotehostname:NNNN/a.tmp`

   Note that paths specified by the client will be interpreted relative to
   the directory in which you start the server process; this behavior is
   different from the ssh case, where the path is relative to your home
   directory on the server. The result should be that the entire directory
   a.tmp is propagated from the client to the server (a.tmp will be
   created on the server in the directory that the server was started
   from). After finishing the first synchronization, change a few files
   and try synchronizing again. You should see similar results as in the
   local case.

   By default Unison will listen for incoming connections on all
   interfaces. If you want to limit this to certain interfaces or
   addresses then you can use the -listen command-line argument,
   specifying a host name or an IP address to listen on. -listen can be
   given multiple times to listen on several addresses.

##### Unix Domain Sockets

   To start the daemon for connections over a Unix domain socket, type
   ` unison -socket PPPP`

   where PPPP is the path to a Unix socket that the daemon should open for
   connections from clients. (`PPPP` can be any absolute or relative path
   the server process has access to but it must not exist yet; the socket
   is created at that path when the daemon process is started.) You are
   responsible for securing access to the socket path. For example, this
   can be done by controlling the permissions of socket’s parent
   directory, or ensuring a restrictive umask value when starting Unison.

   Clients can connect to a server over a Unix domain socket by specifying
   the absolute or relative path to the socket, instead of a server
   address and port number:
   ` unison a.tmp socket://{path/to/unix/socket}/a.tmp`

   (socket path is enclosed in curly braces).

   Note that Unix domain sockets are local sockets (they exist in the
   filesystem namespace). One could use Unixs socket remotely, by
   forwarding access to the socket by other means, for example by using
   spiped secure pipe daemon.

#### Using Unison for All Your Files

   Once you are comfortable with the basic operation of Unison, you may
   find yourself wanting to use it regularly to synchronize your commonly
   used files. There are several possible ways of going about this:
 1. Synchronize your whole home directory, using the Ignore facility
 (see the section “Ignoring Paths” ) to avoid synchronizing
 temporary files and things that only belong on one host.
 2. Create a subdirectory called shared (or current, or whatever) in
 your home directory on each host, and put all the files you want to
 synchronize into this directory.
 3. Create a subdirectory called shared (or current, or whatever) in
 your home directory on each host, and put links to all the files
 you want to synchronize into this directory. Use the follow
 preference (see the section “Symbolic Links” ) to make Unison treat
 these links as transparent.
 4. Make your home directory the root of the synchronization, but tell
 Unison to synchronize only some of the files and subdirectories
 within it on any given run. This can be accomplished by using the
 -path switch on the command line:
 unison /home/username ssh://remotehost//home/username -path shared

   The -path option can be used as many times as needed, to
   synchronize several files or subdirectories:

```
  unison /home/username ssh://remotehost//home/username \
   -path shared \
   -path pub \
   -path .netscape/bookmarks.html
```

   These -path arguments can also be put in your preference file. See
   the section “Preferences” for an example.

   Most people find that they only need to maintain a profile (or
   profiles) on one of the hosts that they synchronize, since Unison is
   always initiated from this host. (For example, if you’re synchronizing
   a laptop with a fileserver, you’ll probably always run Unison on the
   laptop.) This is a bit different from the usual situation with
   asymmetric mirroring programs like rdist, where the mirroring operation
   typically needs to be initiated from the machine with the most recent
   changes. the section “Profiles” covers the syntax of Unison profiles,
   together with some sample profiles.

   Some tips on improving Unison’s performance can be found on the
   Frequently Asked Questions page
   (http://www.cis.upenn.edu/~bcpierce/unison/faq.html).

#### Using Unison to Synchronize More Than Two Machines

   Unison is designed for synchronizing pairs of replicas. However, it is
   possible to use it to keep larger groups of machines in sync by
   performing multiple pairwise synchronizations.

   If you need to do this, the most reliable way to set things up is to
   organize the machines into a “star topology,” with one machine
   designated as the “hub” and the rest as “spokes,” and with each spoke
   machine synchronizing only with the hub. The big advantage of the star
   topology is that it eliminates the possibility of confusing “spurious
   conflicts” arising from the fact that a separate archive is maintained
   by Unison for every pair of hosts that it synchronizes.

#### Going Further

   On-line documentation for the various features of Unison can be
   obtained either by typing
  `unison -doc topics`

   at the command line, or by selecting the Help menu in the graphical
   user interface. The same information is also available in a typeset
   User’s Manual (HTML or PostScript format) through
   http://www.cis.upenn.edu/~bcpierce/unison.

   If you use Unison regularly, you should subscribe to one of the mailing
   lists, to receive announcements of new versions. See the section
   “Mailing Lists and Bug Reporting” .

---

## Output of `unison -help`

```bash
λ unison -help
Usage: unison [options]
 or unison root1 root2 [options]
 or unison profilename [options]

Basic options:

  General:
   -doc xxx   show documentation ('-doc topics' lists topics)
   -version   print version and exit

  What to sync:
   -group  synchronize group attributes
   -ignore xxx   add a pattern to the ignore list
   -ignorenot xxx   add a pattern to the ignorenot list
   -nocreation xxx  prevent file creations on one replica
   -nodeletion xxx  prevent file deletions on one replica
   -noupdate xxx prevent file updates and deletions on one replica
   -owner  synchronize owner
   -path xxx  path to synchronize
   -perms n   part of the permissions which is synchronized
   -root xxx  root of a replica (should be used exactly twice)
   -times  synchronize modification times

  How to sync:
   -batch  batch mode: ask no questions at all

  How to sync (text interface (CLI) only):
   -auto   automatically accept default (nonconflicting) actions
   -silent print nothing except error messages
   -terse  suppress status messages

  Text interface (CLI):
   -i   interactive profile mode (text UI); command-line only

Advanced options:

  Fine-tune sync:
   -acl synchronize ACLs
   -atomic xxx   add a pattern to the atomic list
   -follow xxx   add a pattern to the follow list
   -force xxx force changes from this replica to the other
   -forcepartial xxx   add a pattern to the forcepartial list
   -ignorecase xxx  identify upper/lowercase filenames (true/false/default)
   -immutable xxx   add a pattern to the immutable list
   -immutablenot xxx   add a pattern to the immutablenot list
   -links xxx allow the synchronization of symbolic links
  (true/false/default)
   -merge xxx add a pattern to the merge list
   -nocreationpartial xxx add a pattern to the nocreationpartial list
   -nodeletionpartial xxx add a pattern to the nodeletionpartial list
   -noupdatepartial xxx add a pattern to the noupdatepartial list
   -prefer xxx   choose this replica's version for conflicting changes
   -preferpartial xxx  add a pattern to the preferpartial list
   -rsrc xxx  synchronize resource forks (true/false/default)
   -xattrignore xxx add a pattern to the xattrignore list
   -xattrignorenot xxx add a pattern to the xattrignorenot list
   -xattrs synchronize extended attributes (xattrs)

  How to sync:
   -backup xxx   add a pattern to the backup list
   -backupcurr xxx  add a pattern to the backupcurr list
   -backupcurrnot xxx  add a pattern to the backupcurrnot list
   -backupdir xxx   directory for storing centralized backups
   -backuploc xxx   where backups are stored ('local' or 'central')
   -backupnot xxx   add a pattern to the backupnot list
   -backupprefix xxx   prefix for the names of backup files
   -backups   (deprecated) keep backup copies of all files (see also
  'backup')
   -backupsuffix xxx   a suffix to be added to names of backup files
   -confirmbigdel   ask about whole-replica (or path) deletes (default true)
   -confirmmerge ask for confirmation before committing results of a merge
   -copyonconflict  keep copies of conflicting files
   -dontchmod when set, never use the chmod system call
   -fastcheck xxx   do fast update detection (true/false/default)
   -fat use appropriate options for FAT filesystems
   -ignoreinodenumbers ignore inode number changes when detecting updates
   -maxbackups n number of backed up versions of a file
   -numericids   do not map uid/gid values by user/group names
   -sortbysize   list changed files by size, not name
   -sortfirst xxx   add a pattern to the sortfirst list
   -sortlast xxx add a pattern to the sortlast list
   -sortnewfirst list new before changed files

  How to sync (text interface (CLI) only):
   -repeat xxx   synchronize repeatedly (text interface only)
   -retry n   re-try failed synchronizations N times (text ui only)

  Text interface (CLI):
   -color xxx use color output for text UI (true/false/default)
   -dumbtty   do not change terminal settings in text UI

  Graphical interface (GUI):
   -height n  height (in lines) of main window in graphical interface

  Remote connections:
   -addversionno add version number to name of unison on server
   -clientHostName xxx set host name of client
   -halfduplex   (deprecated) force half-duplex communication with the
  server
   -killserver   kill server when done (even when using sockets)
   -listen xxx   listen on this name or addr in server socket mode (can
  repeat)
   -rsync  activate the rsync transfer mode (default true)
   -servercmd xxx   name of unison executable on remote server
   -socket xxx   act as a server on a socket
   -sshargs xxx  other arguments (if any) for remote shell command
   -sshcmd xxx   path to the ssh executable
   -stream (deprecated) use a streaming protocol for transferring
  file contents (default true)
   -testserver   exit immediately after the connection to the server
   -xferbycopying   optimize transfers using local copies (default true)

  Archive management:
   -ignorearchives  ignore existing archive files

  Other:
   -addprefsto xxx  file to add new prefs to
   -contactquietly  suppress the 'contacting server' message during startup
   -copymax n maximum number of simultaneous copyprog transfers
   -copyprog xxx external program for copying large files
   -copyprogrest xxx   variant of copyprog for resuming partial transfers
   -copythreshold n use copyprog on files bigger than this (if >=0, in Kb)
   -diff xxx  set command for showing differences between files
   -ignorelocks  ignore locks left over from previous run (dangerous!)
   -include xxx  include a profile's preferences
   -key xxx   define a keyboard shortcut for this profile (in some UIs)
   -label xxx provide a descriptive string label for this profile
   -log record actions in logfile (default true)
   -logfile xxx  logfile name
   -maxerrors n  maximum number of errors before a directory transfer is
  aborted
   -maxsizethreshold n prevent transfer of files bigger than this (if >=0, in
  Kb)
   -maxthreads n maximum number of simultaneous file transfers
   -mountpoint xxx  abort if this path does not exist
   -rootalias xxx   register alias for canonical root names
   -showarchive  show 'true names' (for rootalias) of roots and archive
   -source xxx   include a file's preferences
   -ui xxx select UI ('text' or 'graphic'); command-line only
   -unicode xxx  assume Unicode encoding in case insensitive mode
   -watch  when set, use a file watcher process to detect changes

Expert options:
   -debug xxx debug module xxx ('all' -> everything, 'verbose' -> more)
   -dumparchives dump contents of archives just after loading
   -fastercheckUNSAFE  skip computing fingerprints for new files (experts only!)
   -selftest  run internal tests and exit 
 
```

