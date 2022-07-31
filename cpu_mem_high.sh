#!/bin/bash

## //This is a Bash script to get the high CPU and Memory usage for the Given Date //##
# Getting Input
Check_if_sar_installed=`sar -V >/dev/null 2>&1`
if [ "$?" -ne 0 ]; then
echo
	echo ".... Please check if the sar utility is installed!...."
echo
else
	
while true; do
read -p "Please Enter a date in DD format like 01-31: " input

	if [ -z "$input" ] ; then
	echo
		echo "You did not enter anything, please add date in DD format from 01-31"
	echo
	continue
	elif [[ $input =~ ^[[:al:]]+$ ]]; then
	echo
		echo "you have entered alphabets"
	echo
	continue

	elif [[ $input =~ ^[0-9]+$ ]]; then
		if [[ $input -lt 0 || $input -gt 31 ]] ; then
		echo
		echo "seems the number is not in between 01-31"
		echo
		continue
		else
			num="${input//[^[:digit:]]/}"
			if [[ ${#num} -eq 2 ]]; then
				i=$input
				if [ -f /var/log/sa/sa$i >/dev/null 2>&1 ]; then
					Mem=`sar -t -r -f /var/log/sa/sa$i|awk '/%memused/,/^var\/log\/sa\/sa$i:$/'|egrep -v "Average|%memused"|awk '{print $(NF-13)""$NF}'|sort -k6 -n|tail -1`
					Cpu=` sar -t -P ALL -f /var/log/sa/sa27|awk '/%idle/,/^var\/log\/sa\/sa27:$/'|egrep -v "Average|idle"|awk 'NF{print $(NF-9)}'|sort -k9 -n|head -1`
					
					#x=`echo 100-$Cpu|bc`	
					echo
					echo "Highest Memory Utilization for $input date is : "

echo "+-------------------------------------------------------------------------------------------------------------------+"
echo "|Time:     kbmemfree kbmemused  %memused kbbuffers kbcached  kbcommit   %commit  kbactive   kbinact   kbdirty  |"
echo "+-------------------------------------------------------------------------------------------------------------------+"
echo $Mem
					echo
					echo "Highest CPU Utilization for $input date is :"

echo "+-------------------------------------------------------------------------------------------------------------------+"
echo "|Time:      CPU      %usr     %nice      %sys   %iowait    %steal      %irq     %soft    %guest    %gnice     %idle |"
echo "+-------------------------------------------------------------------------------------------------------------------+"
echo $Cpu
					exit
				else
					echo
					echo "No Data is avaiable for the date $i"
					echo
					exit
				fi	
			else
				echo
				echo "You should enter only two digit date in 01-31 "
				echo
				continue
			fi
		fi

fi
done
fi
