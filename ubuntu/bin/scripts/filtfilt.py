#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# ploting dose't show
# In the interpreter, check the types of the data on time and amp.
# Are they floats or strings? If they're strings, perhaps it's generating
# a ton of labels on the axes and this takes a lot of time.
# In this case, convert them to floats

import sys
import numpy as np
from scipy import signal
#import matplotlib
#matplotlib.use('Agg')
import matplotlib.pyplot as plt

print('Number of arguments:', len(sys.argv), 'arguments.')
print('Argument List:', str(sys.argv))
if len(sys.argv) < 6:
	print('Script need five parameters:\n inputfile name, which column, \
       start time, end time, and output file name')
	sys.exit(1)

inputfile = sys.argv[1]
manipCol = int(sys.argv[2])
startTime = float(sys.argv[3])
endTime = float(sys.argv[4])
outfile = sys.argv[5]
print('input file = ', inputfile)
print('manipulation colum = ', manipCol)
print('start time = ', startTime)
print('end time = ', endTime)
print('output file = ', outfile)

time0 = []
data0 = []
count = 0
fin = open(inputfile, 'r')
for line in fin:
    line = line.split('#', 1)[0]
    line = line.rstrip()
    if len(line) > 0:
        spLine = line.split('\t')
        tt = float(spLine[0])
        if tt<=endTime and tt>=startTime:
            time0.append(tt)
            data0.append(float(spLine[int(manipCol)-1]))
            count += 1

NN = len(time0)
time = np.asarray(time0)
data = np.asarray(data0)
print('Nb of total data = ', NN)

## show read-in data
#plt.figure(1)
#plt.plot(time, data, 'b')
#plt.xlabel('t')
#plt.ylabel('h')
#plt.grid()
#fig, ax = plt.subplots( nrows=1, ncols=1 )
#ax.plot(time,data)
#fig.savefig('in.png')
#plt.close(fig)

b, a = signal.butter(4, 0.02)
#b, a = signal.ellip(4, 0.01, 120, 0.125)  # Filter to be applied.
y = signal.filtfilt(b, a, data, padlen=50)

## show filtered data
plt.figure(1)
plt.plot(y, 'b')
#plt.plot(data, 'r')
plt.xlabel('t')
plt.ylabel('h')
plt.grid()
fig, ax = plt.subplots( nrows=1, ncols=1 )
ax.plot(y)
#ax.plot(data)
fig.savefig('filtered.png')
plt.close(fig)


#pi2 = np.pi*2.0
#dxmin = np.diff(time).min()
#duration = time.ptp()
#freqs = np.linspace(1/duration, NN/duration, 5*NN)
#periodogram = lombscargle(time, data, freqs, normalize=True)
#
#kmax = periodogram.argmax()
#print("%12.6f" % (freqs[kmax]/pi2,))
#
#fo = open(outfile, 'a')
#fo.write("#frequency\tintensity\n")
#for oo in  range(len(freqs)):
#    fo.write("{}\t{}\n".format( freqs[oo]/pi2, periodogram[oo] ))
#
#fo.close()

#if figOpt == 0 :
#    plt.figure(1)
#    plt.plot(freqs, np.sqrt(4*periodogram/(5*NN)))
#    plt.xlabel('Frequency (rad/s)')
#    plt.grid()
#    plt.axvline(freqs[kmax], color='r', alpha=0.25)
#    plt.show()
#else:
#    fig, ax = plt.subplots( nrows=1, ncols=1 )
#    ax.plot(freqs, np.sqrt(4*periodogram/(5*NN)))
#    fig.savefig('out.png')
#    plt.close(fig)
#


