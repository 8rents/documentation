# ADB Guide

> #### *Android Debug Bridge is a command line tool that lets you communicate with an android device over usb or wifi from a laptop or desktop computer. You can issue commands, install applications, make back ups and much much more*

***

## Installation

### Debian based Linux via pkg or apt

```bash
apt update
apt install android-tools
```

### Windows (with Chocolatey package manager)

If you don't have chocolatey installed on your machine yet consult this guide: https://chocolatey.org/install

After it's installed run the following in PowerShell

```powersh
choco install adb
```

### Manual Installation

Decide where you want your `adb` toolset to live. I'll install mine here for example:

```bash
C:\Users\b\Dropbox\Config\ADB\
```

Then Download `adb`

[Download ADB Here](https://developer.android.com/studio/releases/platform-tools)

## Verifying that `adb` is installed

You can check to see if `adb` is installed by checking it's version

```power
adb version
```

If it's installed properly you should see something like this:

```powershell
Android Debug Bridge version 1.0.41
Version 33.0.3-8952118
```

## Working with `adb`

If you installed with a package manager like chocolatey or you've added it into your shell path.  You'll use it like so:

```bash
adb
```

Otherwise you'll need to navigate to the folder that you installed it to and reference it like this:

```bash
./adb
```

> If you try the first one and it doesn't work use the second. I'm going to omit the `./` from in front of the command for clarity.

### Checking the list of connected devices

Connect an android phone to your laptop. Make sure you've [enabled USB debugging in developer options](https://www.embarcadero.com/starthere/xe5/mobdevsetup/android/en/enabling_usb_debugging_on_an_android_device.html).

*From within the `adb` Folder*
```powershell
adb devices
```
**example output:**

```powershell
* daemon not running; starting now at tcp:5037
* daemon started successfully
List of devices attached
3934994jr93 device
```

```powershell

```Now `attach` the `usb` session to the phone

```bash
# Attach the device via usb
adb usb attach
```

Lastly start the shell:

```bash
adb shell
```

## Optional: Pairing Over WiFi

Under __Developer Options > Wireless Debugging__: Select `Wireless Debugging`

Make note of the __IP address & Port__. In this example let's say it's hypothetically: 

```txt
10.12.12.165:32855
```

That means that the:

- __IP:__ 10.12.12.165
- __Port:__ 32855

Now that you have the phones IP & Port number, we want to `pair` the computer and the phone, we do this with the IP address & the port numbers. Back in your terminal window type:

```bash
adb pair 10.12.12.165:32855
```

Then connect to the device:

```bash
# adb connect ip:port
adb connect 10.12.12.165:32855
```


Once you have the device listed and the demon running:

```powershell
adb shell
```

type `exit` to exit the shell

### Issuing commands 

you can either get locked into the shell with `shell` or you can issue one time commands with 

```bash
adb shell 
```

## Navigating to the `Storage` Folder

To get to the main internal storage location:

```bash
# sdcard (if you have one installed)
# If not typing the below command will bring you to 
cd /sdcard

# If you have an sd card installed but want to get to the internal storage location
cd /storage/emulated/0
```

> __Note:__ If you do not have an SD card installed changing directory to `sdcard` will automatically bring you to `/storage/emulated/0` aka __Internal Storage__.




## Ending the USB Connection

```bash
adb kill-server
```



## Full `adb` Help Page

```powershell
Android Debug Bridge version 1.0.41
Version 33.0.3-8952118
Installed as C:\ProgramData\chocoportable\lib\adb\tools\platform-tools\adb.exe

global options:
 -a                       listen on all network interfaces, not just localhost
 -d                       use USB device (error if multiple devices connected)
 -e                       use TCP/IP device (error if multiple TCP/IP devices available)
 -s SERIAL                use device with given serial (overrides $ANDROID_SERIAL)
 -t ID                    use device with given transport id
 -H                       name of adb server host [default=localhost]
 -P                       port of adb server [default=5037]
 -L SOCKET                listen on given socket for adb server [default=tcp:localhost:5037]
 --one-device SERIAL|USB  only allowed with 'start-server' or 'server nodaemon', server will only connect to one USB device, specified by a serial number or USB device address.
 --exit-on-write-error    exit if stdout is closed

general commands:
 devices [-l]             list connected devices (-l for long output)
 help                     show this help message
 version                  show version num

networking:
 connect HOST[:PORT]      connect to a device via TCP/IP [default port=5555]
 disconnect [HOST[:PORT]]
     disconnect from given TCP/IP device [default port=5555], or all
 pair HOST[:PORT] [PAIRING CODE]
     pair with a device for secure TCP/IP communication
 forward --list           list all forward socket connections
 forward [--no-rebind] LOCAL REMOTE
     forward socket connection using:
       tcp:<port> (<local> may be "tcp:0" to pick any open port)
       localabstract:<unix domain socket name>
       localreserved:<unix domain socket name>
       localfilesystem:<unix domain socket name>
       dev:<character device name>
       jdwp:<process pid> (remote only)
       vsock:<CID>:<port> (remote only)
       acceptfd:<fd> (listen only)
 forward --remove LOCAL   remove specific forward socket connection
 forward --remove-all     remove all forward socket connections
 reverse --list           list all reverse socket connections from device
 reverse [--no-rebind] REMOTE LOCAL
     reverse socket connection using:
       tcp:<port> (<remote> may be "tcp:0" to pick any open port)
       localabstract:<unix domain socket name>
       localreserved:<unix domain socket name>
       localfilesystem:<unix domain socket name>
 reverse --remove REMOTE  remove specific reverse socket connection
 reverse --remove-all     remove all reverse socket connections from device
 mdns check               check if mdns discovery is available
 mdns services            list all discovered services

file transfer:
 push [--sync] [-z ALGORITHM] [-Z] LOCAL... REMOTE
     copy local files/directories to device
     --sync: only push files that are newer on the host than the device
     -n: dry run: push files to device without storing to the filesystem
     -z: enable compression with a specified algorithm (any/none/brotli/lz4/zstd)
     -Z: disable compression
 pull [-a] [-z ALGORITHM] [-Z] REMOTE... LOCAL
     copy files/dirs from device
     -a: preserve file timestamp and mode
     -z: enable compression with a specified algorithm (any/none/brotli/lz4/zstd)
     -Z: disable compression
 sync [-l] [-z ALGORITHM] [-Z] [all|data|odm|oem|product|system|system_ext|vendor]
     sync a local build from $ANDROID_PRODUCT_OUT to the device (default all)
     -n: dry run: push files to device without storing to the filesystem
     -l: list files that would be copied, but don't copy them
     -z: enable compression with a specified algorithm (any/none/brotli/lz4/zstd)
     -Z: disable compression

shell:
 shell [-e ESCAPE] [-n] [-Tt] [-x] [COMMAND...]
     run remote shell command (interactive shell if no command given)
     -e: choose escape character, or "none"; default '~'
     -n: don't read from stdin
     -T: disable pty allocation
     -t: allocate a pty if on a tty (-tt: force pty allocation)
     -x: disable remote exit codes and stdout/stderr separation
 emu COMMAND              run emulator console command

app installation (see also `adb shell cmd package help`):
 install [-lrtsdg] [--instant] PACKAGE
     push a single package to the device and install it
 install-multiple [-lrtsdpg] [--instant] PACKAGE...
     push multiple APKs to the device for a single package and install them
 install-multi-package [-lrtsdpg] [--instant] PACKAGE...
     push one or more packages to the device and install them atomically
     -r: replace existing application
     -t: allow test packages
     -d: allow version code downgrade (debuggable packages only)
     -p: partial application install (install-multiple only)
     -g: grant all runtime permissions
     --abi ABI: override platform's default ABI
     --instant: cause the app to be installed as an ephemeral install app
     --no-streaming: always push APK to device and invoke Package Manager as separate steps
     --streaming: force streaming APK directly into Package Manager
     --fastdeploy: use fast deploy
     --no-fastdeploy: prevent use of fast deploy
     --force-agent: force update of deployment agent when using fast deploy
     --date-check-agent: update deployment agent when local version is newer and using fast deploy
     --version-check-agent: update deployment agent when local version has different version code and using fast deploy
     (See also `adb shell pm help` for more options.)
 uninstall [-k] PACKAGE
     remove this app package from the device
     '-k': keep the data and cache directories

debugging:
 bugreport [PATH]
     write bugreport to given PATH [default=bugreport.zip];
     if PATH is a directory, the bug report is saved in that directory.
     devices that don't support zipped bug reports output to stdout.
 jdwp                     list pids of processes hosting a JDWP transport
 logcat                   show device log (logcat --help for more)

security:
 disable-verity           disable dm-verity checking on userdebug builds
 enable-verity            re-enable dm-verity checking on userdebug builds
 keygen FILE
     generate adb public/private key; private key stored in FILE,

scripting:
 wait-for[-TRANSPORT]-STATE...
     wait for device to be in a given state
     STATE: device, recovery, rescue, sideload, bootloader, or disconnect
     TRANSPORT: usb, local, or any [default=any]
 get-state                print offline | bootloader | device
 get-serialno             print <serial-number>
 get-devpath              print <device-path>
 remount [-R]
      remount partitions read-write. if a reboot is required, -R will
      will automatically reboot the device.
 reboot [bootloader|recovery|sideload|sideload-auto-reboot]
     reboot the device; defaults to booting system image but
     supports bootloader and recovery too. sideload reboots
     into recovery and automatically starts sideload mode,
     sideload-auto-reboot is the same but reboots after sideloading.
 sideload OTAPACKAGE      sideload the given full OTA package
 root                     restart adbd with root permissions
 unroot                   restart adbd without root permissions
 usb                      restart adbd listening on USB
 tcpip PORT               restart adbd listening on TCP on PORT

internal debugging:
 start-server             ensure that there is a server running
 kill-server              kill the server if it is running
 reconnect                kick connection from host side to force reconnect
 reconnect device         kick connection from device side to force reconnect
 reconnect offline        reset offline/unauthorized devices to force reconnect

usb:
 attach                   attach a detached USB device
 detach                   detach from a USB device to allow use by other processes
environment variables:
 $ADB_TRACE
     comma-separated list of debug info to log:
     all,adb,sockets,packets,rwx,usb,sync,sysdeps,transport,jdwp
 $ADB_VENDOR_KEYS         colon-separated list of keys (files or directories)
 $ANDROID_SERIAL          serial number to connect to (see -s)
 $ANDROID_LOG_TAGS        tags to be used by logcat (see logcat --help)
 $ADB_LOCAL_TRANSPORT_MAX_PORT max emulator scan port (default 5585, 16 emus)
 $ADB_MDNS_AUTO_CONNECT   comma-separated list of mdns services to allow auto-connect (default adb-tls-connect)
```



## References

- [Official Documentation](https://developer.android.com/studio/command-line/adb)