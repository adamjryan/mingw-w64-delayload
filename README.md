# mingw-w64-delayload
A minimalistic example for demonstrating a bug in dlltool

Creating a delayloading import lib with dlltool works fine for 64bit targets but crashes for 32bit targets.
This minimalistic example project demonstrates the bug.

Build (on Linux) for 64bit target:
````
make ARCH=x64 clean all
````
You will get mylib-x64.dll, myprog-x64.exe and myprogdl-x64.exe. myprogdl-x64.exe delay-loads mylib-x64.dll and myprog-x64.exe (existing
just for reference) has a direct dependency on mylib-x64.dll instead. Both run fine.

Build (on Linux) for 32bit target:
````
make ARCH=x86 clean all
````
You will get mylib-x86.dll, myprog-x86.exe and myprogdl-x86.exe. myprogdl-x86.exe **should** delay-load mylib-x86.dll and myprog-x86.exe
(existing just for reference) has a direct dependency on mylib-x86.dll instead. Unfortunately, myprogdl-x86.exe just crashes.

Tested on:

 - Fedora 26, using mingw{32,64}-binutils-2.27-2.fc26.x86_64
 - Debian 9 (a.k.a. stretch), using binutils-mingw-w64-i686-2.28-5+7.4+b4 and binutils-mingw-w64-x86-64-2.28-5+7.4+b4
