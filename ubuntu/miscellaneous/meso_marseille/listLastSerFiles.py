#!/usr/bin/env python3
import os,sys 
#print (sys.version_info)

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
            fl.append(os.path.join(root,f))
    if len(fl) > 1:
        print(fl[-2], file=of)
        print(fl[-1], file=of)
        of.flush()
        #print (fl[-2])
        #print (fl[-1])

of.close()
