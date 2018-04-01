#!/usr/bin/python
import sys

if len(sys.argv) < 2:
    print "Need more input arguments..."
    exit(1)

def getPntFromFile(inFileName, pIdx):
    with open(inFileName, 'r') as inFile:
        inZone = 0
        timer = 0
        xx = 0.0
        yy = 0.0
        zz = 0.0
        for line in inFile:
            part1 = line.split()[0]
            if part1 == "VECTORS":
                part2 = line.split()[1]
                if part2 == "pos_lim":
                    inZone = 1
#                   print part1, part2
            if (inZone == 1):
#               print timer
                timer = timer + 1
                if (timer == pIdx):
                    xx = part1
                    yy = line.split()[1]
                    zz = line.split()[2]
#                   print xx, yy, zz
                    break
#       print x, y, z
        return xx, yy, zz

# set the point index which will be read and stored in file
pntIdx1 = raw_input("Enter point index which is going to be tracked: ")
pntIdx = int(pntIdx1)
# nb of total files will be treated
nbFils = len(sys.argv)-1
# open the output file
fo = open("trackPnt_"+str(pntIdx)+".txt", 'a')

px = 0.0
py = 0.0
pz = 0.0
idx = 0
for fi in range(nbFils):
    idx = idx + 1
#   print sys.argv[fi+1]
    px, py, pz = getPntFromFile(sys.argv[fi+1], pntIdx)
    fo.write("{}\t{}\t{}\t{}\n".format(idx, px, py, pz))

fo.close()

