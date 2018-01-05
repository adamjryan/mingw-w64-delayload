ifeq ($(ARCH),x86)
    APFX=i686-w64-mingw32-
else ifeq ($(ARCH),x64)
    APFX=x86_64-w64-mingw32-
else
    $(error ARCH must be specified x86 or x64)
endif

AR=$(APFX)ar
CC=$(APFX)gcc
CPP=$(APFX)cpp
CXX=$(APFX)g++
DLLTOOL=$(APFX)dlltool
LD=$(APFX)ld
MC=$(APFX)windmc
RC=$(APFX)windres
STRIP=$(APFX)strip

CFLAGS = -mwin32 -mconsole

all: myprog-$(ARCH).exe myprogdl-$(ARCH).exe

myprog-$(ARCH).exe: myprog.o mylib-$(ARCH).a
	$(CC) -static -static-libgcc -o $@ $^

myprogdl-$(ARCH).exe: myprog.o mylibdl-$(ARCH).a
	$(CC) -static -static-libgcc -o $@ $^

mylib-$(ARCH).a mylibdl-$(ARCH).a: mylib-$(ARCH).def
	$(DLLTOOL) -n -d $< -D mylib-$(ARCH).dll -l mylib-$(ARCH).a -y mylibdl-$(ARCH).a

mylib-$(ARCH).dll mylib-$(ARCH).def: mylib.o
	$(CC) -mdll -o mylib-$(ARCH).dll -Wl,--output-def=mylib-$(ARCH).def $^

clean:
	rm -f *.def *.dll *.exe *.a *.o
