#!/bin/bash

while true; do
	xkblayout-state print %s > /tmp/current-layout
	sleep 1
done
