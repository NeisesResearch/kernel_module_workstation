#
# Copyright 2018, Data61, CSIRO (ABN 41 687 119 230)
#
# SPDX-License-Identifier: BSD-2-Clause
#

# force cpu for qemu-arm-virt
set(QEMU_MEMORY "2048")
set(KernelArmCPU cortex-a53 CACHE STRING "" FORCE)
set(VmInitRdFile ON CACHE BOOL "" FORCE)
