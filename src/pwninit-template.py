#!/usr/bin/env python3

from pwn import *

{bindings}
context.binary = {bin_name}

def conn():
    if args.REMOTE:
        r = remote("addr", 1337)
    else:
        r = process([exe.path])
        if args.GDB:
            context.terminal = ['tmux', 'splitw', '-h']
            gdb.attach(r)
    return r

def main():
    r = conn()

    # good luck pwning :)

    r.interactive()

if __name__ == "__main__":
    main()
