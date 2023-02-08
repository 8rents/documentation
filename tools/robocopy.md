[Documentation](../../../tree/1st-drafts) > [Tools](./) > **Robocopy**

# `robocopy` Guide

>  ### *A quick guide to using `robocopy` in `PowerShell`. It's basically the equivalent of a shitty version of `rsync` for native windows. Pretty gross... I mean the name is so cringe itself* ( : |) *Holy shit*


## Reference Guide

- <https://improve.dk/simple-file-synchronization-using-robocopy/>

## Basic Syntax

```powershell
robocopy <Source> <Destination> [<File>[ ...]] [<Options>]
```

## Example

```powershell
robocopy \\SourceServer\Share \\DestinationServer\Share /MIR /FFT /Z
```

##  Options

-   __`/MIR`__ 
    specifies that robocopy should m


## Basic Syntax

```powershell
robocopy <Source> <Destination> [<File>[ ...]] [<Options>]
```

##  Options

-   ###  __Mirror__ - `/MIR`
    __Mirror__ the source directory and the destination directory. Beware that this may delete files at the destination.

-  ### __Fat file timing__ -`/FFT`
    ### __Fat file timing__ instead of NTFS. This means the granularity is a bit less precise. For across-network share operations this seems to be much more reliable - just don’t rely on the file timings to be completely precise to the second.
  
-   __ReZume__ - `/Z`
  
  ensures robocopy can __resume__ the transfer of a large file in mid-file instead of restarting.

-   __Ignore hidden files__ - `/XA:H`  
  rReduces the w__Wait time__ between failures (*to 5 seconds instead of the 30 second default.
  in this case*)`


## Useful Examples

### Sync 2 Folders

This example __syncs the Dropbox installation folder__ on the `C:\\` drive  with the Dropbox folder on a USB stick on the `D:\\` drive. 

```bash

#### The Two commands

```bash
# Sync the dropbox folder with the D drive
# Copies anything being saved to the d drive to the c drive first
# then copies the entire c folder to d

# copies the firefox profile from the d drive to the c drive
robocopy D:\Dropbox\AppsConfig\Browsers\Firefox\Brenton C:\Users\sfplinternet\Dropbox\AppsConfig\Browsers\Firefox\Brenton /MIR /FFT /Z /XA:H /W:5

# Copies the Dropbox folder to the d drive
robocopy C:\Users\sfplinternet\Dropbox D:\Dropbox /MIR /FFT /Z /XA:H /W:5
```


## Example Output

```powershell
30 sed deat.
------------------------------------------------------------------------------

               Total    Copied   Skipped  Mismatch    FAILED    Extras
    Dirs :      1047         3      1044         0         0        49
   Files :     22607       244     22363         0         0       321
   Bytes :   2.053 g   60.80 m   1.994 g         0         0   18.60 m
   Times :   0:00:12   0:00:06                       0:00:00   0:00:06


   Speed :            10438927 Bytes/sec.
   Speed :             597.320 MegaBytes/min.
   Ended : Thursday, March 24, 2022 5:26:00 PM
```

## Reference Guides

- [Helpful Basics](https://improve.dk/simple-file-synchronization-using-robocopy/)
- [More in-depth useful guide](https://adamtheautomator.com/robocopy/)