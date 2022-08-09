#!/bin/bash
IFS=$'\t'
Ccount=0
StudentName=""
declare -a list
x=0

if [ "$1" == "-c" ]; then 
	while read SName SID CourseCode
	do
		if [ $2 == $SID ]; then 
			Ccount=$((Ccount+1))
			StudentName=$SName
			echo Student $StudentName is registered in $Ccount courses
	        fi

	done <student.txt
fi
if [ -z $StudentName ] && [ "$1" == "-c" ]; then

	echo "No such student"
fi
if [ "$1" == "-g" ]; then
	while read SName SID CourseCode; do
		if [ $2 == $SID ]; then
			StudentName=$SName
		fi
	        if [ -z $StudentName ] && [ "$1" == "-g" ]; then	
			echo "No such student"
		fi
	        done <student.txt
	while read SID Course Grade; do
		if [ $2 == $SID ]; then 
			list+=("$Course   $Grade")
		fi
	done <grades.txt
	if [ -z $StudentName ] && [ "$1" == "-g" ] && [ "$1" != "-c" ]; then
		echo "No such student"
	else 
		echo $StudentName
		for i in "${list[@]}"; do
			echo "$i"
		done
	fi
fi
