What is this?

> This is a workbench to support the creation of linux kernel modules for use with camkes-vm-linux.

Who can use it?

> I've tested this script using:
> - WSL2 on Windows 10
> - Debian 10 (pending)

Why would I want it?

> It automatically prepares and configures a camkes-vm app,
> ready for simulation after just a few steps,
> which includes a linux kernel module built as part of the seL4 build process.
> If you want to write linux kernel modules to use with camkes-arm-vm,
> this workstation will make it easier for you.

 How do I use it?

> At this time,
> [prepareWorkstation.sh](https://github.com/NeisesResearch/kernel_module_workstation/blob/main/prepareWorkstation.sh)
> automates most of the procedure. It requires some input when it prepares the
> linux kernel for compilation, but at that time you can just hit Enter until you're
> no longer needed.
> After it succeeds, you have only to start your Docker instance.
> Then enter the camkes-arm-vm/build directory and run the [buildModuleMinimal.sh](https://github.com/NeisesResearch/kernel_module_workstation/blob/main/buildScripts/buildModuleMinimal.sh) script.
> This will generate the ./simulate script, which will boot the kernel.
> Once logged into the linux system, use `insmod /lib/modules/...` to load the module.

How long does it take?

> It takes as long as it takes to download and compile the linux kernel.
  I encourage you to edit the prepareWorkstation.sh script to compile the
  linux kernel in a multi-threaded way, like so, where X is the number of threads:
```
make -jX ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
```

Where can I read the top-level procedure?

> Right [here](https://github.com/NeisesResearch/kernel_module_workstation/wiki/seL4Config).

