# script to build the project with the appropriate flags

echo "====================================" &&
echo "Grabbing the latest module_minimal..." &&

if rm -rf ../projects/vm-examples/apps/Arm/module_minimal ; then 
    true
else
    echo "The module_minimal app wasn't there."
fi &&

echo "..." &&
cp -r ../../module_minimal ../projects/vm-examples/apps/Arm &&
echo "module_minimal updated." &&
echo "Trying to build..." &&
echo "====================================" &&
../init-build.sh -DCAMKES_VM_APP=module_minimal -DPLATFORM=qemu-arm-virt &&
echo "====================================" &&
echo "Build succeeded." &&
echo "Calling ninja..." &&
echo "====================================" &&
ninja &&
echo "Ninja succeeded. Feel free to ./simulate now."

