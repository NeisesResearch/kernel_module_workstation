What is this?

> This is a workbench to support the creation of kernel modules for use with camkes-vm-linux.

 How do I use it?

> At this time, [prepareWorkstation.sh](https://github.com/NeisesResearch/vm_measure/blob/main/prepareWorkstation.sh) automates the whole procedure.
> After it succeeds, you have only to start your Docker instance with this repo as the /Host directory.
> Then enter the camkes-arm-vm/build directory and run the [buildModuleMinimal.sh](https://github.com/NeisesResearch/vm_measure/blob/main/buildScripts/buildModuleMinimal.sh) script.

Why is it important that I start the Docker instance with that /Host directory?

> CMake needs to know [where to find your linux kernel](https://github.com/NeisesResearch/vm_measure/blob/8763310800f5fb09be0e7350f8bfd568052ec514/module_minimal/CMakeLists.txt#L38)

Where can I read the top-level procedure?

> Right [here](https://github.com/NeisesResearch/vm_measure/wiki/seL4Config).

