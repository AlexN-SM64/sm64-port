DASH := -
CC_VERSION_SUFFIX := $(DASH)$(gcc -dumpversion)

ifeq ($(TARGET_N64),1)

  # Detect prefix for N64 builds
  ifneq ($(call find-command,$(shell bash find_existing_cmd.sh find_command mips ld no_prefix_dash)),)
    MIPS_CROSS ?= $(shell bash find_existing_cmd.sh cross_prefix mips ld no_prefix_dash)
  endif
  ifeq ($(findstring mips,$(MIPS_CROSS)),)
    $(error Unable to detect a suitable MIPS toolchain installed)
  endif

  # Detect CC check for N64 builds
  ifeq ($(NO_CHECK),0)
  
    ifneq ($(shell getconf LONG_BIT), 32)
      ifneq ($(call find-command,$(shell bash find_existing_cmd.sh find_command x86_64 gcc no_prefix_dash)),)
        CC_CHECK_CROSS ?= $(shell bash find_existing_cmd.sh cross_prefix x86_64 gcc no_prefix_dash)
      else ifneq ($(call find-command,$(shell bash find_existing_cmd.sh find_command i686 gcc no_prefix_dash)),)
        CC_CHECK_CROSS ?= $(shell bash find_existing_cmd.sh cross_prefix i686 gcc no_prefix_dash)
      else ifneq ($(call find-command,$(shell bash find_existing_cmd.sh find_command powerpc gcc no_prefix_dash)),)
        CC_CHECK_CROSS ?= $(shell bash find_existing_cmd.sh cross_prefix powerpc gcc no_prefix_dash)
      else ifneq ($(call find-command,$(shell bash find_existing_cmd.sh find_command x86_64 gcc$(CC_VERSION_SUFFIX) no_prefix_dash)),)
        CC_CHECK_CROSS ?= $(shell bash find_existing_cmd.sh cross_prefix x86_64 gcc$(CC_VERSION_SUFFIX) no_prefix_dash)
      else ifneq ($(call find-command,$(shell bash find_existing_cmd.sh find_command i686 gcc$(CC_VERSION_SUFFIX) no_prefix_dash)),)
        CC_CHECK_CROSS ?= $(shell bash find_existing_cmd.sh cross_prefix i686 gcc$(CC_VERSION_SUFFIX) no_prefix_dash)
      else ifneq ($(call find-command,$(shell bash find_existing_cmd.sh find_command powerpc gcc$(CC_VERSION_SUFFIX) no_prefix_dash)),)
        CC_CHECK_CROSS ?= $(shell bash find_existing_cmd.sh cross_prefix powerpc gcc$(CC_VERSION_SUFFIX) no_prefix_dash)
      endif
      ifeq ($(findstring x86_64,$(CC_CHECK_CROSS)),)
        ifeq ($(findstring i686,$(CC_CHECK_CROSS)),)
          ifeq ($(findstring powerpc,$(CC_CHECK_CROSS)),)
            $(error To check the code as 32-bit, the entire GCC is available for x86_64, i686 and powerpc architectures. Please install one of them or build with NO_CHECK=1)
          endif
        endif
      endif
    endif
  
  endif

# Detect architectures for Windows builds
else ifeq ($(TARGET_WINDOWS),1)

  ifeq ($(shell arch),aarch64)
    ifneq ($(call find-command,x86_64-w64-mingw32-gcc),)
      ARCHITECTURE ?= x86_64
    else ifneq ($(call find-command,i686-w64-mingw32-gcc),)
      ARCHITECTURE ?= i686
    else
      ARCHITECTURE ?= aarch64
    endif
  else ifeq ($(shell arch),x86_64)
    ifneq ($(call find-command,i686-w64-mingw32-gcc),)
      ARCHITECTURE ?= i686
    else
      ARCHITECTURE ?= x86_64
    endif
  else ifeq ($(shell arch),i686)
    ARCHITECTURE ?= i686
  endif
  ARCHITECTURE ?= $(shell arch)
  PLATFORM_CROSS := $(ARCHITECTURE)-w64-mingw32-

# Detect architectures for other builds
else

  ARCHITECTURE ?= $(shell arch)
  PLATFORM_CROSS ?= $(shell bash find_existing_cmd.sh cross_prefix $(ARCHITECTURE) gcc no_prefix_dash)

endif
