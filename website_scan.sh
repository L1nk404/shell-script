#!/bin/bash

# Define website
echo "What site do you want to?"
read -r site
echo -e # pular linha

# ping website

ping "$site" -c 1 > log.txt

# Locate ip

ip=$(cat log.txt | grep "icmp_seq" | cut -d "(" -f2 | cut -d ")" -f1)

echo "The ip adress is $ip"

# Identify host status

status=$(cat log.txt | grep "transmitted" | cut -d "," -f2| cut -d " " -f3)

if [ "$status" == "received" ]; then
    echo "Active!"
else
    echo "Inactive!"
fi