#!/bin/bash
# start subshell in users Desktop directory
# prints out a list of all pdf files
# parent shell iterates over outputed list of files
# and prints them again if they contain the substring "linux"
for i in $(cd ~/Desktop ; echo *.pdf)
do
  echo $i | grep "linux"
done
