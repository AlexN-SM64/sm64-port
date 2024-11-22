# Detect architectures for Windows builds
ifeq ($(TARGET_WINDOWS),1)

ifeq ($(arch),aarch64)

  ifneq ($(call find-command,aarch64-w64-mingw32-gcc),)
    ARCHITECTURE ?= aarch64
  else ifneq ($(call find-command,x86_64-w64-mingw32-gcc),)
    ARCHITECTURE ?= x86_64
  else ifneq ($(call find-command,i686-w64-mingw32-gcc),)
    ARCHITECTURE ?= i686
  else
    ARCHITECTURE ?= aarch64
  endif
  
  $(eval $(call validate-option,ARCHITECTURE,aarch64 x86_64 i686))

else ifeq ($(arch),x86_64)

  ifneq ($(call find-command,x86_64-w64-mingw32-gcc),)
    ARCHITECTURE ?= x86_64
  else ifneq ($(call find-command,i686-w64-mingw32-gcc),)
    ARCHITECTURE ?= i686
  else
    ARCHITECTURE ?= x86_64
  endif
  
  $(eval $(call validate-option,ARCHITECTURE,x86_64 i686))

else ifeq ($(arch),i686)

  ARCHITECTURE ?= i686
  
  $(eval $(call validate-option,ARCHITECTURE,i686))

endif

ARCHITECTURE ?= $(arch)

PLATFORM_CROSS := $(ARCHITECTURE)-w64-mingw32-

endif

# Detect architectures for Linux builds
ifeq ($(TARGET_LINUX),1)

ifeq ($(arch),aarch64)

  ifneq ($(call find-command,aarch64-linux-gnu-gcc),)
    ARCHITECTURE ?= aarch64
  else ifneq ($(call find-command,x86_64-linux-gnu-gcc),)
    ARCHITECTURE ?= x86_64
  else ifneq ($(call find-command,i686-linux-gnu-gcc),)
    ARCHITECTURE ?= i686
  else
    ARCHITECTURE ?= aarch64
  endif
  
  $(eval $(call validate-option,ARCHITECTURE,aarch64 x86_64 i686))

else ifeq ($(arch),x86_64)

  ifneq ($(call find-command,x86_64-linux-gnu-gcc),)
    ARCHITECTURE ?= x86_64
  else ifneq ($(call find-command,i686-linux-gnu-gcc),)
    ARCHITECTURE ?= i686
  else
    ARCHITECTURE ?= x86_64
  endif
  
  $(eval $(call validate-option,ARCHITECTURE,x86_64 i686))

else ifeq ($(arch),i686)

  ARCHITECTURE ?= i686
  
  $(eval $(call validate-option,ARCHITECTURE,i686))

endif

ARCHITECTURE ?= $(arch)

PLATFORM_CROSS := $(ARCHITECTURE)-linux-gnu-

endif

ifeq ($(TARGET_N64),1)

# Detect MIPS prefix for N64 builds
ifneq ($(call find-command,mips-linux-gnu-ld),)
  MIPS_CROSS ?= mips-linux-gnu-
else ifneq ($(call find-command,mips64-linux-gnu-ld),)
  MIPS_CROSS ?= mips64-linux-gnu-
else ifneq ($(call find-command,mips64-elf-ld),)
  MIPS_CROSS ?= mips64-elf-
else ifneq ($(call find-command,mips-suse-linux-ld),)
  MIPS_CROSS ?= mips-suse-linux-
else
  MIPS_CROSS ?= mips-linux-gnu-
endif

# Detect CC check for N64 builds
ifneq ($(arch),x86_64)
ifneq ($(arch),i686)

  ifneq ($(call find-command,x86_64-linux-gnu-gcc),)
    CC_CHECK_CROSS ?= x86_64-linux-gnu-
  else ifneq ($(call find-command,i686-linux-gnu-gcc),)
    CC_CHECK_CROSS ?= i686-linux-gnu-
  else
    CC_CHECK_CROSS ?= x86_64-linux-gnu-
  endif

endif
endif

endif
