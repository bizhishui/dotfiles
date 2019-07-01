#!/usr/bin/python
import sys
import numpy as np

if len(sys.argv) < 2:
    print("Need more input arguments...")
    exit(1)

def computeDaDt(inFileName):
    print("propocess on file: %s" % inFileName)
    with open(inFileName, 'r') as inFile:
        inZone = 0
        timer = 0
        xx = 0.0
        yy = 0.0
        zz = 0.0
        da = 0.0
        dt = 0.0
        xmp = 0.1
        xmm = -0.1
        temp = 0.0
        for line in inFile:
            part1 = line.split()[0]
            if inZone == 0:
                if part1 == "VECTORS":
                    part2 = line.split()[1]
                    if part2 == "pos_lim":
                        inZone = 1
                        continue
#                       print part1, part2
            if (inZone == 1):
#               print timer
                timer = timer + 1
                if timer < 643:
                    xx = float(part1)
                    yy = float(line.split()[1])
                    zz = float(line.split()[2])
                    if (xx > xmp):
                        xmp = xx
                    if (xx < xmm):
                        xmm = xx
                    temp = np.sqrt(yy*yy + zz*zz)
                    if (temp > dt):
                        dt = temp
                    #print('{}\t{}\t{}'.format(xx, yy, zz))
                else:
                    da = xmp - xmm
                    dt *= 2.0
                    break
        return da, dt

# nb of total files will be treated
nbFils = len(sys.argv)-1
# open the output file
fo = open("pinceDaDt.txt", 'a')

px = 0.0
py = 0.0
pz = 0.0
idx = 0
for fi in range(nbFils):
    idx = idx + 1
#   print sys.argv[fi+1]
    da, dt = computeDaDt(sys.argv[fi+1])
    fo.write("{}\t{}\t{}\n".format(idx, da, dt))

fo.close()

