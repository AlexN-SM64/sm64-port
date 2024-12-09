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

PLATFORM_CROSS := $(ARCHITECTURE)-w64-mingw32-

endif

AARCH64_CROSS := $(shell sh print_cmd_cross.sh aarch64)
X86_64_CROSS := $(shell sh print_cmd_cross.sh x86_64)
I686_CROSS := $(shell sh print_cmd_cross.sh i686)

# Detect architectures for Linux builds
ifeq ($(TARGET_LINUX),1)

ifeq ($(shell arch),aarch64)

  ifneq ($(call find-command,$(AARCH64_CROSS)gcc),)
    ARCHITECTURE ?= aarch64
  else ifneq ($(call find-command,$(X86_64_CROSS)gcc),)
    ARCHITECTURE ?= x86_64
  else ifneq ($(call find-command,$(I686_CROSS)gcc),)
    ARCHITECTURE ?= i686
  else
    ARCHITECTURE ?= aarch64
  endif
  
  $(eval $(call validate-option,ARCHITECTURE,aarch64 x86_64 i686))

else ifeq ($(shell arch),x86_64)

  ifneq ($(call find-command,$(X86_64_CROSS)gcc),)
    ARCHITECTURE ?= x86_64
  else ifneq ($(call find-command,$(I686_CROSS)gcc),)
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

PLATFORM_CROSS := $(shell sh print_cmd_cross.sh $(ARCHITECTURE))

endif

ifeq ($(TARGET_N64),1)

# Detect MIPS prefix for N64 builds
MIPS_ARCH_CROSS ?= $(shell sh print_cmd_cross.sh mips)
MIPS64_ARCH_CROSS ?= $(shell sh print_cmd_cross.sh mips64)

ifneq ($(call find-command,$(MIPS_ARCH_CROSS)ld),)
  MIPS_CROSS ?= $(MIPS_ARCH_CROSS)
else ifneq ($(call find-command,$(MIPS64_ARCH_CROSS)ld),)
  MIPS_CROSS ?= $(MIPS64_ARCH_CROSS)
else
  MIPS_CROSS ?= $(MIPS_ARCH_CROSS)
endif

# Detect CC check for N64 builds
ifneq ($(shell arch),x86_64)
ifneq ($(shell arch),i686)

  ifneq ($(call find-command,$(X86_64_CROSS)gcc),)
    CC_CHECK_CROSS ?= $(X86_64_CROSS)
  else ifneq ($(call find-command,$(I686_CROSS)gcc),)
    CC_CHECK_CROSS ?= $(I686_CROSS)
  else
    CC_CHECK_CROSS ?= $(X86_64_CROSS)
  endif

endif
endif

endif
