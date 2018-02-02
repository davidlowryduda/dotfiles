"""
Colorizer

Sample Usage:

    echo -e $(python colorizer.py '(>")> Hello World <("<)')
"""
import sys

colors = ["\\e[31m",
        "\\e[32m",
        "\\e[33m",
        "\\e[34m",
        "\\e[35m"]

ender = "\\e[0m"

ret = ""
i = 0
for l in str(sys.argv[1]):
    if l not in " \t\n":
        ret += colors[i%5] + l + ender
        i += 1
    else:
        ret += l
print(ret)
