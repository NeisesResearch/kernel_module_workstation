# Cross-Compiling Kernel Modules for use with seL4's Linux VM using qemu-arm-virt from Debian 10

1. download linux kernel repo
```
git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
cd linux-stable
git checkout linux-4.9.y
git fetch
```

2. grab the config from seL4
```
make clean
cp .../projects/camkes-vm-images/qemu-arm-virt/linux_configs/config ./.config
cp .../projects/camkes-vm-images/qemu-arm-virt/linux_configs/Module.symvers ./Module.symvers
```

3. prepare kernel for cross-compilation, choosing default config options always
```
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- prepare
```

5. build linux kernel
```
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
```

This results in a file called "vmlinux", which is the uncompressed kernel. I'm not sure whether this is useful to us, or if we need a compressed version, like a bzImage, for instance. However, `make bzImage` is not valid for this architecture.

