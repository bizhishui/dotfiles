#!/usr/bin/env python
import sys

if len(sys.argv) < 2:
    print("Need more input arguments...")
    exit(1)

finstr = sys.argv[1]

fo = open('./Umig.txt', 'a')
fo.write("#time\tXg\tUx\tYg\tUy\tZg\tUz\n")

if len(sys.argv)==2:
    with open(finstr, 'r') as f:
        pos0x = 0.0
        pos0y = 0.0
        pos0z = 0.0
        posx = 0.0
        posy = 0.0
        posz = 0.0
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
                pos0x = posx
                pos0y = posy
                pos0z = posz
                posx = rest.split('\t')[7]
                posy = rest.split('\t')[8]
                posz = rest.split('\t')[9]
                delt = float(time)-float(t0)
                if (timer > 1 and delt>1E-4):
                    fo.write("{}\t{}\t{}\t{}\t{}\t{}\t{}\n".format(time, posx, posy, posz, (float(posx)-float(pos0x))/delt, (float(posy)-float(pos0y))/delt, (float(posz)-float(pos0z))/delt))
else:
    print("Only accept one parameter!!!")

fo.close()
