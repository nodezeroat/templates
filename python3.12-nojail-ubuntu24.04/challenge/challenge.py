#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Respect the shebang and mark file as executable

import os

FLAG = os.getenv("FLAG", "flag{DEFAULT_FLAG_PLEASE_SET_ONE}")

def main():
    print(f"Hello World")

    number = input("Give me input: ")
    print(f"Your input was {number}")

    print(f"Here is your flag: {FLAG}")

    exit(0)

if __name__ == '__main__':
    main()
