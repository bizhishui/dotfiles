#!/usr/bin/env python
from __future__ import print_function
import os,sys 
from datetime import datetime
#print (sys.version_info)

saveFreq=10
if len(sys.argv) < 2:
    print("Need one argument: the ser saved frequency")
    print("The dafault value 10 is used")
else:
    saveFreq = int(sys.argv[1])

now = datetime.now()
date_time = now.strftime("%Y%m%d-%H%M%S")
#if os.path.isfile('bkupSerList.txt'):
#    os.remove('bkupSerList.txt')
of = open('bkupSerList_'+date_time+'.txt', 'a')
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
        for idx in range(0, len(fl), saveFreq):
            print(os.path.join(root,fl[idx]), file=of)

        of.flush()
        #print (fl)

of.close()
