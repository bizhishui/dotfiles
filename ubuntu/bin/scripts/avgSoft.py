#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

def main(argv):
	print('Number of arguments:', len(sys.argv), 'arguments.')
	print('Argument List:', str(sys.argv))
	if len(sys.argv) < 5:
		print('Script need four parameters:\n inputfile name, average columm, start time and end time')
		sys.exit(1)

	inputfile = argv[1]
	avgCol = argv[2]
	startTime = float(argv[3])
	endTime = float(argv[4])
	print('input file = ', inputfile)
	print('average colum = ', avgCol)
	print('start time = ', startTime)
	print('end time = ', endTime)

	time = []
	data = []
	fin = open(inputfile, 'r')
	for line in fin:
		spLine = line.split('\t')
		time.append(spLine[0])
		data.append(spLine[int(avgCol)-1])

	count = 0
	partSum = 0.0
	dataLen = len(time)
	for i in range(dataLen):
		if float(time[i])<=endTime and float(time[i])>=startTime:
			count += 1
			partSum += float(data[i])

	avgData = partSum/count
	print('Average of column ', int(avgCol), ' = ',avgData)

if __name__ == "__main__":
   main(sys.argv[:])
