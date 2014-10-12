#!/usr/bin/python

# Code to generate the controller for LC-3b
# Author: Alankar Kotwal

# Must ensure the following:
# # The first line in the CSV is control signal names. In case of multiple lines per control signal, first column must be control signal name, rest nulls.
# # State number 0 is always reset, state number 1 is always fetch1.
# # All constant-logic signals are in misc.direc

import math, os

# Options
_NEGEDGE =  0
_XVAL = 1

# Open all necessary files
statefile = open('states.csv', 'r')
controlfile = open('controls.csv', 'r')
opfile = open('opcodes.conf', 'r')
miscfile = open('misc.direc', 'r')
outfile = open('controller.v', 'w')

# Get arrays
stateLines = statefile.readlines()
controlLines = controlfile.readlines()
opLines = opfile.readlines()
miscLines = miscfile.readlines()

controlfile.close()
statefile.close()
opfile.close()
miscfile.close()

states = []
for i in stateLines:
	states.append(i.rstrip().split(','))

controls = []	
for i in controlLines:
	controls.append(i.rstrip().split(','))
	
opcodes = []	
for i in opLines:
	opcodes.append(i.rstrip().split(','))

# First write header info
outfile.write("module controller(clk, IR, N, Z, P")

# Write control signals, outputs of FSM
controlSignals = []
controlSignalLengths = []
i=1
while i<len(controls[0]):
	# First write the control signal
	outfile.write(", "+controls[0][i])
	controlSignals.append(controls[0][i])
	i=i+1
	
	# Increment i till you get a non-zero length
	length = 0
	while len(controls[0][i])==0:
		length=length+1
		i=i+1
		if(i==len(controls[0])):
			break
			
	if i==2:
		length = int(math.ceil(math.log(len(controls)+1)))
	controlSignalLengths.append(length)

outfile.write(");		// Implements the designed controller for LC-3b.\n\n")

# Specify inputs. We have only IR and CCR Flags
outfile.write ("\tinput  [15:0] IR;\n\tinput  clk, N, Z, P;\n");

# Specify outputs from controls file
for i in range(len(controlSignals)):
	if controlSignalLengths[i]!=0:
		outfile.write("\toutput reg ["+str(controlSignalLengths[i])+":0] "+controlSignals[i]+";\n")
	else:
		outfile.write("\toutput reg "+controlSignals[i]+";\n")

# Assign constant signals
outfile.write("\n")
for i in miscLines:
	outfile.write("\tassign "+i.rstrip()+";\n")

# Start state machine
if _NEGEDGE == 1:
	outfile.write("\n\talways@(negedge clk) begin\n")
else:
	outfile.write("\n\talways@(posedge clk) begin\n")

# Start switch-case
outfile.write("\t\tcase("+controls[0][1]+")\n")

for state in range(1, len(controls)):
	outfile.write("\t\t\t"+str(state)+": begin\n")
	signalNo = 2
	for controlSignal in range(1, len(controlSignals)):
		outfile.write("\t\t\t\t"+controlSignals[controlSignal]+" = "+str(controlSignalLengths[controlSignal]+1)+"'b")
		signalNoHere = controlSignalLengths[controlSignal]
		while signalNoHere>=0:
			if controls[state][signalNo]=='1' or controls[state][signalNo]=='0':
				outfile.write(controls[state][signalNo])
			elif controls[state][signalNo]=='x':
				outfile.write(str(_XVAL))
			else:
				if signalNoHere == controlSignalLengths[controlSignal]:
					outfile.seek(-3, os.SEEK_END)
					outfile.truncate()
					outfile.write("{"+controls[state][signalNo]+", ")
				elif signalNoHere == 0:
					outfile.write(controls[state][signalNo]+"}")
			signalNo = signalNo+1
			signalNoHere = signalNoHere-1
		outfile.write(";\n")
	
	# Calculate next state here.
	nextState = 0
	outfile.write("\t\t\t\tStateID = "+str(nextState)+";\n")
	outfile.write("\t\t\tend\n")

outfile.write("\t\tendcase\n")

outfile.write("\tend\n")

outfile.write("\nendmodule")
outfile.close()
