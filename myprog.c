extern int __declspec(dllimport) foo(int bar);

int main(int argc, char**argv) {
    int v = foo(1);
    v += foo(2);
    return v;
}
