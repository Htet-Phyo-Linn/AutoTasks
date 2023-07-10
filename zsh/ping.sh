#!/bin/bash

#read -p "Enter your subnet : " SUBNET

for IP in $(seq 1 10); do
	ping -c 1 192.16.1.$IP
done

