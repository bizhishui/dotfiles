#!/usr/bin/env python
import sys
import numpy as np

if len(sys.argv) < 3:
    print("Need more input arguments...")
    exit(1)

f_i = sys.argv[1]
f_o = sys.argv[2]

fo = open(f_o, 'w')
fo.write("#time\ttheta\ttheta_continue\n")

fact = 180./np.pi

if len(sys.argv)==3:
    with open(f_i, 'r') as f:
        time = 0.0
        theta0 = 0.0
        theta = 0.0
        thetaN = 0.0
        timer = 0
        for line in f:
            line = line.split('#', 1)[0]       #split once the string with #
            line = line.rstrip()               #return a copy of the string with trailing characters removed
            if len(line) > 0:
                time, rest = line.split('\t', 1)
                theta0 =  theta
                vx = float(rest.split('\t')[13])
                vz = float(rest.split('\t')[15])
                theta = fact*np.arctan(vx/vz)
                if (theta-theta0)>175:
                    timer = timer+1
                thetaN = theta - timer*180
                fo.write("{}\t{}\t{}\n".format(time, theta, thetaN))
else:
    print("Only accept two parameters!!!")

fo.close()
