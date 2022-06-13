#!/usr/bin/bash

# Run this at start up, bat signal scripts

if ! pgrep -x batsignal > /dev/null;then
	batsignal \
		-b				\
		-w 25 				\
		-W "Low"	 		\
		-c 10 				\
		-C "Charge me now bruh"		\
		-F "Full"			\
		-m 60				\
		-a "Battery"			\
		-I $HOME/usr-scripts/batsignal/src/charger.png
fi	
