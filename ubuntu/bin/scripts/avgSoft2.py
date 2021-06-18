#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import numpy as np

def main(argv):
	print('Number of arguments:', len(sys.argv), 'arguments.')
	print('Argument List:', str(sys.argv))
	if len(sys.argv) < 5:
		print('Script need four parameters:\n inputfile name, average columm 1 and 2, start time and end time')
		sys.exit(1)

	inputfile = argv[1]
	avgCol1 = argv[2]
	avgCol2 = argv[3]
	startTime = float(argv[4])
	endTime = float(argv[5])
	print('input file = ', inputfile)
	print('average colum 1= ', avgCol1)
	print('average colum 2= ', avgCol2)
	print('start time = ', startTime)
	print('end time = ', endTime)

	time = []
	data1 = []
	data2 = []
	fin = open(inputfile, 'r')
	for line in fin:
		spLine = line.split('\t')
		time.append(spLine[0])
		data1.append(spLine[int(avgCol1)-1])
		data2.append(spLine[int(avgCol2)-1])

	count = 0
	partSum = 0.0
	dataLen = len(time)
	for i in range(dataLen):
		if float(time[i])<=endTime and float(time[i])>=startTime:
			count += 1
			partSum += np.sqrt(float(data1[i])*float(data1[i])+float(data2[i])*float(data2[i]))

	avgData = partSum/count
	print('Average of column ', int(avgCol1)+int(avgCol2), ' = ',avgData)

if __name__ == "__main__":
   main(sys.argv[:])
