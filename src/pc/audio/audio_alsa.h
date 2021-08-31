#ifndef AUDIO_ALSA_H
#define AUDIO_ALSA_H

#include "../compat.h"

#if defined(__linux__) && !defined(TARGET_SDL2) || defined(__BSD__)
extern struct AudioAPI audio_alsa;
#define HAVE_ALSA 1
#else
#define HAVE_ALSA 0
#endif

#endif
