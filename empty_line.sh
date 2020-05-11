#!/bin/bash

while read line; do
	if [[ -z $line ]] ; then
		echo "Empty line"
	else
		echo $line
	fi
done < fichier.txt
