#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
THIS DOESN'T DO WHAT IT CLAIMS.
"""

'''
A stdin to stdout simple utility that takes multiline input and condenses it.
For instance, a markdown file with 80 char width will be condensed through this
to fit wordpress-type markdown (which pays attention to linebreaks because
wordpress is stupid).
'''

import re
import sys
from string import ascii_letters


MULTILINE_RE = r"^```|^'''|^<|^\$\$|^\\begin|^\\end"
ONELINE_RE = r"^\[|^#|^===|^---"

multi_re = re.compile(MULTILINE_RE)
oneline_re = re.compile(ONELINE_RE)

def is_formatted(line):
    if re.match(multi_re, line.lstrip()):
        return True
    elif re.match(oneline_re, line.lstrip()):
        return True
    return False

def detect_format(line, within_formatted):
    if re.match(multi_re, line.lstrip()):
        if not within_formatted:
            start_match = line.lstrip()[0]
            within_formatted = True
            return start_match, within_formatted
        else:
            return '', False
    elif re.match(oneline_re, line.lstrip()):
        if not within_formatted:
            return '', False
        else:
            return '', True
    raise ValueError

def append_to_output(line, output, within_formatted):
    if not within_formatted:
        # Can the following line be replaced with: if [-1] not whitespace?
        if output[-1] in '.,;:?!([{}])' + ascii_letters:
            return output + ' ' + line.rstrip()
        else:
            return output + line.rstrip()
    else:
        if output[-1] != '\n':
            return output + '\n' + line
        else:
            return output + line

if __name__ == "__main__":
    output = ''
    start_match = ''
    within_formatted = False

    for line in sys.stdin.readlines():
        if line == '\n':
            output = output + '\n\n'
        else:
            is_form = is_formatted(line)
            if is_form:
                start_match, within_formatted = detect_format(line, within_formatted)
            output = append_to_output(line, output, within_formatted)

    print(output, end='')
