# script to grab the latest version of the camkes-arm project,
# add the module_minimal app,

#dir=camkesvm`date +"%B%d"`
camkesdir=camkes-arm-vm
mkdir ${camkesdir};

cd ${camkesdir} &&
echo "==================================" &&
echo "Grab the latest camkes-arm-vm repo..." &&
echo "==================================" &&
repo init -u https://github.com/sel4/camkes-arm-vm-manifest &&
repo sync &&
echo "==================================" &&
echo "Repo grabbed!" &&
echo "Copy module_minimal into the project..." &&
echo "==================================" &&
cp -r ../module_minimal projects/vm-examples/apps/Arm/ &&
echo "==================================" &&
echo "module_minimal copied!" &&
mkdir build &&
echo "Copy scripts into the build directory..." &&
echo "==================================" &&
cp ../buildScripts/* build/ &&
echo "==================================" &&
echo "Copied!" &&
echo "Clone the Linux kernel and checkout the latest 4.9.y version..." &&
echo "==================================" &&
cd projects/camkes-vm-images/qemu-arm-virt &&

git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git &&

cd linux-stable &&
git checkout linux-4.9.y &&
git fetch &&
echo "==================================" &&
echo "Cloned!" &&
echo "Ensure the working directory is clean..." &&
echo "==================================" &&
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- clean &&
(rm .config || true) &&
(rm .config.old || true) &&
(rm Module.symvers || true) &&
echo "==================================" &&
echo "Clean!" &&
echo "Grab the Linux config used in the camkes-vm-images project..." &&
echo "==================================" &&
cp  ../linux_configs/config .config &&
cp .config .config.old &&
echo "==================================" &&
echo "Found it!" &&
echo "Prepare the kernel for cross compilation..." &&
echo "==================================" &&
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- prepare &&
echo "==================================" &&
echo "Prepared!" &&
echo "Build the kernel. This will take a while." &&
echo "==================================" &&
make -j$(nproc) ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- &&
echo "==================================" &&
echo "All finished! Now let's copy the new kernel image into the camkes-vm-images project." &&
cp arch/arm64/boot/Image ../newLinux &&
echo "Copy away the config and Modules.symvers into the camkes-vm-linux project." &&
mkdir ../../../camkes-vm-linux/linux_configs/4.9.y &&
mkdir ../../../camkes-vm-linux/linux_configs/4.9.y/64 &&
cp .config ../../../camkes-vm-linux/linux_configs/4.9.y/64/config &&
cp Module.symvers ../../../camkes-vm-linux/linux_configs/4.9.y/64/Module.symvers &&
echo "Okay, all done! Now you can enter your Docker instance and build the camkes project setup for you in camkes-arm-vm/build."

