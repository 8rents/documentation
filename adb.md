# ADB Guide
> #### Working with the Android Debug Bridge in PowerShell.

Android Debug Bridge is a command line tool that lets you communicate with an android device over usb or wifi from a laptop or desktop computer. You can issue commands, install applications, make back ups and much much more.

## Installing ABD

## Debian based Linux via pkg or apt

```bash
apt update
apt install android-tools
adb help
```



## Windows with Chocolatey package manager (proffered)

## Manual Installation

Decide where you want your adb toolset to live. I'll install mine here for example:

```bash
C:\Users\sfplinternet\Dropbox\Config\ADB\
```

Then Download adb

[Download ADB Here](https://developer.android.com/studio/releases/platform-tools)

## Install`adb`

### Windows via Chocolatey (Preferred Method)


If you don't have chocolatey installed [see here](https://docs.chocolatey.org/en-us/choco/setup#non-administrative-install)

Once you have Chocolatey Installed simply run:

```bash
choco install adb
```
Move the `platfom-tools/adb` folder to:

```powershell
cd C:\Users\sfplinternet\Dropbox\Scripts\ADB\
```

> __Note:__ If you use this method keep in mind that you are going to need to navigate to the install directory (probably `C:\Users\sfplinternet\Dropbox\Scripts\ADB\` and then each time you run the command prefix it with `./` so that it looks like this:

## Working with `adb`

If you installed with a package manager like chocolatey or you've added it into your shell path.  You'll use it like so:

```bash
adb
```

Otherwise you'll need to naviaget to the folder that you installed it to and reference it like this:

```bash
./\adb
```

If you try the first one and it doesn't work use the second.


### Checking the list of connected devices
*From within the `ADB` Folder*
```powershell
.\adb devices
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

## References

- [Official Documentation](https://developer.android.com/studio/command-line/adb)