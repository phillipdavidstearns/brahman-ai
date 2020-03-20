#!/usr/bin/python3

import csv

A = 50
B = A + 144
C = 36
D = 39
E = 80
F = 40
SERVICE = 24

lengths = [ A+C+D+C+F+SERVICE,
			A+D+C+F+SERVICE,
			A+C+F+SERVICE,
			A+F+SERVICE,
			A+D+F+SERVICE,
			A+D+C+F+SERVICE,
			A+D+C+D+F+SERVICE,
			A+D+C+D+C+F+SERVICE,
			A+B+C+D+C+F+SERVICE,
			A+B+D+C+F+SERVICE,
			A+B+C+F+SERVICE,
			A+B+F+SERVICE,
			A+B+D+F+SERVICE,
			A+B+D+C+F+SERVICE,
			A+B+D+C+D+F+SERVICE,
			A+B+D+C+D+C+F+SERVICE,
			A+E+C+D+C+F+SERVICE,
			A+E+D+C+F+SERVICE,
			A+E+C+F+SERVICE,
			A+E+F+SERVICE,
			A+E+D+F+SERVICE,
			A+E+D+C+F+SERVICE,
			A+E+D+C+D+F+SERVICE,
			A+E+D+C+D+C+F+SERVICE,
			A+B+E+C+D+C+F+SERVICE,
			A+B+E+D+C+F+SERVICE,
			A+B+E+C+F+SERVICE,
			A+B+E+F+SERVICE,
			A+B+E+D+F+SERVICE,
			A+B+E+D+C+F+SERVICE,
			A+B+E+D+C+D+F+SERVICE,
			A+B+E+D+C+D+C+F+SERVICE,
		  ]

def main():
	total=0
	for i in range(len(lengths)):
		length = lengths[i]
		feet=int(length/12)
		inches=length%12
		total+=length
		print("Channel"+str(i+1)+","+str(lengths[i])+","+str(feet)+","+str(inches))

	#print("Total length required: "+str(total)+"\" | "+str(int(total/12))+"\' "+str(total%12)+"\"")

main()