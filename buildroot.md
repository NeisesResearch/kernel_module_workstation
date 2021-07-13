# alternately, get buildroot
git clone git://git.buildroot.net/buildroot

# enable loadable module support for arm64
make menuconfig
>target arch = aarch64 little endian
>target binary format = elf (unchanged)
>target arch variant = cortex-a53 (unchanged)
>floating point strategy = FP-ARMv8 (unchanged)

# build
make

## except this doesn't work because my WSL PATH has windows filepaths, which include spaces
## give up for now
