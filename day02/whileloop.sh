#!/bin/bash

num=1
while [[ $((num%2)) -eq 0 && $num -le 10 ]]
do 
	echo "lol$num"
	num=$((num+1))
done
