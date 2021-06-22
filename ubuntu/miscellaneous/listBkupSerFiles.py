#!/usr/bin/env python
from __future__ import print_function
import os,sys 
#print (sys.version_info)

if len(sys.argv) < 2:
    print("Need one argument: the ser saved frequency")
    exit(1)

if os.path.isfile('bkupSerList.txt'):
    os.remove('bkupSerList.txt')
of = open('bkupSerList.txt', 'a')
for root,dirs,files in os.walk(os.getcwd()): 
    for unin in ['in', 'wall', 'out']:
        if unin in dirs:
            dirs.remove(unin)
    fl = []
    for f in files: 
        if f.endswith(".ser"):
            #fl.append(os.path.join(root,f))
            fl.append(f)
    
    if len(fl) > 1:
        fl.sort()
        print(os.path.join(root,fl[-1]), file=of)
        for idx in range(0, len(fl), int(sys.argv[1])):
            print(os.path.join(root,fl[idx]), file=of)

        of.flush()
        #print (fl)

of.close()
