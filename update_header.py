#!/usr/bin/env python3

import sys
import os.path

header =\
[
    "(set-info :smt-lib-version 2.6)",
    "(set-logic AUFBVFPDTNIRA)",
    "(set-info :source |",
    "Generated by: AdaCore",
    "Generated on: 2020-03-06",
    "Generator: SPARK",
    "Application: Program verification for Ada",
    "Target solver: CVC4",
    "|)",
    """(set-info :license "https://creativecommons.org/licenses/by/4.0/")""",
    """(set-info :category "industrial")""",
    "(set-info :status unknown)"
]

def process_file(fn):
    with open(fn, 'r') as f:
        lines = f.readlines()
    # drop 3 lines
    lines = lines[3:]
    with open(fn, 'w') as f:
        for line in header:
            f.write("%s\n" % line)
        f.writelines(lines)


def in_files(dir):
    for root, dirs, files in os.walk(dir):
        for f in files:
            ext = os.path.splitext(f)[1]
            name = os.path.join(root, f)
            process_file(name)



def main():
    for x in range(1, len(sys.argv)):
        if os.path.isdir(sys.argv[x]):
            in_files(sys.argv[x])
        else:
            process_file(sys.argv[x])

main()