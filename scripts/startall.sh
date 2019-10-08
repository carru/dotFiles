#!/bin/bash

read -s pw

devstore start 1 -h 144 -u c4c -p ${pw} -role BPM
devstore start 2 -h 144 -u c4c -p ${pw} -role BPM
devstore start 3 -h 144 -u c4c -p ${pw} -role BPM
#devstore start 4 -h 144 -u c4c -p ${pw} -role BPM
devstore start 1 -t W -h 144 -u c4c -p ${pw} -role "Generic-UI"
