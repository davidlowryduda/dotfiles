#!/usr/bin/env python

"""
Colorizer

Sample Usage:

    echo -e $(python colorizer.py '(>")> Hello World <("<)')
"""
import sys

colors = ["\x1b[31m",
        "\x1b[32m",
        "\x1b[33m",
        "\x1b[34m",
        "\x1b[35m"]

ender = "\x1b[0m"

def colorize(text):
    ret = ""
    i = 0
    for l in str(text):
        if l not in " \t\n":
            ret += colors[i%5] + l + ender
            i += 1
        else:
            ret += l
    return ret

def main():
    text = sys.stdin.read()
    colorized_text = colorize(text)
    sys.stdout.write(colorized_text)

if __name__ == '__main__':
    main()
