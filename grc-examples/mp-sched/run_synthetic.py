#!/usr/local/Cellar/gnuradio/3.9.0.0_3/libexec/venv/bin/python
#
# Copyright 2008 Free Software Foundation, Inc.
#
# This file is part of GNU Radio
#
# SPDX-License-Identifier: GPL-3.0-or-later
#
#

"""
Run synthetic.py for npipes in [1,16], nstages in [1,16]
"""

import re
import sys
import os
import tempfile
from argparse import ArgumentParser


def write_shell_script(f, data_filename, description, ncores, gflops, max_pipes_and_stages):
    """
    f is the file to write the script to
    data_filename is the where the data ends up
    description describes the machine
    ncores is the number of cores (used to size the workload)
    gflops is the estimated GFLOPS per core (used to size the workload)
    """

    f.write("#!/bin/sh\n")
    f.write("(\n")
    if description:
        f.write("echo '#D %s'\n" % (description,))

    for npipes in range(1, max_pipes_and_stages + 1):
        for nstages in range(1, max_pipes_and_stages + 1):
            # We'd like each run of synthetic to take ~10 seconds
            desired_time_per_run = 10
            est_gflops_avail = min(nstages * npipes, ncores) * gflops
            nsamples = (est_gflops_avail * desired_time_per_run) / (512.0 * nstages * npipes)
            nsamples = int(nsamples * 1e9)

            cmd = "./synthetic.py -m -s %d -p %d -N %d\n" % (nstages, npipes, nsamples)
            f.write(cmd)
            f.write('if test $? -ge 128; then exit 128; fi\n')

    f.write(") 2>&1 | grep --line-buffered -v '^>>>' | tee %s\n" % (data_filename,))
    f.flush()



def main():
    description = """%prog gathers multiprocessor scaling data using the ./synthetic.py benchmark.
All combinations of npipes and nstages between 1 and --max-pipes-and-stages are tried.
The -n and -f options provides hints used to size the workload.  We'd like each run
of synthetic to take about 10 seconds.  For the full 16x16 case this results in a
total runtime of about 43 minutes, assuming that your values for -n and -f are reasonable.
For x86 machines, assume 3 FLOPS per processor Hz. E.g., 3 GHz machine -> 9 GFLOPS.
plot_flops.py will make pretty graphs from the output data generated by %prog.
"""
    parser = ArgumentParser(description=description)
    parser.add_argument("-d", "--description", metavar="DESC",
            help="machine description, e.g., \"Dual quad-core Xeon 3 GHz\"")
    parser.add_argument("-n", "--ncores", type=int, default=1,
            help="number of processor cores [default=%(default)s]")
    parser.add_argument("-g", "--gflops", metavar="GFLOPS", type=float, default=3.0,
            help="estimated GFLOPS per core [default=%(default)s]")
    parser.add_argument("-m", "--max-pipes-and-stages", metavar="MAX", type=int, default=16,
            help="maximum number of pipes and stages to use [default=%(default)s]")
    parser.add_argument("output_file_name", metavar="FILE", help="output file name")
    args = parser.parse_args()

    shell = os.popen("/bin/sh", "w")

    write_shell_script(shell,
                       args.output_file_name,
                       args.description,
                       args.ncores,
                       args.gflops,
                       args.max_pipes_and_stages)

if __name__ == '__main__':
    main()

