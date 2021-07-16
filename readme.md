What is this?

> This is a workbench to support the creation of kernel modules for use with camkes-vm-linux.

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
> kernel for compilation, but at that time you can just hit Enter until you're
> no longer needed.
> After it succeeds, you have only to start your Docker instance with this repo as the /Host directory.
> Then enter the camkes-arm-vm/build directory and run the [buildModuleMinimal.sh](https://github.com/NeisesResearch/kernel_module_workstation/blob/main/buildScripts/buildModuleMinimal.sh) script.

Why is it important that I start the Docker instance with that /Host directory?

> CMake needs to know [where to find your linux kernel](https://github.com/NeisesResearch/kernel_module_workstation/blob/8763310800f5fb09be0e7350f8bfd568052ec514/module_minimal/CMakeLists.txt#L38)

Where can I read the top-level procedure?

> Right [here](https://github.com/NeisesResearch/kernel_module_workstation/wiki/seL4Config).

