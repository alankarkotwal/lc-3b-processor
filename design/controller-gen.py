#!/usr/bin/python

# Code to generate the controller for LC-3b
# Author: Alankar Kotwal

# Open all necessary files
statefile = open('states.csv', 'r')
controlfile = open('controls.csv', 'r')
outfile = open('controller.v', 'w')

# Get arrays
stateLines = statefile.readlines()
controlLines = controlfile.readlines()

controlfile.close()
statefile.close()

states = []
for i in stateLines:
	states.append(i.rstrip().split(','))

controls = []	
for i in controlLines:
	controls.append(i.rstrip().split(','))

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
	controlSignalLengths.append(length)

outfile.write(");		// Implements the designed controller for LC-3b.\n\n")

# Specify inputs. We have only IR and CCR Flags
outfile.write ("\tinput  [15:0] IR;\n\tinput  clk, N, Z, P;\n");

for i in range(len(controlSignals)):
	if controlSignalLengths[i]!=0:
		outfile.write("\toutput ["+str(controlSignalLengths[i])+":0] "+controlSignals[i]+";\n")
	else:
		outfile.write("\toutput "+controlSignals[i]+";\n")

outfile.write("\nendmodule");
outfile.close()
