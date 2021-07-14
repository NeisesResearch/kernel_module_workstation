# script to grab the latest version of the camkes-arm project,
# add the module_minimal app,

#dir=camkesvm`date +"%B%d"`
dir=camkes_arm_vm
mkdir ${dir};
cd ${dir} &&
echo "==================================" &&
echo "Grab the latest repo..." &&
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
cd build &&   
echo "Copy scripts into the build directory..." &&
echo "==================================" &&
cp ../../buildScripts/* . &&
echo "==================================" &&
echo "Copied!" &&
echo "Clone the Linux kernel and checkout the latest 4.9.y version..." &&
echo "==================================" &&
git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git &&
cd linux-stable &&
git checkout linux-4.9.y &&
git fetch &&
echo "==================================" &&
echo "Got it!" &&
echo "Grab the Linux config used in the camkes-vm-images project..." &&
echo "==================================" &&
cp ../camkes-arm-vm/projects/camkes-vm-images/qemu-arm-virt/linux-configs/config .config &&
echo "==================================" &&
echo "Found it!" &&
echo "Prepare the kernel for cross compilation..." &&
echo "==================================" &&
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- prepare &&
echo "==================================" &&
echo "Prepared!" &&
echo "Build the kernel. This will take a while. I'll try to beep when I'm done." &&
echo "==================================" &&
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- &&
(beep || true) &&
echo "All finished! Now let's copy the image into the camkes-vm-images project." &&
cp arch/arm64/boot/Image ../camkes-arm-vm/projects/camkes-vm-images/qemu-arm-virt/newLinux &&
echo "Copy away the config and Modules.symvers into the camkes-vm-linux project." &&
mkdir -p ../projects/camkes-vm-linux/linux-configs/4.9.y/64 &&
cp .config ../projects/camkes-vm-linux/linux-configs/4.9.y/64/config &&
cp Module.symvers ../projects/camkes-vm-linux/linux-configs/4.9.y/64/Module.symvers &&
echo "Okay, all done! Now you can enter your Docker instance and build the camkes project setup for you in camkes-arm-vm/build."

