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
for i in range(1, len(controls[0])):

	# Get header of signal iff header != NULL
	if len(controls[0][i]) != 0:
		outfile.write(", "+controls[0][i])

outfile.write(");		// Implements the designed controller for LC-3b.\n\n")

# Specify inputs. We have only IR and 
outfile.write ("input [15:0] IR;\n\
		input N, Z, P\n");



outfile.close()
