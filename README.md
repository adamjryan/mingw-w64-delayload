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
You will get mylib-x86.dll, myprog-x86.exe and myprogdl-x86.exe. myprogdl-x86.exe should delay-load mylib-x86.dll and myprog-x86.exe
(existing just for reference) has a direct dependency on mylib-x86.dll instead. Both run fine.
