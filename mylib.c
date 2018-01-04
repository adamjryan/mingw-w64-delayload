#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>

BOOL __declspec(dllexport) WINAPI DllMain(HINSTANCE h, DWORD dwReason, LPVOID p) {
    switch (dwReason) {
        case DLL_PROCESS_ATTACH:
            printf("DllMain DLL_PROCESS_ATTACH\n");
            break;
        case DLL_PROCESS_DETACH:
            printf("DllMain DLL_PROCESS_DETACH\n");
            break;
        case DLL_THREAD_ATTACH:
            printf("DllMain DLL_THREAD_ATTACH\n");
            break;
        case DLL_THREAD_DETACH:
            printf("DllMain DLL_THREAD_DETACH\n");
            break;
        default:
            printf("UNKNOWN DllMain dwReason\n");
            break;
    }
    fflush(stdout);
    return TRUE;
}

int __declspec(dllexport) foo(int bar) {
    int ret = 42 * bar;
    printf("foo(%d) = %d\n", bar, ret);
    fflush(stdout);
    return ret;
}
