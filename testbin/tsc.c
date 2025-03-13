#include <stdio.h>
static inline unsigned long long rdtsc() {
    unsigned int lo, hi;
    asm volatile("rdtsc" : "=a"(lo), "=d"(hi));
    return ((unsigned long long)hi << 32) | lo;
}
int main() {
    for (int i = 0; i < 5; i++) printf("TSC: %llu\n", rdtsc());
    return 0;
}