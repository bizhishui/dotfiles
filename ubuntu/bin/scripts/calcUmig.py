#!/usr/bin/python
import sys

if len(sys.argv) < 2:
    print "Need more input arguments..."
    exit(1)

finstr = sys.argv[1]

fo = open('Umig.txt', 'a')
fo.write("#time\tYg\tUmig\n")

if len(sys.argv)==2:
    with open(finstr, 'r') as f:
        pos0 = 0.0
        posi = 0.0
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
                pos0 = posi
                posi = rest.split('\t')[8]
                if timer > 1:
                    fo.write("{}\t{}\t{}\n".format(time, posi, (float(posi)-float(pos0))/(float(time)-float(t0))))
elif len(sys.argv)==3:                         # aims to remove error points due to remesh, NOT working
    remeshFreq = sys.argv[2]
    with open(finstr, 'r') as f:
        pos0 = 0.0
        posi = 0.0
        t0 = 0.0
        time = 0.0
        timer = 0
        rmshTimer = 9
        for line in f:
            line = line.split('#', 1)[0]       #split once the string with #
            line = line.rstrip()               #return a copy of the string with trailing characters removed
            if len(line) > 0:
                t0 = time
                time, rest = line.split('\t', 1)
                timer = timer + 1
                rmshTimer = rmshTimer + 1
                pos0 = posi
                posi = rest.split('\t')[8]
                if timer > 1 and rmshTimer != remeshFreq:
                    fo.write("{}\t{}\t{}\n".format(time, posi, (float(posi)-float(pos0))/(float(time)-float(t0))))
                elif rmshTimer == remeshFreq:
                    rmshTimer = 0
else:
    print "Only accept one or two parameters!!!"

fo.close()
