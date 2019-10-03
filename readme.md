# popcorn

This repository contains the popcorn bootloader and kernel.

## dependencies

- nasm
- qemu (if you want to test)

## about

My goal here is to create a simple, single process kernel for x86 platforms.
It is written in assembly, perhaps with a bit of c thrown in later on. This
is not meant to be a useful kernel in any way.

I could just use grub and make this a lot easier for myself, but I am pretty
commited to writing my own bootloader. It's not that complicated anyway.

## installation

I don't know why you would want to do this but if you do, here's how:

```sh
make
dd if=kernel.bin of=/dev/sdX
```

Where sdX is the drive you wan't to flash to.

## references

- osdev.org
- github.com/cfenollosa/os-tutorial
- Intel x86 manual
- osdever.net
