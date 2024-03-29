#!/bin/bash

#point a
wget --no-check-certificate "https://drive.google.com/uc?export=download&id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0" -O Sandbox.csv

#point b
awk -F',' '{sales[$6]+=$17} END {for (customer in sales) print sales[customer], customer}' Sandbox.csv | sort -nr | head -n1

#point c
awk -F',' '{profit[$7]+=$20} END {for (segment in profit) print profit[segment], segment}' Sandbox.csv | sort -n | head -n2 

#point d
awk -F',' '{profit[$14]+=$20} END {for (category in profit) print profit[category], category}' Sandbox.csv | sort -nr | head -n3

#point e 
awk -F',' '$6 ~ /Adriaens/ {print $2,"-",  $18}' Sandbox.csv
