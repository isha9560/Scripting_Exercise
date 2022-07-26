#!/bin/bash

## //This is a Bash script to get the high CPU and Memory usage for the Given Date //##

# Getting Input
echo "Please Enter a date in DD format"
#read input
while true; do
	read input
      if [ -n "$input" ] && [ "$input" -eq "$input" ] 2>/dev/null; then
	if [ $input =~ " " ]
	echo "Please add Inter input in DD format"
	else
	echo "Input is not a number"
   fi	
continue
		if [ $result -gt 31 ]; then
		echo "Plese Enter the value between 01 to 31"
	fi
fi
done



#result=$input
#if [ -z $1 ];then 
#	echo " #### Kuch to input Likho Mere bhai ####"
#	return $1
# elif [ $result -gt 31 ]; then
#	echo "Plese Enter the value between 01 to 31"
#else
#	echo "Samzta nahi kya DD me Format de"
#fi
