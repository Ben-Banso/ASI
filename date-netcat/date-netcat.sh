#!/bin/bash

while true; do
	netcat -l -p 3000 -e "/bin/date";
done;
