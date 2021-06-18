#!/usr/bin/env python
import sys

if len(sys.argv) < 3:
    print("Need more input arguments...")
    exit(1)

f_i = sys.argv[1]
f_o = sys.argv[2]

fo = open(f_o, 'w')
fo.write("#time\ttheta\ttheta_continue\tdthetadt\n")

if len(sys.argv)==3:
    with open(f_i, 'r') as f:
        thetaDis = 0.0
        theta0 = 0.0
        theta = 0.0
        t0 = 0.0
        time = 0.0
        timer = 0
        for line in f:
            line = line.split('#', 1)[0]       #split once the string with #
            line = line.rstrip()               #return a copy of the string with trailing characters removed
            if len(line) > 0:
                t0 = time
                time, rest = line.split('\t', 1)
                timer = timer + 1
                theta0 = theta
                thetaDis = rest.split('\t')[0]
                theta = rest.split('\t')[1]
                delt = float(time)-float(t0)
                if (timer > 1 and delt>1E-6):
                    fo.write("{}\t{}\t{}\t{}\n".format(time, thetaDis, theta, (float(theta)-float(theta0))/delt))
else:
    print("Only accept two parameters!!!")

fo.close()
