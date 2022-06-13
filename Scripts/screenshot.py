#!/usr/bin/python

import sys, os


def screenshot(cmd):
    os.system(f'coreshot -f $HOME/Pictures/screenShot/{cmd}.png')
    return None

if __name__ == "__main__":
    mode = str(sys.argv[1])

    if mode == '-s':
        try:
            name = sys.argv[2]
            screenshot(name)
        except:
            screenshot('default')
