#!/bin/bash

# Usage: find_existing_cmd.sh [ cross_prefix | find_command ] <architecture> <command>
#
# Examples:
#
#
# bash find_existing_cmd.sh cross_prefix mips ld
#
# this script prints one of them:
# mips-linux-gnu-  (Ubuntu/Debian)
# mips-suse-linux- (openSUSE)
#
#
# bash find_existing_cmd.sh cross_prefix mips64 ld
#
# this script prints one of them:
# mips64-elf-       (Arch Linux AUR)
# mips64-linux-gnu- (RHEL/CentOS/Fedora)
#
#
# bash find_existing_cmd.sh find_command x86_64 gcc
#
# this script prints one of them:
# x86_64-linux-gnu-gcc         (Compatible GNU/Linux distributions)
# x86_64-unknown-linux-gnu-gcc (Unknown GNU/Linux distributions)
# x86_64-pc-cygwin-gcc         (Cygwin)
# x86_64-w64-mingw32-gcc       (MinGW)
#
#
# bash find_existing_cmd.sh find_command x86_64 gcc-14
#
# this script prints one of them:
# x86_64-linux-gnu-gcc-14  (GNU/Linux)
# x86_64-suse-linux-gcc-14 (openSUSE)

TYPE=$1
ARCH=$2
CMD=$3

if [[ $OS == Windows_NT ]]; then
EXE=.exe
CMD_EXE=$CMD$EXE
else
CMD_EXE=$CMD
fi

ARCH_DASH=$ARCH-
DASH_CMD=-$CMD_EXE

ARCH_STRING_LENGTH=${#ARCH}
CMD_STRING_LENGTH=${#CMD_EXE}
if [[ $OS == Windows_NT ]]; then
EXE_STRING_LENGTH=${#EXE}
fi

CMDLIST_BY_ARCH=$(compgen -c $ARCH_DASH | sort)
TARGET_CMD=$(for TARGET in $CMDLIST_BY_ARCH; do if [[ $TARGET == *$DASH_CMD ]]; then echo $TARGET; fi; done | head -1)

if [[ $TYPE == cross_prefix ]]; then
echo ${TARGET_CMD::-$CMD_STRING_LENGTH}
elif [[ $TYPE == find_command ]]; then
if [[ $OS == Windows_NT ]]; then
echo ${TARGET_CMD::-$EXE_STRING_LENGTH}
else
echo $TARGET_CMD
fi
else
echo "Usage: $0 [ cross_prefix | find_command ] <architecture> <command>"
exit 1
fi
