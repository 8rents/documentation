[Ephemeral Computing](../../README.md) > **Using a Live Boot Linux OS**

# Using a Live Boot Linux OS

### *Ephemeral Computing*

> #### *So Windows 10 was pretty limited and a huge pain in the ass to try to work with within the confines of what the library admins deemed ok?*
>
> #### *Let’s take a different approach and fire up a couple of live boot USBs and get to work on a full fledged platform with full admin access.*

---

## Concept

This borders on not a true ephemeral computing workflow because it requires some hardware that you own yourself. In this case it will be a USB drive worn around your neck. Do not wear it on the outside of your shirt. Only take it off to  shower and to be plugged into the library computers.

In essence people could decapitate you and take it.

However, with this workflow, you’ll have a full OS (Windows or Linux or whatever will run on the hardware at hand) and you’ll have full admin rights. No more not being able to do basically anything a developer needs to do because of restrictions.

## Pros & Cons

There’s certainly some big pros, but also some big cons with this workflow. Here’s a quick list:

### Pros

- Full admin right and a personalized & customized OS!
- **LOL…** No more time limit on the library computers since that’s managed on an OS level in Windows.
- Hardware admins can not see your files

### Cons

- **Not a true ephemeral computing workflow** because it requires you to keep some hardware no matter how minimal that could  be lost, stolen or destroyed at any time.
- Persistent storage could be an issue. Will I need a second partition to store my settings and files?
- **Security**. Will the thumb drive I carry every where need to be unencrypted all the time? Will I need a second OS or a bootloader to secure my files?
- **Backups** will be pretty big unless I find a clever way to structure the USB.

------

## USB Partitioning

Thre following will be the ideal partitioning and data storage strategy.

### OS **partition**

I will need a writable OS partition or two that will hold one or more OSs. In the beginning I’ll start with one. I’m going to likely go with *Elementary OS* because it looks nice, isn’t as heavy as *Ubuntu* and is based on *Debian* which I’m most familiar with. 

The OS partitions will not be encrypted and will contain only stock data.

#### Additional OS Partitions

Elementary will likely require additional partitions to be created for things like boot, swap1 and swap2 etc…

This will make it difficult to anticipate exactly how much space I will require to begin with. 

Also this will make it hard to get every bit of the partitioning correct out of the gate.

I’ll probably use 2 USBs until I can figure out the best sizes and the exact number of partitions I’ll need.

### Storage partition

To address security and persistent storage concerns I’m going to create a storage partition on the USB. This should comprise the majority of the USB. 

**The storage partition will be encrypted by default**. 

### Repository partition

I will have a repository server set up on Google drive at first and then will move over to a VPS once I can get a credit card or reliable way of purchasing crypto to purchase server space. The Repository will hold all of my users, personal files, software and device sync and backups.

In the beginning though I want a partition on my USB to hold the beginnings of this repository. 

**The repo should be encrypted by default.**

## Ideal Partition Structure

 ```bash
 USB64GB
 ├──────	Storage Partition (50%) [ext4 encrypted writable]
 │		All of my files.
 ├────── OS 
 │		Stock OS files [10%] [ext4 unencrypted non-writable]
 ├────── OSmods
 │		modifications to the OS, additional apps etc.
 ├────── Swap
 │		swap partitions
 ├────── Repository
 
 ├──────
 ├──────
 ├──────
 └───	Tree End Delta. Up / Across
 ```

## Implementation Path

Factoring the security of the USB and the limitations that the Windows Limited computers will initially provide I’ll need to:

1. Find a Program to **partition the USB I don’t want to use** on a daily basis.
2. Install Linux on it
3. Boot Linux
4. Properly **partition the USB that I want to use on a daily basis** for storage with encryption where it’s needed. 

I have a 16gb USB that I found that I’m going to erase and work on the inital install.

### Choosing your OS

I’m going to use Elementary 

---

🤍2023 **[Brenton Holiday](https://allmylinks.com/8rents)**
