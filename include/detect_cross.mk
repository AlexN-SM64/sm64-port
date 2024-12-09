# Detect architectures for Windows builds
ifeq ($(TARGET_WINDOWS),1)

ifeq ($(shell arch),aarch64)

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

else ifeq ($(shell arch),x86_64)

  ifneq ($(call find-command,x86_64-w64-mingw32-gcc),)
    ARCHITECTURE ?= x86_64
  else ifneq ($(call find-command,i686-w64-mingw32-gcc),)
    ARCHITECTURE ?= i686
  else
    ARCHITECTURE ?= x86_64
  endif
  
  $(eval $(call validate-option,ARCHITECTURE,x86_64 i686))

else ifeq ($(shell arch),i686)

  ARCHITECTURE ?= i686
  
  $(eval $(call validate-option,ARCHITECTURE,i686))

endif

ARCHITECTURE ?= $(shell arch)

PLATFORM_CROSS ?= $(ARCHITECTURE)-w64-mingw32-

endif

ifeq ($(TARGET_N64),1)

# Detect MIPS prefix for N64 builds
MIPS_CROSS := $(shell bash print_cmd_cross.sh mips)
ifeq ($(call find-command,$(shell bash print_cmd_cross.sh mips)ld),)
  $(error Unable to detect a suitable MIPS toolchain installed)
endif

# Detect CC check for N64 builds
ifneq ($(shell arch),x86_64)
ifneq ($(shell arch),i686)
ifeq ($(NO_CHECK),0)

  ifneq ($(call find-command,x86_64-linux-gnu-gcc),)
    CC_CHECK_CROSS := x86_64-linux-gnu-
  else ifneq ($(call find-command,i686-linux-gnu-gcc),)
    CC_CHECK_CROSS := i686-linux-gnu-
  endif

endif
endif
endif

endif
