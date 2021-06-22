#!/usr/bin/env python
import sys
import numpy as np
import os.path
import subprocess
import shlex

#param1 = in file
#param2 = split from which # '/'
#splitIdx = int(sys.argv[2])
#targetFullFile=line.split('/',splitIdx)[splitIdx]
#the targetFullFile is just the string after this '/'

if len(sys.argv) < 3:
    print("Need more input arguments...")
    exit(1)

f_i = sys.argv[1]
splitIdx = int(sys.argv[2])

remoteServer="jlv@login.mesocentre.univ-amu.fr:"

if len(sys.argv)==3:
    with open(f_i, 'r') as f:
        for line in f:
            source=remoteServer+line
            targetFullFile=line.split('/',splitIdx)[splitIdx]
            #print(targetFullFile)
            targetPath=targetFullFile.rsplit('/',1)[0]
            #print(targetPath)
            if (not os.path.isdir(targetPath)):
                os.makedirs(targetPath)

            #os.system('scp source targetFullFile')
            if (not os.path.isfile(targetFullFile)):
                cmd = 'scp {} {}'.format(source, targetFullFile)
                subprocess.call(shlex.split(cmd))
else:
    print("Only accept two parameters!!!")

