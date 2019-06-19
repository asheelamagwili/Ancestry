#
# Makefile for CSCI 315 - Lab 5
# 

Lab4: Lab5.pl
	swipl --quiet -o Lab5 -c Lab5.pl

clean:
	rm Lab5