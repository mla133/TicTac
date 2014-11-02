#
# define the C source files
SRCS = CApp.cpp CApp_OnInit.cpp CApp_OnEvent.cpp CApp_OnLoop.cpp CApp_OnRender.cpp CApp_OnCleanup.cpp CSurface.cpp CEvent.cpp

# 'make depend' uses makedepend to automatically generate dependencies 
#               (dependencies are added to end of Makefile)
# 'make'        build executable file 'mycc'
# 'make clean'  removes all .o and executable files
#

# define the C compiler to use
CC = g++

# define any compile-time flags
CFLAGS = -Wall 

# define any directories containing header files other than /usr/include
#
INCLUDES = -I.

# define library paths in addition to /usr/lib
#   if I wanted to include libraries not in /usr/lib I'd specify
#   their path using -Lpath, something like:
#LFLAGS = -L/home/newhall/lib  -L../lib

# define any libraries to link into executable:
#   if I want to link in libraries (libx.so or libx.a) I use the -llibname 
#   option, something like (this will link in libmylib.so and libm.so:
LIBS = -lSDL -lSDL_image -lSDL_ttf

# define the C object files 
#
# This uses Suffix Replacement within a macro:
#   $(name:string1=string2)
#         For each word in 'name' replace 'string1' with 'string2'
# Below we are replacing the suffix .c of all words in the macro SRCS
# with the .o suffix
#
OBJS = $(SRCS:.cpp=.o)

# define the package file (*.tar)
MAIN = tictac

# define target name (for source and executable files
TARFILE = $(MAIN).tar

#
# The following part of the makefile is generic; it can be used to 
# build any executable just by changing the definitions above and by
# deleting dependencies appended to the file from 'make depend'
#

.PHONY: depend clean

all:    $(MAIN)
	@echo Tutorial: www.sdltutorials.com/sdl-tutorial-tic-tac-toe

$(MAIN): $(OBJS) 
	$(CC) $(CFLAGS) $(INCLUDES) -o $(MAIN) $(OBJS) $(LFLAGS) $(LIBS)

# this is a suffix replacement rule for building .o's from .c's
# it uses automatic variables $<: the name of the prerequisite of
# the rule(a .c file) and $@: the name of the target of the rule (a .o file) 
# (see the gnu make manual section about automatic variables)
.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<  -o $@

clean:
	$(RM) $(OBJS) *.bak *~ $(TARFILE) $(MAIN)

run: $(MAIN)
	./$(MAIN)

# make an archived tar holding all .c .h and Makefile for distribution
pkg: 
	tar cvf $(TARFILE) $(SRCS) *.h makefile ./gfx/*.bmp

# view the contents of the tar file
viewpkg: 
	tar tvf $(TARFILE)

# extract the contents of the tar file (if it exists)
openpkg: 
	tar xvf $(TARFILE)

depend: $(SRCS)
	makedepend $(INCLUDES) $^

# DO NOT DELETE THIS LINE -- make depend needs it

CApp.o: CApp.h /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
CApp.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
CApp.o: /usr/include/SDL/SDL_platform.h /usr/include/stdio.h
CApp.o: /usr/include/features.h /usr/include/stdc-predef.h
CApp.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
CApp.o: /usr/include/stdlib.h /usr/include/alloca.h /usr/include/string.h
CApp.o: /usr/include/strings.h /usr/include/stdint.h /usr/include/ctype.h
CApp.o: /usr/include/endian.h /usr/include/iconv.h
CApp.o: /usr/include/SDL/begin_code.h /usr/include/SDL/close_code.h
CApp.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
CApp.o: /usr/include/SDL/SDL_endian.h /usr/include/SDL/SDL_mutex.h
CApp.o: /usr/include/SDL/SDL_thread.h /usr/include/SDL/SDL_rwops.h
CApp.o: /usr/include/SDL/SDL_cdrom.h /usr/include/SDL/SDL_cpuinfo.h
CApp.o: /usr/include/SDL/SDL_events.h /usr/include/SDL/SDL_active.h
CApp.o: /usr/include/SDL/SDL_keyboard.h /usr/include/SDL/SDL_keysym.h
CApp.o: /usr/include/SDL/SDL_mouse.h /usr/include/SDL/SDL_video.h
CApp.o: /usr/include/SDL/SDL_joystick.h /usr/include/SDL/SDL_quit.h
CApp.o: /usr/include/SDL/SDL_loadso.h /usr/include/SDL/SDL_timer.h
CApp.o: /usr/include/SDL/SDL_version.h CEvent.h CSurface.h
CApp_OnInit.o: CApp.h /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
CApp_OnInit.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
CApp_OnInit.o: /usr/include/SDL/SDL_platform.h /usr/include/stdio.h
CApp_OnInit.o: /usr/include/features.h /usr/include/stdc-predef.h
CApp_OnInit.o: /usr/include/libio.h /usr/include/_G_config.h
CApp_OnInit.o: /usr/include/wchar.h /usr/include/stdlib.h
CApp_OnInit.o: /usr/include/alloca.h /usr/include/string.h
CApp_OnInit.o: /usr/include/strings.h /usr/include/stdint.h
CApp_OnInit.o: /usr/include/ctype.h /usr/include/endian.h
CApp_OnInit.o: /usr/include/iconv.h /usr/include/SDL/begin_code.h
CApp_OnInit.o: /usr/include/SDL/close_code.h /usr/include/SDL/SDL_audio.h
CApp_OnInit.o: /usr/include/SDL/SDL_error.h /usr/include/SDL/SDL_endian.h
CApp_OnInit.o: /usr/include/SDL/SDL_mutex.h /usr/include/SDL/SDL_thread.h
CApp_OnInit.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
CApp_OnInit.o: /usr/include/SDL/SDL_cpuinfo.h /usr/include/SDL/SDL_events.h
CApp_OnInit.o: /usr/include/SDL/SDL_active.h /usr/include/SDL/SDL_keyboard.h
CApp_OnInit.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
CApp_OnInit.o: /usr/include/SDL/SDL_video.h /usr/include/SDL/SDL_joystick.h
CApp_OnInit.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
CApp_OnInit.o: /usr/include/SDL/SDL_timer.h /usr/include/SDL/SDL_version.h
CApp_OnInit.o: CEvent.h CSurface.h
CApp_OnEvent.o: CApp.h /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
CApp_OnEvent.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
CApp_OnEvent.o: /usr/include/SDL/SDL_platform.h /usr/include/stdio.h
CApp_OnEvent.o: /usr/include/features.h /usr/include/stdc-predef.h
CApp_OnEvent.o: /usr/include/libio.h /usr/include/_G_config.h
CApp_OnEvent.o: /usr/include/wchar.h /usr/include/stdlib.h
CApp_OnEvent.o: /usr/include/alloca.h /usr/include/string.h
CApp_OnEvent.o: /usr/include/strings.h /usr/include/stdint.h
CApp_OnEvent.o: /usr/include/ctype.h /usr/include/endian.h
CApp_OnEvent.o: /usr/include/iconv.h /usr/include/SDL/begin_code.h
CApp_OnEvent.o: /usr/include/SDL/close_code.h /usr/include/SDL/SDL_audio.h
CApp_OnEvent.o: /usr/include/SDL/SDL_error.h /usr/include/SDL/SDL_endian.h
CApp_OnEvent.o: /usr/include/SDL/SDL_mutex.h /usr/include/SDL/SDL_thread.h
CApp_OnEvent.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
CApp_OnEvent.o: /usr/include/SDL/SDL_cpuinfo.h /usr/include/SDL/SDL_events.h
CApp_OnEvent.o: /usr/include/SDL/SDL_active.h /usr/include/SDL/SDL_keyboard.h
CApp_OnEvent.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
CApp_OnEvent.o: /usr/include/SDL/SDL_video.h /usr/include/SDL/SDL_joystick.h
CApp_OnEvent.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
CApp_OnEvent.o: /usr/include/SDL/SDL_timer.h /usr/include/SDL/SDL_version.h
CApp_OnEvent.o: CEvent.h CSurface.h
CApp_OnLoop.o: CApp.h /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
CApp_OnLoop.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
CApp_OnLoop.o: /usr/include/SDL/SDL_platform.h /usr/include/stdio.h
CApp_OnLoop.o: /usr/include/features.h /usr/include/stdc-predef.h
CApp_OnLoop.o: /usr/include/libio.h /usr/include/_G_config.h
CApp_OnLoop.o: /usr/include/wchar.h /usr/include/stdlib.h
CApp_OnLoop.o: /usr/include/alloca.h /usr/include/string.h
CApp_OnLoop.o: /usr/include/strings.h /usr/include/stdint.h
CApp_OnLoop.o: /usr/include/ctype.h /usr/include/endian.h
CApp_OnLoop.o: /usr/include/iconv.h /usr/include/SDL/begin_code.h
CApp_OnLoop.o: /usr/include/SDL/close_code.h /usr/include/SDL/SDL_audio.h
CApp_OnLoop.o: /usr/include/SDL/SDL_error.h /usr/include/SDL/SDL_endian.h
CApp_OnLoop.o: /usr/include/SDL/SDL_mutex.h /usr/include/SDL/SDL_thread.h
CApp_OnLoop.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
CApp_OnLoop.o: /usr/include/SDL/SDL_cpuinfo.h /usr/include/SDL/SDL_events.h
CApp_OnLoop.o: /usr/include/SDL/SDL_active.h /usr/include/SDL/SDL_keyboard.h
CApp_OnLoop.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
CApp_OnLoop.o: /usr/include/SDL/SDL_video.h /usr/include/SDL/SDL_joystick.h
CApp_OnLoop.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
CApp_OnLoop.o: /usr/include/SDL/SDL_timer.h /usr/include/SDL/SDL_version.h
CApp_OnLoop.o: CEvent.h CSurface.h
CApp_OnRender.o: CApp.h /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
CApp_OnRender.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
CApp_OnRender.o: /usr/include/SDL/SDL_platform.h /usr/include/stdio.h
CApp_OnRender.o: /usr/include/features.h /usr/include/stdc-predef.h
CApp_OnRender.o: /usr/include/libio.h /usr/include/_G_config.h
CApp_OnRender.o: /usr/include/wchar.h /usr/include/stdlib.h
CApp_OnRender.o: /usr/include/alloca.h /usr/include/string.h
CApp_OnRender.o: /usr/include/strings.h /usr/include/stdint.h
CApp_OnRender.o: /usr/include/ctype.h /usr/include/endian.h
CApp_OnRender.o: /usr/include/iconv.h /usr/include/SDL/begin_code.h
CApp_OnRender.o: /usr/include/SDL/close_code.h /usr/include/SDL/SDL_audio.h
CApp_OnRender.o: /usr/include/SDL/SDL_error.h /usr/include/SDL/SDL_endian.h
CApp_OnRender.o: /usr/include/SDL/SDL_mutex.h /usr/include/SDL/SDL_thread.h
CApp_OnRender.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
CApp_OnRender.o: /usr/include/SDL/SDL_cpuinfo.h /usr/include/SDL/SDL_events.h
CApp_OnRender.o: /usr/include/SDL/SDL_active.h
CApp_OnRender.o: /usr/include/SDL/SDL_keyboard.h
CApp_OnRender.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
CApp_OnRender.o: /usr/include/SDL/SDL_video.h /usr/include/SDL/SDL_joystick.h
CApp_OnRender.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
CApp_OnRender.o: /usr/include/SDL/SDL_timer.h /usr/include/SDL/SDL_version.h
CApp_OnRender.o: CEvent.h CSurface.h
CApp_OnCleanup.o: CApp.h /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_platform.h /usr/include/stdio.h
CApp_OnCleanup.o: /usr/include/features.h /usr/include/stdc-predef.h
CApp_OnCleanup.o: /usr/include/libio.h /usr/include/_G_config.h
CApp_OnCleanup.o: /usr/include/wchar.h /usr/include/stdlib.h
CApp_OnCleanup.o: /usr/include/alloca.h /usr/include/string.h
CApp_OnCleanup.o: /usr/include/strings.h /usr/include/stdint.h
CApp_OnCleanup.o: /usr/include/ctype.h /usr/include/endian.h
CApp_OnCleanup.o: /usr/include/iconv.h /usr/include/SDL/begin_code.h
CApp_OnCleanup.o: /usr/include/SDL/close_code.h /usr/include/SDL/SDL_audio.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_error.h /usr/include/SDL/SDL_endian.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_mutex.h /usr/include/SDL/SDL_thread.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_cpuinfo.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_events.h /usr/include/SDL/SDL_active.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_keyboard.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_video.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_joystick.h /usr/include/SDL/SDL_quit.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_loadso.h /usr/include/SDL/SDL_timer.h
CApp_OnCleanup.o: /usr/include/SDL/SDL_version.h CEvent.h CSurface.h
CSurface.o: CSurface.h /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
CSurface.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
CSurface.o: /usr/include/SDL/SDL_platform.h /usr/include/stdio.h
CSurface.o: /usr/include/features.h /usr/include/stdc-predef.h
CSurface.o: /usr/include/libio.h /usr/include/_G_config.h
CSurface.o: /usr/include/wchar.h /usr/include/stdlib.h /usr/include/alloca.h
CSurface.o: /usr/include/string.h /usr/include/strings.h
CSurface.o: /usr/include/stdint.h /usr/include/ctype.h /usr/include/endian.h
CSurface.o: /usr/include/iconv.h /usr/include/SDL/begin_code.h
CSurface.o: /usr/include/SDL/close_code.h /usr/include/SDL/SDL_audio.h
CSurface.o: /usr/include/SDL/SDL_error.h /usr/include/SDL/SDL_endian.h
CSurface.o: /usr/include/SDL/SDL_mutex.h /usr/include/SDL/SDL_thread.h
CSurface.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
CSurface.o: /usr/include/SDL/SDL_cpuinfo.h /usr/include/SDL/SDL_events.h
CSurface.o: /usr/include/SDL/SDL_active.h /usr/include/SDL/SDL_keyboard.h
CSurface.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
CSurface.o: /usr/include/SDL/SDL_video.h /usr/include/SDL/SDL_joystick.h
CSurface.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
CSurface.o: /usr/include/SDL/SDL_timer.h /usr/include/SDL/SDL_version.h
CEvent.o: CEvent.h /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
CEvent.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
CEvent.o: /usr/include/SDL/SDL_platform.h /usr/include/stdio.h
CEvent.o: /usr/include/features.h /usr/include/stdc-predef.h
CEvent.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
CEvent.o: /usr/include/stdlib.h /usr/include/alloca.h /usr/include/string.h
CEvent.o: /usr/include/strings.h /usr/include/stdint.h /usr/include/ctype.h
CEvent.o: /usr/include/endian.h /usr/include/iconv.h
CEvent.o: /usr/include/SDL/begin_code.h /usr/include/SDL/close_code.h
CEvent.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
CEvent.o: /usr/include/SDL/SDL_endian.h /usr/include/SDL/SDL_mutex.h
CEvent.o: /usr/include/SDL/SDL_thread.h /usr/include/SDL/SDL_rwops.h
CEvent.o: /usr/include/SDL/SDL_cdrom.h /usr/include/SDL/SDL_cpuinfo.h
CEvent.o: /usr/include/SDL/SDL_events.h /usr/include/SDL/SDL_active.h
CEvent.o: /usr/include/SDL/SDL_keyboard.h /usr/include/SDL/SDL_keysym.h
CEvent.o: /usr/include/SDL/SDL_mouse.h /usr/include/SDL/SDL_video.h
CEvent.o: /usr/include/SDL/SDL_joystick.h /usr/include/SDL/SDL_quit.h
CEvent.o: /usr/include/SDL/SDL_loadso.h /usr/include/SDL/SDL_timer.h
CEvent.o: /usr/include/SDL/SDL_version.h
