## download linux kernel repo
git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
cd linux-stable
git checkout linux-4.9.y
git fetch

## choose the arm64 defconfig, for use with qemu-arm-virt
make ARCH=arm64 defconfig

## install ncurses-dev in order to use make menuconfig
sudo apt-get install ncurses-dev

## ensure loadable module support is enabled
make menuconfig

## prepare kernel for cross-compilation
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- prepare

## prepare for module build (optional... might as well just build the kernel, right?)
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules_prepare

## build linux kernel
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- 

## this results in a vmlinux file, which is the uncompressed kernel
## I'm not sure whether this is useful to us, or if we need a compressed version
## like a bzImage, for instance

