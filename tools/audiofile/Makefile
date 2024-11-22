include ../../include/detect_cross.mk

ifeq ($(SWITCH_TO_CROSS),1)
AR  := $(PLATFORM_CROSS)ar
CXX := $(PLATFORM_CROSS)g++
else
AR  := ar
CXX := g++
endif

libaudiofile.a: audiofile.o
	$(AR) rcs $@ $^

audiofile.o: audiofile.cpp audiofile.h aupvlist.h
	$(CXX) -std=c++11 -O2 -I. -c $< -o $@

clean:
	$(RM) audiofile.o libaudiofile.a

.PHONY: clean
