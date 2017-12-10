#!/bin/sh

# Makes right alt act like another super key
# to be used only on Chromebook

xmodmap -e 'remove mod1 = Alt_R'
xmodmap -e 'add mod4 = Alt_R'
