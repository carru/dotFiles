#!/bin/bash

read -s pw

devstore extend 1 -h 144 -u c4c -p ${pw}
devstore extend 2 -h 144 -u c4c -p ${pw}
devstore extend 3 -h 144 -u c4c -p ${pw}
devstore extend 4 -h 144 -u c4c -p ${pw}
devstore extend 1 -t W -h 144 -u c4c -p ${pw}
